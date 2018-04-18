#include <iostream>
#include <iomanip>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include <math.h>
#include <glad/glad.h>
#include <GLFW/glfw3.h>
#include <sys/stat.h>
#include "stb_image.h"

#define STB_IMAGE_IMPLEMENTATION
#include "stb_image.h"

static void error_callback(int error, const char *description) {
    std::cerr << "GLFW Error: " << description << std::endl;
}

float cx = -1.0, cy = -0.5, zoom = 1.0;
int itr = 100;
int fps = 0;
int p = 2;

GLFWwindow *window = nullptr;

int w = 952;
int h = 474;

GLuint program;
GLuint shader;

double last_time = 0, current_time = 0;
unsigned int ticks = 0;

bool keys[1024] = { 0 };

static void cursor_callback(GLFWwindow* window, double xpos, double ypos)
{
}

void mouse_button_callback(GLFWwindow* window, int button, int action, int mods)
{
    double xpos, ypos;
    glfwGetCursorPos(window, &xpos, &ypos);

    double xr = 2.0 * (xpos / (double)w - 0.5);
    double yr = 2.0 * (ypos / (double)h - 0.5);

    if(button == GLFW_MOUSE_BUTTON_LEFT && action == GLFW_PRESS) {
        cx += (xr - cx) / zoom / 2.0;
        cy -= (yr - cy) / zoom / 2.0;
    }
}

void scroll_callback(GLFWwindow* window, double xoffset, double yoffset)
{
    zoom += yoffset * 0.1 * zoom;
    if(zoom < 0.1) {
        zoom = 0.1;
    }
}

static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
    const double d = 0.1 / zoom;

    if(action == GLFW_PRESS) {
        keys[key] = true;
    } else if(action == GLFW_RELEASE) {
        keys[key] = false;
    }

    if(keys[GLFW_KEY_ESCAPE]) {
        glfwSetWindowShouldClose(window, 1);
    } else if(keys[GLFW_KEY_A]) {
        cx -= d;
    } else if(keys[GLFW_KEY_D]) {
        cx += d;
    } else if(keys[GLFW_KEY_W]) {
        cy += d;
    } else if(keys[GLFW_KEY_S]) {
        cy -= d;
    } else if(keys[GLFW_KEY_MINUS]) {
        itr += 10;
    } else if(keys[GLFW_KEY_EQUAL]) {
        itr -= 10;
        if(itr <= 0) {
            itr = 0;
        }
    } else if(keys[GLFW_KEY_2]) {
        p = 2;
    } else if(keys[GLFW_KEY_3]) {
        p = 3;
    } else if(keys[GLFW_KEY_4]) {
        p = 4;
    }else if(keys[GLFW_KEY_5]) {
        p = 5;
    }else if(keys[GLFW_KEY_6]) {
        p = 6;
    }else if(keys[GLFW_KEY_7]) {
        p = 7;
    } else if(keys[GLFW_KEY_8]) {
        p = 8;
    }
}

const char* vertex_shader =
        "#version 410\n"
                "in vec3 vp;"
                "layout (location=0) in vec3 aPos;"
                "layout (location=1) in vec3 aColor;"
                "layout (location=2) in vec2 aTexCoord;"
                "out vec3 ourColor;"
                "out vec2 TexCoord;"
                "void main () {"
                "   gl_Position = vec4 (aPos, 1.0);"
                "   ourColor = aColor;"
                "   TexCoord = aTexCoord;"
                "}";


static void update_window_title()
{
    std::ostringstream ss;
    ss << "Bryan Bates - Mandelbrot";
    ss << ", Iterations: " << itr;
    ss << ", Zoom: " << zoom;
    ss << ", At: (" << std::setprecision(8) << cx << " + " << cy << "i)";
    glfwSetWindowTitle(window, ss.str().c_str());
}

static void compile_shader(GLuint &prog)
{
    GLuint vs = glCreateShader (GL_VERTEX_SHADER);
    glShaderSource (vs, 1, &vertex_shader, NULL);
    glCompileShader (vs);

    int success2;
    char infoLog[512];
    glGetShaderiv(vs, GL_COMPILE_STATUS, &success2);
    if (!success2)
    {
        glGetShaderInfoLog(vs, 512, NULL, infoLog);
        std::cout << "ERROR::SHADER::VERTEX::COMPILATION_FAILED\n" << infoLog << std::endl;
    }

    std::ifstream t("../shader.glsl");
    if(!t.is_open()) {
        std::cerr << "Cannot open shader.glsl!" << std::endl;
        return;
    }
    std::string str((std::istreambuf_iterator<char>(t)),
                    std::istreambuf_iterator<char>());
    const char *src  = str.c_str();

    GLuint fs = glCreateShader (GL_FRAGMENT_SHADER);
    glShaderSource (fs, 1, &src, NULL);
    glCompileShader (fs);

    int success;
    glGetShaderiv(fs, GL_COMPILE_STATUS, &success);
    if(!success) {
        int s;
        glGetShaderiv(fs, GL_INFO_LOG_LENGTH, &s);

        char *buf = new char[s];
        glGetShaderInfoLog(fs, s, &s, buf);

        std::cerr << buf << std::endl;
        delete [] buf;
        return;
    }

    prog = glCreateProgram ();
    glAttachShader (prog, fs);
    glAttachShader (prog, vs);
    glLinkProgram (prog);

    glGetProgramiv(prog, GL_LINK_STATUS, &success);
    if(!success) {
        int s;
        glGetProgramiv(prog, GL_INFO_LOG_LENGTH, &s);

        char *buf = new char[s];
        glGetProgramInfoLog(prog, s, &s, buf);

        std::cerr << buf << std::endl;
        delete [] buf;
        return;
    }

    glDeleteShader(vs);
    glDeleteShader(fs);
}

static time_t last_mtime;

static time_t get_mtime(const char *path)
{
    struct stat statbuf;
    if (stat(path, &statbuf) == -1) {
        perror(path);
        exit(1);
    }
    return statbuf.st_mtime;
}

int main(int argc, char *argv[])
{
    if(!glfwInit()) {
        std::cerr << "Failed to init GLFW" << std::endl;
        return 1;
    }

    //atexit(glfwTerminate);

    glfwSetErrorCallback(error_callback);

    glfwInit();

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    window = glfwCreateWindow(w, h, "Mandelbrot", NULL, NULL);
    if(!window) {
        std::cerr << "Failed to create window" << std::endl;
        glfwTerminate();
        return 1;
    }

    glfwMakeContextCurrent(window);

    glfwSetKeyCallback(window, key_callback);
    glfwSetCursorPosCallback(window, cursor_callback);
    glfwSetMouseButtonCallback(window, mouse_button_callback);
    glfwSetScrollCallback(window, scroll_callback);
    glfwSetInputMode(window, GLFW_CURSOR, GLFW_CURSOR_NORMAL);

    if (!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress))
    {
        std::cout << "Failed to initialize GLAD" << std::endl;
        return -1;
    }

    std::cout << "Renderer: " << glGetString(GL_RENDERER) << std::endl;
    std::cout << "OpenGL Version: " << glGetString(GL_VERSION) << std::endl;

    GLuint prog;
    compile_shader(prog);

    float points[] = {
            -0.2f,  0.2f,  0.0f,
            -0.2f,  -0.2f,  0.0f,
            0.2f,  -0.2f,  0.0f,

            -0.2f,  0.2f,  0.0f,
            0.2f,  -0.2f,  0.0f,
            0.2f,  0.2f,  0.0f,
    };

    float vertices[] = {
            // positions          // colors           // texture coords
            1.0f,  1.0f, 0.0f,   1.0f, 0.0f, 0.0f,   1.0f, 1.0f,   // top right
            1.0f, -1.0f, 0.0f,   0.0f, 1.0f, 0.0f,   1.0f, 0.0f,   // bottom right
            -1.0f, -1.0f, 0.0f,   0.0f, 0.0f, 1.0f,   0.0f, 0.0f,   // bottom left
            -1.0f,  1.0f, 0.0f,   1.0f, 1.0f, 0.0f,   0.0f, 1.0f    // top left
    };

    unsigned int indices[] = {
            0, 1, 3, // first triangle
            1, 2, 3  // second triangle
    };


    last_mtime = get_mtime("../shader.glsl");

    GLuint vbo = 0;
    glGenBuffers (0, &vbo);
    glBindBuffer (GL_ARRAY_BUFFER, vbo);
    glBufferData (GL_ARRAY_BUFFER, sizeof (points), points, GL_STATIC_DRAW);

    GLuint vao = 0;
    glGenVertexArrays (0, &vao);
    glBindVertexArray (vao);
    glEnableVertexAttribArray (0);
    glVertexAttribPointer (0, 3, GL_FLOAT, GL_FALSE, 0, NULL);

    GLuint VBO = 0;
    glGenBuffers (1, &VBO);
    glBindBuffer (GL_ARRAY_BUFFER, VBO);
    glBufferData (GL_ARRAY_BUFFER, sizeof (vertices), vertices, GL_STATIC_DRAW);

    GLuint VAO = 0;
    glGenVertexArrays (1, &VAO);
    glBindVertexArray (VAO);

    GLuint EBO;
    glGenBuffers(1, &EBO);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
    //glBindVertexArray(EBO);

    // position attribute
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)0);
    glEnableVertexAttribArray(0);
    // color attribute
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(3 * sizeof(float)));
    glEnableVertexAttribArray(1);
    // texture coord attribute
    glVertexAttribPointer(2, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(float), (void*)(6 * sizeof(float)));
    glEnableVertexAttribArray(2);

    last_time = glfwGetTime();
    glUseProgram (prog);

    // Textures
    GLuint tex;
    glGenTextures(1, &tex);
    glBindTexture(GL_TEXTURE_2D, tex);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

    int w_tex, h_tex, nrChannels;
    stbi_set_flip_vertically_on_load(true);
    unsigned char* image = stbi_load("../rad1.png", &w_tex, &h_tex, &nrChannels, 0);

    if (image)
    {
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w_tex, h_tex, 0, GL_RGBA, GL_UNSIGNED_BYTE, image);
        glGenerateMipmap(GL_TEXTURE_2D);

    }
    else
    {
        std::cout << "Failed to load texture" << std::endl;
    }


    stbi_image_free(image);

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    int iterator = 0;
    while(!glfwWindowShouldClose(window)) {
        time_t new_time = get_mtime("../shader.glsl");
        if(new_time != last_mtime) {
            glDeleteProgram(prog);
            compile_shader(prog);
            glUseProgram(prog);
            last_mtime = new_time;

            std::cout << "Reloaded shader: " << last_mtime << std::endl;
        }
        glfwGetWindowSize(window, &w, &h);

        glClear (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

        glActiveTexture(GL_TEXTURE);
        glBindTexture(GL_TEXTURE_2D, tex);


        glUseProgram(prog);
        glBindVertexArray(vao);
        glBindBuffer(GL_ARRAY_BUFFER, vbo);
        glDrawArrays (GL_TRIANGLES, 0, 6);

        if (iterator > 1) {
            glUniform2f(glGetUniformLocation(prog, "screen_size"), (float) w, (float) h);
            glUniform1f(glGetUniformLocation(prog, "screen_ratio"), (float) w / (float) h);
            glUniform2f(glGetUniformLocation(prog, "center"), cx, cy);
            glUniform1f(glGetUniformLocation(prog, "zoom"), zoom);
            glUniform1i(glGetUniformLocation(prog, "itr"), itr);
            glUniform1i(glGetUniformLocation(prog, "p"), p);
        }
        iterator += 1;



        glBindVertexArray(VAO);
        glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, EBO);
        //glUseProgram(prog);
        glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, 0);
        glDrawArrays (GL_TRIANGLES, 0, 6);




        glfwSwapBuffers(window);
        glfwPollEvents();

        ticks++;
        current_time = glfwGetTime();
        if(current_time - last_time > 1.0) {
            fps = ticks;
            update_window_title();
            last_time = glfwGetTime();
            ticks = 0;
        }
    }

    glfwDestroyWindow(window);
}



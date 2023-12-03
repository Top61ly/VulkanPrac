#include "VKManager.h"

#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>

void VKManager::init()
{
    _initWindow();
}

void VKManager::run()
{
    while (!glfwWindowShouldClose(m_window))
    {
        glfwPollEvents();
    }

    cleanup();
}

void VKManager::_initWindow()
{
    glfwInit();

    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);

    m_window = glfwCreateWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Vulkan", nullptr, nullptr);
}

void VKManager::cleanup()
{
    glfwDestroyWindow(m_window);

    glfwTerminate();
}

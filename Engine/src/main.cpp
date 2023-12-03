#include <iostream>
#include <vector>
#include <string>

#include "Graphics/GraphicsVK/VKManager.h"

int main()
{
    VKManager vkManager;

    try
    {
        vkManager.init();
        vkManager.run();
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << std::endl;
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
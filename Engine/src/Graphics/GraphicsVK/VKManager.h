#pragma once
#include <vulkan/vulkan.h>
#include <vector>
#include <optional>

class GLFWwindow;

struct QueueFamilyIndices
{
    std::optional<uint32_t> graphicsFamily;
    std::optional<uint32_t> presentFamily;

    bool isComplete()
    {
        return graphicsFamily.has_value() && presentFamily.has_value();
    }
};

struct SwapChainSupportDetails
{
    VkSurfaceCapabilitiesKHR capabilities;
    std::vector<VkSurfaceFormatKHR> formats;
    std::vector<VkPresentModeKHR> presentModes;
};

class VKManager
{
public:
    void init();
    void run();
    void cleanup();

private:
    void _initWindow();
    void _initVulkan();

    void _createInstance();
    void _createSurface();
    void _pickPhysicalDevice();
    void _createLogicalDevice();
    void _createSwapchain();
    void _createImageViews();
    void _createRenderPass();
    void _createGraphicsPipeline();
    void _createFramebuffers();
    void _createCommandPool();
    void _createCommandBuffers();
    void _createSemaphores();
    void _createSyncObjects();
    void _drawFrame();
    void _recordCommandBuffer(VkCommandBuffer commandBuffer, uint32_t imageIndex);
private:
    QueueFamilyIndices _findQueueFamilies(VkPhysicalDevice device);
    SwapChainSupportDetails _querySwapChainSupport(VkPhysicalDevice device);
    VkSurfaceFormatKHR _chooseSwapSurfaceFormat(const std::vector<VkSurfaceFormatKHR> &availableFormats);
    VkExtent2D _chooseSwapExtent(const VkSurfaceCapabilitiesKHR &capabilities);
    VkPresentModeKHR _chooseSwapPresentMode(const std::vector<VkPresentModeKHR> &availablePresentModes);
    VkShaderModule _createShaderMoule(const std::vector<char> &code);

private:
    const int WINDOW_WIDTH = 800;
    const int WINDOW_HEIGHT = 600;

    GLFWwindow *m_window = nullptr;

    VkPhysicalDevice m_physicalDevice = VK_NULL_HANDLE;
    VkDevice m_device = VK_NULL_HANDLE;
    VkInstance m_instance = VK_NULL_HANDLE;

    VkQueue m_graphicsQueue = VK_NULL_HANDLE;
    VkQueue m_presentQueue = VK_NULL_HANDLE;
    VkSurfaceKHR m_surface = VK_NULL_HANDLE;
    VkSwapchainKHR m_swapchain = VK_NULL_HANDLE;
    VkFormat m_swapchainImageFormat;
    VkExtent2D m_swapchainExtent;
    VkRenderPass m_renderPass = VK_NULL_HANDLE;
    VkPipelineLayout m_pipelineLayout = VK_NULL_HANDLE;
    VkPipeline m_graphicsPipeline = VK_NULL_HANDLE;
    VkCommandPool m_commandPool = VK_NULL_HANDLE;

    std::vector<VkImage> m_swapchainImages;
    std::vector<VkImageView> m_swapchainImageViews;
    std::vector<VkFramebuffer> m_swapchainFramebuffers;

    VkCommandBuffer m_commandBuffer;

    VkSemaphore m_imageAvailableSemaphore = VK_NULL_HANDLE;
    VkSemaphore m_renderFinishedSemaphore = VK_NULL_HANDLE;
    VkFence m_inFlightFence;
};

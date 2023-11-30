ASSEMBLY:= Engine/src
BUILD_DIR:= bin
TARGET:= main

COMPILER_FLAGS:= -std=c++20
INCLUDE_FLAGS:= -IEngine/src -I$(VULKAN_SDK)/include -I$(VULKAN_SDK)/lib
LINKER_FLAGS:= -lvulkan
SRC_FILES:= $(shell find $(ASSEMBLY) -type f \( -name "*.cpp" \))

.PHONY: build
build:
	@clang++ $(COMPILER_FLAGS) $(INCLUDE_FLAGS) $(LINKER_FLAGS) $(SRC_FILES) -o $(BUILD_DIR)/$(TARGET)

.PHONY: run
run:
	@./$(BUILD_DIR)/$(TARGET)
ASSEMBLY:= Engine/src
BUILD_DIR:= bin
TARGET:= app

COMPILER_FLAGS:= -std=c++20
INCLUDE_FLAGS:= -IExternal/include -LExternal/lib -I$(VULKAN_SDK)/include -L$(VULKAN_SDK)/lib
LINKER_FLAGS:= -lvulkan
SRC_FILES:= $(shell find $(ASSEMBLY) -type f \( -name "*.cpp" \))

GLFWlib:= External/lib/libglfw.3.3.dylib

.PHONY: build
build:
	@clang++ $(COMPILER_FLAGS) $(INCLUDE_FLAGS) $(LINKER_FLAGS) $(SRC_FILES) $(GLFWlib) -o $(BUILD_DIR)/$(TARGET)

.PHONY: run
run:
	@./$(BUILD_DIR)/$(TARGET)

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)/*

.PHONY: build_run
build_run: build run
ASSEMBLY:= Engine/src
BUILD_DIR:= bin
TARGET:= app

COMPILER_FLAGS:= -std=c++17
INCLUDE_FLAGS:= -IExternal/include -LExternal/lib -I$(VULKAN_SDK)/include -L$(VULKAN_SDK)/lib -IEngine/src
LINKER_FLAGS:= -lvulkan
SRC_FILES:= $(shell find $(ASSEMBLY) -type f \( -name "*.cpp" \))

GLFWlib:= External/lib/libglfw.3.3.dylib

DXC_COMPILER:=/Users/yao.liu/SDK/VulkanSDK/1.3.261.1/macOS/bin/dxc

HLSLPATH:=./Shaders/HLSL/
OUTPUTPATH:=./Shaders/Output/
STAGE:=vs
FUNCNAME:=vert
SHADERVERSION:=6_4
INFILE:=This_is_a_null_input_hlsl_file
OUTFILE:=This_is_a_null_output_spv_file

.PHONY: dxc
dxc:
	@echo "---Compile DXC Shader to Spirv---"
	@echo "Shader Version is $(SHADERVERSION)"
	@echo "Compile Shader Stage $(STAGE)"
	@echo "Compile commands: $(DXC_COMPILER) -spirv -T $(STAGE)_$(SHADERVERSION) -E $(FUNCNAME) $(HLSLPATH)$(INFILE) -Fo $(OUTPUTPATH)$(OUTFILE)"
	@$(DXC_COMPILER) -spirv -T $(STAGE)_$(SHADERVERSION) -E $(FUNCNAME) $(HLSLPATH)$(INFILE) -Fo $(OUTPUTPATH)$(OUTFILE)
	@echo "---------End of Compile----------"

dxc_vs: dxc

dxc_ps: FUNCNAME=frag
dxc_ps: STAGE=ps
dxc_ps: dxc

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


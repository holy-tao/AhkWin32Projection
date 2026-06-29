#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Direct3D10
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_16BIT_INDEX_STRIP_CUT_VALUE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_32BIT_INDEX_STRIP_CUT_VALUE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_8BIT_INDEX_STRIP_CUT_VALUE := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT := 9

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_CLIP_OR_CULL_DISTANCE_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_CLIP_OR_CULL_DISTANCE_ELEMENT_COUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT := 14

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_HW_SLOT_COUNT := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COUNT := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_FLOWCONTROL_NESTING_LIMIT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_IMMEDIATE_VALUE_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_SAMPLER_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_SAMPLER_REGISTER_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_SAMPLER_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_SAMPLER_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_SAMPLER_SLOT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_SUBROUTINE_NESTING_LIMIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_TEMP_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_TEMP_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_TEMP_REGISTER_COUNT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_TEMP_REGISTER_READS_PER_INST := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_TEMP_REGISTER_READ_PORTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MAX := 10

/**
 * @type {Integer (Int32)}
 */
export global D3D10_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MIN := -10

/**
 * @type {Integer (Int32)}
 */
export global D3D10_COMMONSHADER_TEXEL_OFFSET_MAX_NEGATIVE := -8

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMMONSHADER_TEXEL_OFFSET_MAX_POSITIVE := 7

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_BLEND_FACTOR_ALPHA := 1

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_BLEND_FACTOR_BLUE := 1

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_BLEND_FACTOR_GREEN := 1

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_BLEND_FACTOR_RED := 1

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_BORDER_COLOR_COMPONENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_DEPTH_BIAS := 0

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_DEPTH_BIAS_CLAMP := 0

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_MAX_ANISOTROPY := 16

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_MIP_LOD_BIAS := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_RENDER_TARGET_ARRAY_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_SAMPLE_MASK := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_SCISSOR_ENDX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_SCISSOR_ENDY := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_SCISSOR_STARTX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_SCISSOR_STARTY := 0

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_SLOPE_SCALED_DEPTH_BIAS := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_STENCIL_READ_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_STENCIL_REFERENCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_STENCIL_WRITE_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_VIEWPORT_AND_SCISSORRECT_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_VIEWPORT_HEIGHT := 0

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_VIEWPORT_MAX_DEPTH := 0

/**
 * @type {Float}
 */
export global D3D10_DEFAULT_VIEWPORT_MIN_DEPTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_VIEWPORT_TOPLEFTX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_VIEWPORT_TOPLEFTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEFAULT_VIEWPORT_WIDTH := 0

/**
 * @type {Float}
 */
export global D3D10_FLOAT16_FUSED_TOLERANCE_IN_ULP := 0.6

/**
 * @type {Float}
 */
export global D3D10_FLOAT32_MAX := 3.4028235E+38

/**
 * @type {Float}
 */
export global D3D10_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP := 0.6

/**
 * @type {Float}
 */
export global D3D10_FLOAT_TO_SRGB_EXPONENT_DENOMINATOR := 2.4

/**
 * @type {Float}
 */
export global D3D10_FLOAT_TO_SRGB_EXPONENT_NUMERATOR := 1

/**
 * @type {Float}
 */
export global D3D10_FLOAT_TO_SRGB_OFFSET := 0.055

/**
 * @type {Float}
 */
export global D3D10_FLOAT_TO_SRGB_SCALE_1 := 12.92

/**
 * @type {Float}
 */
export global D3D10_FLOAT_TO_SRGB_SCALE_2 := 1.055

/**
 * @type {Float}
 */
export global D3D10_FLOAT_TO_SRGB_THRESHOLD := 0.0031308

/**
 * @type {Float}
 */
export global D3D10_FTOI_INSTRUCTION_MAX_INPUT := 2.1474836E+09

/**
 * @type {Float}
 */
export global D3D10_FTOI_INSTRUCTION_MIN_INPUT := -2.1474836E+09

/**
 * @type {Float}
 */
export global D3D10_FTOU_INSTRUCTION_MAX_INPUT := 4.2949673E+09

/**
 * @type {Float}
 */
export global D3D10_FTOU_INSTRUCTION_MIN_INPUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_PRIM_CONST_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_PRIM_CONST_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_PRIM_CONST_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_PRIM_CONST_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_PRIM_CONST_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_REGISTER_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_INPUT_REGISTER_VERTICES := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_OUTPUT_ELEMENTS := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_OUTPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_GS_OUTPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_DEFAULT_INDEX_BUFFER_OFFSET_IN_BYTES := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_DEFAULT_PRIMITIVE_TOPOLOGY := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_DEFAULT_VERTEX_BUFFER_OFFSET_IN_BYTES := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_INDEX_INPUT_RESOURCE_SLOT_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_INSTANCE_ID_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_INTEGER_ARITHMETIC_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_PRIMITIVE_ID_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_VERTEX_ID_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_INTEGER_DIVIDE_BY_ZERO_QUOTIENT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_INTEGER_DIVIDE_BY_ZERO_REMAINDER := 4294967295

/**
 * @type {Float}
 */
export global D3D10_LINEAR_GAMMA := 1

/**
 * @type {Float}
 */
export global D3D10_MAX_BORDER_COLOR_COMPONENT := 1

/**
 * @type {Float}
 */
export global D3D10_MAX_DEPTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MAX_MAXANISOTROPY := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MAX_MULTISAMPLE_SAMPLE_COUNT := 32

/**
 * @type {Float}
 */
export global D3D10_MAX_POSITION_VALUE := 3.4028236E+34

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MAX_TEXTURE_DIMENSION_2_TO_EXP := 17

/**
 * @type {Float}
 */
export global D3D10_MIN_BORDER_COLOR_COMPONENT := 0

/**
 * @type {Float}
 */
export global D3D10_MIN_DEPTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MIN_MAXANISOTROPY := 0

/**
 * @type {Float}
 */
export global D3D10_MIP_LOD_BIAS_MAX := 15.99

/**
 * @type {Float}
 */
export global D3D10_MIP_LOD_BIAS_MIN := -16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MIP_LOD_FRACTIONAL_BIT_COUNT := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MIP_LOD_RANGE_BIT_COUNT := 8

/**
 * @type {Float}
 */
export global D3D10_MULTISAMPLE_ANTIALIAS_LINE_WIDTH := 1.4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PIXEL_ADDRESS_RANGE_BIT_COUNT := 13

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_FRONTFACING_DEFAULT_VALUE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_FRONTFACING_FALSE_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_FRONTFACING_TRUE_VALUE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_INPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_INPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_INPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_INPUT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_INPUT_REGISTER_READ_PORTS := 1

/**
 * @type {Float}
 */
export global D3D10_PS_LEGACY_PIXEL_CENTER_FRACTIONAL_COMPONENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_OUTPUT_DEPTH_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_OUTPUT_DEPTH_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_OUTPUT_DEPTH_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_OUTPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_PS_OUTPUT_REGISTER_COUNT := 8

/**
 * @type {Float}
 */
export global D3D10_PS_PIXEL_CENTER_FRACTIONAL_COMPONENT := 0.5

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_BLEND_OBJECT_COUNT_PER_CONTEXT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_BUFFER_RESOURCE_TEXEL_COUNT_2_TO_EXP := 27

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_CONSTANT_BUFFER_ELEMENT_COUNT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_DEPTH_STENCIL_OBJECT_COUNT_PER_CONTEXT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_DRAWINDEXED_INDEX_COUNT_2_TO_EXP := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_DRAW_VERTEX_COUNT_2_TO_EXP := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_FILTERING_HW_ADDRESSABLE_RESOURCE_DIMENSION := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_GS_INVOCATION_32BIT_OUTPUT_COMPONENT_LIMIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_IMMEDIATE_CONSTANT_BUFFER_ELEMENT_COUNT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_MAXANISOTROPY := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_MIP_LEVELS := 14

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_MULTI_ELEMENT_STRUCTURE_SIZE_IN_BYTES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_RASTERIZER_OBJECT_COUNT_PER_CONTEXT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_RENDER_TO_BUFFER_WINDOW_WIDTH := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_RESOURCE_SIZE_IN_MEGABYTES := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_RESOURCE_VIEW_COUNT_PER_CONTEXT_2_TO_EXP := 20

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_SAMPLER_OBJECT_COUNT_PER_CONTEXT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION := 512

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_TEXTURE1D_U_DIMENSION := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION := 512

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_TEXTURE2D_U_OR_V_DIMENSION := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_TEXTURE3D_U_V_OR_W_DIMENSION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_REQ_TEXTURECUBE_DIMENSION := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_MAJOR_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_MINOR_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHIFT_INSTRUCTION_PAD_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SIMULTANEOUS_RENDER_TARGET_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SO_BUFFER_MAX_STRIDE_IN_BYTES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SO_BUFFER_SLOT_COUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SO_DDI_REGISTER_INDEX_DENOTING_GAP := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SO_MULTIPLE_BUFFER_ELEMENTS_PER_BUFFER := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SO_SINGLE_BUFFER_COMPONENT_LIMIT := 64

/**
 * @type {Float}
 */
export global D3D10_SRGB_GAMMA := 2.2

/**
 * @type {Float}
 */
export global D3D10_SRGB_TO_FLOAT_DENOMINATOR_1 := 12.92

/**
 * @type {Float}
 */
export global D3D10_SRGB_TO_FLOAT_DENOMINATOR_2 := 1.055

/**
 * @type {Float}
 */
export global D3D10_SRGB_TO_FLOAT_EXPONENT := 2.4

/**
 * @type {Float}
 */
export global D3D10_SRGB_TO_FLOAT_OFFSET := 0.055

/**
 * @type {Float}
 */
export global D3D10_SRGB_TO_FLOAT_THRESHOLD := 0.04045

/**
 * @type {Float}
 */
export global D3D10_SRGB_TO_FLOAT_TOLERANCE_IN_ULP := 0.5

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_COMPONENT_BIT_COUNT_DOUBLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_MAXIMUM_ELEMENT_ALIGNMENT_BYTE_MULTIPLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_PIXEL_COMPONENT_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_PIXEL_ELEMENT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_VECTOR_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_VERTEX_ELEMENT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_STANDARD_VERTEX_TOTAL_COMPONENT_COUNT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SUBPIXEL_FRACTIONAL_BIT_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SUBTEXEL_FRACTIONAL_BIT_COUNT := 6

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_TEXEL_ADDRESS_RANGE_BIT_COUNT := 18

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_UNBOUND_MEMORY_ACCESS_RESULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VIEWPORT_AND_SCISSORRECT_MAX_INDEX := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VIEWPORT_BOUNDS_MAX := 16383

/**
 * @type {Integer (Int32)}
 */
export global D3D10_VIEWPORT_BOUNDS_MIN := -16384

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_INPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_INPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_INPUT_REGISTER_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_INPUT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_INPUT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_OUTPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_VS_OUTPUT_REGISTER_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_WHQL_CONTEXT_COUNT_FOR_RESOURCE_LIMIT := 10

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_WHQL_DRAWINDEXED_INDEX_COUNT_2_TO_EXP := 25

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_WHQL_DRAW_VERTEX_COUNT_2_TO_EXP := 25

/**
 * @type {Integer (UInt32)}
 */
export global D3D_MAJOR_VERSION := 10

/**
 * @type {Integer (UInt32)}
 */
export global D3D_MINOR_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SPEC_DATE_DAY := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SPEC_DATE_MONTH := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SPEC_DATE_YEAR := 2006

/**
 * @type {Float}
 */
export global D3D_SPEC_VERSION := 1.050005

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global _FACD3D10 := 2169

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_APPEND_ALIGNED_ELEMENT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_FILTER_TYPE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MIN_FILTER_SHIFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MAG_FILTER_SHIFT := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_MIP_FILTER_SHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_COMPARISON_FILTERING_BIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_ANISOTROPIC_FILTERING_BIT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_TEXT_1BIT_BIT := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SDK_VERSION := 29

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_DEFAULT_SAMPLE_MASK := 4294967295

/**
 * @type {Float}
 */
export global D3D10_1_FLOAT16_FUSED_TOLERANCE_IN_ULP := 0.6

/**
 * @type {Float}
 */
export global D3D10_1_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP := 0.6

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_GS_INPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_PS_OUTPUT_MASK_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_PS_OUTPUT_MASK_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_PS_OUTPUT_MASK_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SHADER_MAJOR_VERSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SHADER_MINOR_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SO_BUFFER_MAX_STRIDE_IN_BYTES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SO_BUFFER_SLOT_COUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SO_MULTIPLE_BUFFER_ELEMENTS_PER_BUFFER := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SO_SINGLE_BUFFER_COMPONENT_LIMIT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_STANDARD_VERTEX_ELEMENT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_SUBPIXEL_FRACTIONAL_BIT_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_VS_INPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_1_VS_OUTPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SDK_LAYERS_VERSION := 11

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEBUG_FEATURE_FLUSH_PER_RENDER_OP := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEBUG_FEATURE_FINISH_PER_RENDER_OP := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_DEBUG_FEATURE_PRESENT_PER_RENDER_OP := 4

/**
 * @type {Guid}
 */
export global DXGI_DEBUG_D3D10 := Guid("{243b4c52-3606-4d3a-99d7-a7e7b33ed706}")

/**
 * @type {String}
 */
export global D3D10_REGKEY_PATH := "Software\Microsoft\Direct3D"

/**
 * @type {String}
 */
export global D3D10_MUTE_DEBUG_OUTPUT := "MuteDebugOutput"

/**
 * @type {String}
 */
export global D3D10_ENABLE_BREAK_ON_MESSAGE := "EnableBreakOnMessage"

/**
 * @type {String}
 */
export global D3D10_INFOQUEUE_STORAGE_FILTER_OVERRIDE := "InfoQueueStorageFilterOverride"

/**
 * @type {String}
 */
export global D3D10_MUTE_CATEGORY := "Mute_CATEGORY_%s"

/**
 * @type {String}
 */
export global D3D10_MUTE_SEVERITY := "Mute_SEVERITY_%s"

/**
 * @type {String}
 */
export global D3D10_MUTE_ID_STRING := "Mute_ID_%s"

/**
 * @type {String}
 */
export global D3D10_MUTE_ID_DECIMAL := "Mute_ID_%d"

/**
 * @type {String}
 */
export global D3D10_UNMUTE_SEVERITY_INFO := "Unmute_SEVERITY_INFO"

/**
 * @type {String}
 */
export global D3D10_BREAKON_CATEGORY := "BreakOn_CATEGORY_%s"

/**
 * @type {String}
 */
export global D3D10_BREAKON_SEVERITY := "BreakOn_SEVERITY_%s"

/**
 * @type {String}
 */
export global D3D10_BREAKON_ID_STRING := "BreakOn_ID_%s"

/**
 * @type {String}
 */
export global D3D10_BREAKON_ID_DECIMAL := "BreakOn_ID_%d"

/**
 * @type {String}
 */
export global D3D10_APPSIZE_STRING := "Size"

/**
 * @type {String}
 */
export global D3D10_APPNAME_STRING := "Name"

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_DEBUG := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_SKIP_VALIDATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_SKIP_OPTIMIZATION := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_PACK_MATRIX_ROW_MAJOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_PACK_MATRIX_COLUMN_MAJOR := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_PARTIAL_PRECISION := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_FORCE_VS_SOFTWARE_NO_OPT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_FORCE_PS_SOFTWARE_NO_OPT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_NO_PRESHADER := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_AVOID_FLOW_CONTROL := 512

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_PREFER_FLOW_CONTROL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_ENABLE_STRICTNESS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_ENABLE_BACKWARDS_COMPATIBILITY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_IEEE_STRICTNESS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_WARNINGS_ARE_ERRORS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_RESOURCES_MAY_ALIAS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_ALL_RESOURCES_BOUND := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_DEBUG_NAME_FOR_SOURCE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_DEBUG_NAME_FOR_BINARY := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_OPTIMIZATION_LEVEL0 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_OPTIMIZATION_LEVEL1 := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_OPTIMIZATION_LEVEL3 := 32768

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_SHADER_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_EFFECT_COMPILE_CHILD_EFFECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_EFFECT_COMPILE_ALLOW_SLOW_OPS := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_EFFECT_SINGLE_THREADED := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_EFFECT_VARIABLE_POOLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_EFFECT_VARIABLE_ANNOTATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D10_EFFECT_VARIABLE_EXPLICIT_BIND_POINT := 4

/**
 * @type {Guid}
 */
export global GUID_DeviceType := Guid("{d722fb4d-7a68-437a-b20c-5804ee2494a6}")
;@endregion Constants

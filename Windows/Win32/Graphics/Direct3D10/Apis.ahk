#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class Direct3D10 {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_16BIT_INDEX_STRIP_CUT_VALUE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_32BIT_INDEX_STRIP_CUT_VALUE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_8BIT_INDEX_STRIP_CUT_VALUE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_CLIP_OR_CULL_DISTANCE_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_CLIP_OR_CULL_DISTANCE_ELEMENT_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_HW_SLOT_COUNT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COUNT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_FLOWCONTROL_NESTING_LIMIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_IMMEDIATE_VALUE_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_COUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_INPUT_RESOURCE_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_SAMPLER_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_SAMPLER_REGISTER_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_SAMPLER_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_SAMPLER_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_SAMPLER_SLOT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_SUBROUTINE_NESTING_LIMIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_TEMP_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_TEMP_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_TEMP_REGISTER_COUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_TEMP_REGISTER_READS_PER_INST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_TEMP_REGISTER_READ_PORTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MAX => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MIN => -10

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_COMMONSHADER_TEXEL_OFFSET_MAX_NEGATIVE => -8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMMONSHADER_TEXEL_OFFSET_MAX_POSITIVE => 7

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_BLEND_FACTOR_ALPHA => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_BLEND_FACTOR_BLUE => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_BLEND_FACTOR_GREEN => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_BLEND_FACTOR_RED => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_BORDER_COLOR_COMPONENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_DEPTH_BIAS => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_DEPTH_BIAS_CLAMP => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_MAX_ANISOTROPY => 16

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_MIP_LOD_BIAS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_RENDER_TARGET_ARRAY_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_SAMPLE_MASK => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_SCISSOR_ENDX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_SCISSOR_ENDY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_SCISSOR_STARTX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_SCISSOR_STARTY => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_SLOPE_SCALED_DEPTH_BIAS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_STENCIL_READ_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_STENCIL_REFERENCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_STENCIL_WRITE_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_VIEWPORT_AND_SCISSORRECT_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_VIEWPORT_HEIGHT => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_VIEWPORT_MAX_DEPTH => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D10_DEFAULT_VIEWPORT_MIN_DEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_VIEWPORT_TOPLEFTX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_VIEWPORT_TOPLEFTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEFAULT_VIEWPORT_WIDTH => 0

    /**
     * @type {Integer (Double)}
     */
    static D3D10_FLOAT16_FUSED_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT32_MAX => 3.4028235E+38

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT_TO_SRGB_EXPONENT_DENOMINATOR => 2.4

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT_TO_SRGB_EXPONENT_NUMERATOR => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT_TO_SRGB_OFFSET => 0.055

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT_TO_SRGB_SCALE_1 => 12.92

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT_TO_SRGB_SCALE_2 => 1.055

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FLOAT_TO_SRGB_THRESHOLD => 0.0031308

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FTOI_INSTRUCTION_MAX_INPUT => 2.1474836E+09

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FTOI_INSTRUCTION_MIN_INPUT => -2.1474836E+09

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FTOU_INSTRUCTION_MAX_INPUT => 4.2949673E+09

    /**
     * @type {Integer (Single)}
     */
    static D3D10_FTOU_INSTRUCTION_MIN_INPUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_PRIM_CONST_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_PRIM_CONST_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_PRIM_CONST_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_PRIM_CONST_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_PRIM_CONST_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_REGISTER_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_INPUT_REGISTER_VERTICES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_OUTPUT_ELEMENTS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_OUTPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_GS_OUTPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_DEFAULT_INDEX_BUFFER_OFFSET_IN_BYTES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_DEFAULT_PRIMITIVE_TOPOLOGY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_DEFAULT_VERTEX_BUFFER_OFFSET_IN_BYTES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_INDEX_INPUT_RESOURCE_SLOT_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_INSTANCE_ID_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_INTEGER_ARITHMETIC_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_PRIMITIVE_ID_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_VERTEX_ID_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_INTEGER_DIVIDE_BY_ZERO_QUOTIENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_INTEGER_DIVIDE_BY_ZERO_REMAINDER => 4294967295

    /**
     * @type {Integer (Single)}
     */
    static D3D10_LINEAR_GAMMA => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MAX_BORDER_COLOR_COMPONENT => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MAX_DEPTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MAX_MAXANISOTROPY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MAX_MULTISAMPLE_SAMPLE_COUNT => 32

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MAX_POSITION_VALUE => 3.4028236E+34

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MAX_TEXTURE_DIMENSION_2_TO_EXP => 17

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MIN_BORDER_COLOR_COMPONENT => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MIN_DEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MIN_MAXANISOTROPY => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MIP_LOD_BIAS_MAX => 15.99

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MIP_LOD_BIAS_MIN => -16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MIP_LOD_FRACTIONAL_BIT_COUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MIP_LOD_RANGE_BIT_COUNT => 8

    /**
     * @type {Integer (Single)}
     */
    static D3D10_MULTISAMPLE_ANTIALIAS_LINE_WIDTH => 1.4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PIXEL_ADDRESS_RANGE_BIT_COUNT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_FRONTFACING_DEFAULT_VALUE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_FRONTFACING_FALSE_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_FRONTFACING_TRUE_VALUE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_INPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_INPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_INPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_INPUT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_INPUT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D10_PS_LEGACY_PIXEL_CENTER_FRACTIONAL_COMPONENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_OUTPUT_DEPTH_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_OUTPUT_DEPTH_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_OUTPUT_DEPTH_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_OUTPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_PS_OUTPUT_REGISTER_COUNT => 8

    /**
     * @type {Integer (Single)}
     */
    static D3D10_PS_PIXEL_CENTER_FRACTIONAL_COMPONENT => 0.5

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_BLEND_OBJECT_COUNT_PER_CONTEXT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_BUFFER_RESOURCE_TEXEL_COUNT_2_TO_EXP => 27

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_CONSTANT_BUFFER_ELEMENT_COUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_DEPTH_STENCIL_OBJECT_COUNT_PER_CONTEXT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_DRAWINDEXED_INDEX_COUNT_2_TO_EXP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_DRAW_VERTEX_COUNT_2_TO_EXP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_FILTERING_HW_ADDRESSABLE_RESOURCE_DIMENSION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_GS_INVOCATION_32BIT_OUTPUT_COMPONENT_LIMIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_IMMEDIATE_CONSTANT_BUFFER_ELEMENT_COUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_MAXANISOTROPY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_MIP_LEVELS => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_MULTI_ELEMENT_STRUCTURE_SIZE_IN_BYTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_RASTERIZER_OBJECT_COUNT_PER_CONTEXT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_RENDER_TO_BUFFER_WINDOW_WIDTH => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_RESOURCE_SIZE_IN_MEGABYTES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_RESOURCE_VIEW_COUNT_PER_CONTEXT_2_TO_EXP => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_SAMPLER_OBJECT_COUNT_PER_CONTEXT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_TEXTURE1D_U_DIMENSION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_TEXTURE2D_U_OR_V_DIMENSION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_TEXTURE3D_U_V_OR_W_DIMENSION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_REQ_TEXTURECUBE_DIMENSION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_MAJOR_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHIFT_INSTRUCTION_PAD_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SIMULTANEOUS_RENDER_TARGET_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SO_BUFFER_MAX_STRIDE_IN_BYTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SO_BUFFER_SLOT_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SO_DDI_REGISTER_INDEX_DENOTING_GAP => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SO_MULTIPLE_BUFFER_ELEMENTS_PER_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SO_SINGLE_BUFFER_COMPONENT_LIMIT => 64

    /**
     * @type {Integer (Single)}
     */
    static D3D10_SRGB_GAMMA => 2.2

    /**
     * @type {Integer (Single)}
     */
    static D3D10_SRGB_TO_FLOAT_DENOMINATOR_1 => 12.92

    /**
     * @type {Integer (Single)}
     */
    static D3D10_SRGB_TO_FLOAT_DENOMINATOR_2 => 1.055

    /**
     * @type {Integer (Single)}
     */
    static D3D10_SRGB_TO_FLOAT_EXPONENT => 2.4

    /**
     * @type {Integer (Single)}
     */
    static D3D10_SRGB_TO_FLOAT_OFFSET => 0.055

    /**
     * @type {Integer (Single)}
     */
    static D3D10_SRGB_TO_FLOAT_THRESHOLD => 0.04045

    /**
     * @type {Integer (Single)}
     */
    static D3D10_SRGB_TO_FLOAT_TOLERANCE_IN_ULP => 0.5

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_COMPONENT_BIT_COUNT_DOUBLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_MAXIMUM_ELEMENT_ALIGNMENT_BYTE_MULTIPLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_PIXEL_COMPONENT_COUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_PIXEL_ELEMENT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_VECTOR_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_VERTEX_ELEMENT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_STANDARD_VERTEX_TOTAL_COMPONENT_COUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SUBPIXEL_FRACTIONAL_BIT_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SUBTEXEL_FRACTIONAL_BIT_COUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_TEXEL_ADDRESS_RANGE_BIT_COUNT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_UNBOUND_MEMORY_ACCESS_RESULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VIEWPORT_AND_SCISSORRECT_MAX_INDEX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VIEWPORT_BOUNDS_MAX => 16383

    /**
     * @type {Integer (Int32)}
     */
    static D3D10_VIEWPORT_BOUNDS_MIN => -16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_INPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_INPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_INPUT_REGISTER_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_INPUT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_INPUT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_OUTPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_VS_OUTPUT_REGISTER_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_WHQL_CONTEXT_COUNT_FOR_RESOURCE_LIMIT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_WHQL_DRAWINDEXED_INDEX_COUNT_2_TO_EXP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_WHQL_DRAW_VERTEX_COUNT_2_TO_EXP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_MAJOR_VERSION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_MINOR_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SPEC_DATE_DAY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SPEC_DATE_MONTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SPEC_DATE_YEAR => 2006

    /**
     * @type {Integer (Double)}
     */
    static D3D_SPEC_VERSION => 1.050005

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static _FACD3D10 => 2169

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_APPEND_ALIGNED_ELEMENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_FILTER_TYPE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MIN_FILTER_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MAG_FILTER_SHIFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_MIP_FILTER_SHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_COMPARISON_FILTERING_BIT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_ANISOTROPIC_FILTERING_BIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_TEXT_1BIT_BIT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SDK_VERSION => 29

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_DEFAULT_SAMPLE_MASK => 4294967295

    /**
     * @type {Integer (Double)}
     */
    static D3D10_1_FLOAT16_FUSED_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Integer (Single)}
     */
    static D3D10_1_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_GS_INPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_PS_OUTPUT_MASK_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_PS_OUTPUT_MASK_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_PS_OUTPUT_MASK_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SHADER_MAJOR_VERSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SHADER_MINOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SO_BUFFER_MAX_STRIDE_IN_BYTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SO_BUFFER_SLOT_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SO_MULTIPLE_BUFFER_ELEMENTS_PER_BUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SO_SINGLE_BUFFER_COMPONENT_LIMIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_STANDARD_VERTEX_ELEMENT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_SUBPIXEL_FRACTIONAL_BIT_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_VS_INPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_1_VS_OUTPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SDK_LAYERS_VERSION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEBUG_FEATURE_FLUSH_PER_RENDER_OP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEBUG_FEATURE_FINISH_PER_RENDER_OP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_DEBUG_FEATURE_PRESENT_PER_RENDER_OP => 4

    /**
     * @type {String}
     */
    static DXGI_DEBUG_D3D10 => "{243b4c52-3606-4d3a-99d7-a7e7b33ed706}"

    /**
     * @type {String}
     */
    static D3D10_REGKEY_PATH => "Software\Microsoft\Direct3D"

    /**
     * @type {String}
     */
    static D3D10_MUTE_DEBUG_OUTPUT => "MuteDebugOutput"

    /**
     * @type {String}
     */
    static D3D10_ENABLE_BREAK_ON_MESSAGE => "EnableBreakOnMessage"

    /**
     * @type {String}
     */
    static D3D10_INFOQUEUE_STORAGE_FILTER_OVERRIDE => "InfoQueueStorageFilterOverride"

    /**
     * @type {String}
     */
    static D3D10_MUTE_CATEGORY => "Mute_CATEGORY_%s"

    /**
     * @type {String}
     */
    static D3D10_MUTE_SEVERITY => "Mute_SEVERITY_%s"

    /**
     * @type {String}
     */
    static D3D10_MUTE_ID_STRING => "Mute_ID_%s"

    /**
     * @type {String}
     */
    static D3D10_MUTE_ID_DECIMAL => "Mute_ID_%d"

    /**
     * @type {String}
     */
    static D3D10_UNMUTE_SEVERITY_INFO => "Unmute_SEVERITY_INFO"

    /**
     * @type {String}
     */
    static D3D10_BREAKON_CATEGORY => "BreakOn_CATEGORY_%s"

    /**
     * @type {String}
     */
    static D3D10_BREAKON_SEVERITY => "BreakOn_SEVERITY_%s"

    /**
     * @type {String}
     */
    static D3D10_BREAKON_ID_STRING => "BreakOn_ID_%s"

    /**
     * @type {String}
     */
    static D3D10_BREAKON_ID_DECIMAL => "BreakOn_ID_%d"

    /**
     * @type {String}
     */
    static D3D10_APPSIZE_STRING => "Size"

    /**
     * @type {String}
     */
    static D3D10_APPNAME_STRING => "Name"

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_SKIP_VALIDATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_SKIP_OPTIMIZATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_PACK_MATRIX_ROW_MAJOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_PACK_MATRIX_COLUMN_MAJOR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_PARTIAL_PRECISION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_FORCE_VS_SOFTWARE_NO_OPT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_FORCE_PS_SOFTWARE_NO_OPT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_NO_PRESHADER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_AVOID_FLOW_CONTROL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_PREFER_FLOW_CONTROL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_ENABLE_STRICTNESS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_ENABLE_BACKWARDS_COMPATIBILITY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_IEEE_STRICTNESS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_WARNINGS_ARE_ERRORS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_RESOURCES_MAY_ALIAS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_ALL_RESOURCES_BOUND => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_DEBUG_NAME_FOR_SOURCE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_DEBUG_NAME_FOR_BINARY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_OPTIMIZATION_LEVEL0 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_OPTIMIZATION_LEVEL1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_OPTIMIZATION_LEVEL3 => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_SHADER_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_EFFECT_COMPILE_CHILD_EFFECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_EFFECT_COMPILE_ALLOW_SLOW_OPS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_EFFECT_SINGLE_THREADED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_EFFECT_VARIABLE_POOLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_EFFECT_VARIABLE_ANNOTATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D10_EFFECT_VARIABLE_EXPLICIT_BIND_POINT => 4

    /**
     * @type {String}
     */
    static GUID_DeviceType => "{d722fb4d-7a68-437a-b20c-5804ee2494a6}"
;@endregion Constants

;@region Methods
    /**
     * Create a Direct3D 10.0 device that represents the display adapter.
     * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
     * 
     * Pointer to the display adapter (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>) when creating a hardware device; otherwise set this parameter to <b>NULL</b>. 
     *         If <b>NULL</b> is specified when creating a hardware device, Direct3D will use the first adapter enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">EnumAdapters</a>.
     * @param {Integer} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
     * 
     * The device-driver type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>). The driver type determines the type of device you will create.
     * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
     * 
     * Reserved. Set to <b>NULL</b>.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that 
     *         enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Bit flag that indicates the version of the SDK. Should always be D3D10_SDK_VERSION.
     * @param {Pointer<ID3D10Device>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>**</b>
     * 
     * Address of a pointer to the device created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10misc/nf-d3d10misc-d3d10createdevice
     */
    static D3D10CreateDevice(pAdapter, DriverType, Software, Flags, SDKVersion, ppDevice) {
        Software := Software is Win32Handle ? NumGet(Software, "ptr") : Software

        result := DllCall("d3d10.dll\D3D10CreateDevice", "ptr", pAdapter, "int", DriverType, "ptr", Software, "uint", Flags, "uint", SDKVersion, "ptr*", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Create a Direct3D 10.0 device and a swap chain.
     * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>.
     * @param {Integer} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
     * 
     * The type of driver for the device. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>.
     * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
     * 
     * A handle to the DLL that implements a software rasterizer. Must be <b>NULL</b> if DriverType is non-software. The HMODULE of a DLL can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Bit flag that indicates the version of the SDK. Should be D3D10_SDK_VERSION, defined in d3d10.h.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pSwapChainDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
     * 
     * Description of the swap chain. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>.
     * @param {Pointer<IDXGISwapChain>} ppSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>.
     * @param {Pointer<ID3D10Device>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a> that will receive the newly created device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10misc/nf-d3d10misc-d3d10createdeviceandswapchain
     */
    static D3D10CreateDeviceAndSwapChain(pAdapter, DriverType, Software, Flags, SDKVersion, pSwapChainDesc, ppSwapChain, ppDevice) {
        Software := Software is Win32Handle ? NumGet(Software, "ptr") : Software

        result := DllCall("d3d10.dll\D3D10CreateDeviceAndSwapChain", "ptr", pAdapter, "int", DriverType, "ptr", Software, "uint", Flags, "uint", SDKVersion, "ptr", pSwapChainDesc, "ptr*", ppSwapChain, "ptr*", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Create a buffer.Note  Instead of using this function, we recommend that you use the D3DCreateBlob API.
     * @param {Pointer} NumBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Number of bytes in the blob.
     * @param {Pointer<ID3DBlob>} ppBuffer Type: <b><a href="https://msdn.microsoft.com/d180fee0-1a69-4250-a0c4-d6e3754f063a">LPD3D10BLOB</a>*</b>
     * 
     * The address of a pointer to the buffer (see <a href="https://msdn.microsoft.com/d180fee0-1a69-4250-a0c4-d6e3754f063a">ID3D10Blob Interface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10misc/nf-d3d10misc-d3d10createblob
     */
    static D3D10CreateBlob(NumBytes, ppBuffer) {
        result := DllCall("d3d10.dll\D3D10CreateBlob", "ptr", NumBytes, "ptr*", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compile an HLSL shader.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Pointer to a string containing the shader source code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of pSrcData, in bytes.
     * @param {PSTR} pFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the file that contains the shader code.
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>*</b>
     * 
     * Optional. Pointer to an array of macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>). 
     *           The last structure in the array serves as a terminator and must have all members set to 0.  
     *           If not used, set <i>pDefines</i> to <b>NULL</b>.
     * @param {ID3DInclude} pInclude Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">LPD3D10INCLUDE</a>*</b>
     * 
     * Optional. Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include Interface</a> interface for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include.
     * @param {PSTR} pFunctionName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Name of the shader-entry point function where shader execution begins.
     * @param {PSTR} pProfile Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * A string that specifies the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-models">shader profile</a> or shader model.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Shader <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-shader">compile options</a>.
     * @param {Pointer<ID3DBlob>} ppShader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains the compiled shader, as well as any embedded debug and symbol-table information.
     * @param {Pointer<ID3DBlob>} ppErrorMsgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains a listing of errors and warnings that occurred during compilation. These errors and warnings are identical to the debug output from a debugger.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10compileshader
     */
    static D3D10CompileShader(pSrcData, SrcDataSize, pFileName, pDefines, pInclude, pFunctionName, pProfile, Flags, ppShader, ppErrorMsgs) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName
        pFunctionName := pFunctionName is String ? StrPtr(pFunctionName) : pFunctionName
        pProfile := pProfile is String ? StrPtr(pProfile) : pProfile

        result := DllCall("d3d10.dll\D3D10CompileShader", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pFileName, "ptr", pDefines, "ptr", pInclude, "ptr", pFunctionName, "ptr", pProfile, "uint", Flags, "ptr*", ppShader, "ptr*", ppErrorMsgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function -- which disassembles a compiled shader into a text string that contains assembly instructions and register assignments -- has been deprecated. Instead, use D3DDisassemble.
     * @param {Pointer} pShader Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of pShader.
     * @param {BOOL} EnableColorCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Include HTML tags in the output to color code the result.
     * @param {PSTR} pComments Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The comment string at the top of the shader that identifies the shader constants and variables.
     * @param {Pointer<ID3DBlob>} ppDisassembly Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * Address of a buffer which contains the disassembled shader.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Return value
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10disassembleshader
     */
    static D3D10DisassembleShader(pShader, BytecodeLength, EnableColorCode, pComments, ppDisassembly) {
        pComments := pComments is String ? StrPtr(pComments) : pComments

        result := DllCall("d3d10.dll\D3D10DisassembleShader", "ptr", pShader, "ptr", BytecodeLength, "int", EnableColorCode, "ptr", pComments, "ptr*", ppDisassembly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Get the pixel shader profile best suited to a given device.
     * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
     * 
     * Pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
     * @returns {PSTR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The shader profile.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10getpixelshaderprofile
     */
    static D3D10GetPixelShaderProfile(pDevice) {
        result := DllCall("d3d10.dll\D3D10GetPixelShaderProfile", "ptr", pDevice, "char*")
        return result
    }

    /**
     * Get the vertex shader profile best suited to a given device.
     * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
     * 
     * Pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
     * @returns {PSTR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The shader profile.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10getvertexshaderprofile
     */
    static D3D10GetVertexShaderProfile(pDevice) {
        result := DllCall("d3d10.dll\D3D10GetVertexShaderProfile", "ptr", pDevice, "char*")
        return result
    }

    /**
     * Get the geometry shader profile best suited to a given device.
     * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
     * 
     * Pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
     * @returns {PSTR} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The shader profile.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10getgeometryshaderprofile
     */
    static D3D10GetGeometryShaderProfile(pDevice) {
        result := DllCall("d3d10.dll\D3D10GetGeometryShaderProfile", "ptr", pDevice, "char*")
        return result
    }

    /**
     * This function -- which creates a shader-reflection object for retrieving information about a compiled shader -- has been deprecated. Instead, use D3DReflect.
     * @param {Pointer} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of pShaderBytecode.
     * @param {Pointer<ID3D10ShaderReflection>} ppReflector Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10shader/nn-d3d10shader-id3d10shaderreflection">ID3D10ShaderReflection</a>**</b>
     * 
     * Address of a reflection interface.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Return value.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10reflectshader
     */
    static D3D10ReflectShader(pShaderBytecode, BytecodeLength, ppReflector) {
        result := DllCall("d3d10.dll\D3D10ReflectShader", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppReflector, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Generate a shader-text string that contains the shader tokens that would be found in a compiled shader.
     * @param {Pointer} pSrcData Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * Pointer to a string containing the shader source code.
     * @param {Pointer} SrcDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Size of pSrcData, in bytes.
     * @param {PSTR} pFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the file that contains the shader code.
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>*</b>
     * 
     * Optional. Pointer to an array of macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>). 
     *           The last structure in the array serves as a terminator and must have all members set to 0.  
     *           If not used, set <i>pDefines</i> to <b>NULL</b>.
     * @param {ID3DInclude} pInclude Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">LPD3D10INCLUDE</a></b>
     * 
     * Optional. Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include Interface</a> interface for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include.
     * @param {Pointer<ID3DBlob>} ppShaderText Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * A pointer to a buffer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains a single string containing shader-tokens.
     * @param {Pointer<ID3DBlob>} ppErrorMsgs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * A pointer to a buffer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains a listing of errors and warnings that occurred during compilation. These errors and warnings are identical to the debug output from a debugger.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10preprocessshader
     */
    static D3D10PreprocessShader(pSrcData, SrcDataSize, pFileName, pDefines, pInclude, ppShaderText, ppErrorMsgs) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        result := DllCall("d3d10.dll\D3D10PreprocessShader", "ptr", pSrcData, "ptr", SrcDataSize, "ptr", pFileName, "ptr", pDefines, "ptr", pInclude, "ptr*", ppShaderText, "ptr*", ppErrorMsgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Get a buffer that contains shader-input signatures.
     * @param {Pointer} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the shader bytecode in bytes.
     * @param {Pointer<ID3DBlob>} ppSignatureBlob Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * The address of a pointer to the buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10getinputsignatureblob
     */
    static D3D10GetInputSignatureBlob(pShaderBytecode, BytecodeLength, ppSignatureBlob) {
        result := DllCall("d3d10.dll\D3D10GetInputSignatureBlob", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Get a buffer that contains shader-output signatures.
     * @param {Pointer} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the shader bytecode in bytes.
     * @param {Pointer<ID3DBlob>} ppSignatureBlob Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * The address of a pointer to the buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10getoutputsignatureblob
     */
    static D3D10GetOutputSignatureBlob(pShaderBytecode, BytecodeLength, ppSignatureBlob) {
        result := DllCall("d3d10.dll\D3D10GetOutputSignatureBlob", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Get a buffer that contains shader signatures.
     * @param {Pointer} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size of the shader bytecode in bytes.
     * @param {Pointer<ID3DBlob>} ppSignatureBlob Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * The address of a pointer to the buffer (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10getinputandoutputsignatureblob
     */
    static D3D10GetInputAndOutputSignatureBlob(pShaderBytecode, BytecodeLength, ppSignatureBlob) {
        result := DllCall("d3d10.dll\D3D10GetInputAndOutputSignatureBlob", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Get shader debug info. Debug info is generated by D3D10CompileShader and is embedded in the body of the shader.
     * @param {Pointer} pShaderBytecode Type: <b>const void*</b>
     * 
     * A pointer to the compiled shader. To get this pointer see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-using-shaders-10">Getting a Pointer to a Compiled Shader</a>.
     * @param {Pointer} BytecodeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of the shader bytecode buffer.
     * @param {Pointer<ID3DBlob>} ppDebugInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">ID3D10Blob Interface</a> used to return debug info.  For information about the layout of this buffer, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_info">D3D10_SHADER_DEBUG_INFO</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10shader/nf-d3d10shader-d3d10getshaderdebuginfo
     */
    static D3D10GetShaderDebugInfo(pShaderBytecode, BytecodeLength, ppDebugInfo) {
        result := DllCall("d3d10.dll\D3D10GetShaderDebugInfo", "ptr", pShaderBytecode, "ptr", BytecodeLength, "ptr*", ppDebugInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Combine two state-block masks with a bitwise OR.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pA Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * State block mask on the left side of the bitwise OR operation. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * State block mask on the right side of the bitwise OR operation.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * The result of the bitwise OR operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskunion
     */
    static D3D10StateBlockMaskUnion(pA, pB, pResult) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskUnion", "ptr", pA, "ptr", pB, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Combine two state-block masks with a bitwise AND.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pA Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * State block mask on the left side of the bitwise AND operation. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * State block mask on the right side of the bitwise AND operation.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * The result of the bitwise AND operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskintersect
     */
    static D3D10StateBlockMaskIntersect(pA, pB, pResult) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskIntersect", "ptr", pA, "ptr", pB, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Combine two state-block masks with a bitwise XOR.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pA Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * State block mask on the left side of the bitwise XOR operation. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pB Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * State block mask on the right side of the bitwise XOR operation.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pResult Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * The result of the bitwise XOR operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskdifference
     */
    static D3D10StateBlockMaskDifference(pA, pB, pResult) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskDifference", "ptr", pA, "ptr", pB, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enable a range of state values in a state block mask.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * A state block mask (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
     * @param {Integer} StateType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a></b>
     * 
     * The type of device state to enable (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a>.
     * @param {Integer} RangeStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The lower end of the range of values to set to true.
     * @param {Integer} RangeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The upper end of the range of values to set to true.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskenablecapture
     */
    static D3D10StateBlockMaskEnableCapture(pMask, StateType, RangeStart, RangeLength) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskEnableCapture", "ptr", pMask, "int", StateType, "uint", RangeStart, "uint", RangeLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Disable state capturing with a state-block mask.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * A state block mask (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
     * @param {Integer} StateType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a></b>
     * 
     * The type of device state to disable (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a>).
     * @param {Integer} RangeStart Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The lower end of the range of values to set to false.
     * @param {Integer} RangeLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The upper end of the range of values to set to false.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskdisablecapture
     */
    static D3D10StateBlockMaskDisableCapture(pMask, StateType, RangeStart, RangeLength) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskDisableCapture", "ptr", pMask, "int", StateType, "uint", RangeStart, "uint", RangeLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Enable a state-block mask to capture and apply all state variables.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * A mask with everything turned on.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskenableall
     */
    static D3D10StateBlockMaskEnableAll(pMask) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskEnableAll", "ptr", pMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Disable all state capturing with a state-block mask.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * A mask filled with all zeroes (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskdisableall
     */
    static D3D10StateBlockMaskDisableAll(pMask) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskDisableAll", "ptr", pMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Get an element in a state-block mask; determine if an element is allowed by the mask for capturing and applying.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * State block mask. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>.
     * @param {Integer} StateType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a></b>
     * 
     * The type of device state. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ne-d3d10effect-d3d10_device_state_types">D3D10_DEVICE_STATE_TYPES</a>.
     * @param {Integer} Entry Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The entry within the device state. This is only relevant for state types that have more than one entry, such as D3D10_DST_GS_SAMPLERS.
     * @returns {BOOL} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Returns true if the specified feature is allowed by the mask for capturing and applying, and false otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10stateblockmaskgetsetting
     */
    static D3D10StateBlockMaskGetSetting(pMask, StateType, Entry) {
        result := DllCall("d3d10.dll\D3D10StateBlockMaskGetSetting", "ptr", pMask, "int", StateType, "uint", Entry, "int")
        return result
    }

    /**
     * Create a state block.
     * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
     * 
     * The device for which the state block will be created.
     * @param {Pointer<D3D10_STATE_BLOCK_MASK>} pStateBlockMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/ns-d3d10effect-d3d10_state_block_mask">D3D10_STATE_BLOCK_MASK</a>*</b>
     * 
     * Indicates which parts of the device state will be captured when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10stateblock-capture">ID3D10StateBlock::Capture</a> and reapplied when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nf-d3d10effect-id3d10stateblock-apply">ID3D10StateBlock::Apply</a>. See remarks.
     * @param {Pointer<ID3D10StateBlock>} ppStateBlock Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10stateblock">ID3D10StateBlock</a>**</b>
     * 
     * Address of a pointer to the buffer created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10stateblock">ID3D10StateBlock Interface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10createstateblock
     */
    static D3D10CreateStateBlock(pDevice, pStateBlockMask, ppStateBlock) {
        result := DllCall("d3d10.dll\D3D10CreateStateBlock", "ptr", pDevice, "ptr", pStateBlockMask, "ptr*", ppStateBlock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Compile an effect.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to effect data; either ASCII <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-reference">HLSL</a> code or a compiled effect.
     * @param {Pointer} DataLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pData</i>.
     * @param {PSTR} pSrcFileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the effect file.
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>*</b>
     * 
     * Optional. An array of NULL-terminated macro definitions (see <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ns-d3dcommon-d3d_shader_macro">D3D10_SHADER_MACRO</a>).
     * @param {ID3DInclude} pInclude Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include</a>*</b>
     * 
     * Optional. A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173775(v=vs.85)">ID3D10Include Interface</a> for handling include files. Setting this to <b>NULL</b> will cause a compile error if a shader contains a #include.
     * @param {Integer} HLSLFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Shader <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-shader">compile options</a>.
     * @param {Integer} FXFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Effect <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-effect-constants">compile options</a>.
     * @param {Pointer<ID3DBlob>} ppCompiledEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * The address of a <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains the compiled effect.
     * @param {Pointer<ID3DBlob>} ppErrors Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * Optional. A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> that contains compiler error messages, or <b>NULL</b> if there were no errors.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10compileeffectfrommemory
     */
    static D3D10CompileEffectFromMemory(pData, DataLength, pSrcFileName, pDefines, pInclude, HLSLFlags, FXFlags, ppCompiledEffect, ppErrors) {
        pSrcFileName := pSrcFileName is String ? StrPtr(pSrcFileName) : pSrcFileName

        result := DllCall("d3d10.dll\D3D10CompileEffectFromMemory", "ptr", pData, "ptr", DataLength, "ptr", pSrcFileName, "ptr", pDefines, "ptr", pInclude, "uint", HLSLFlags, "uint", FXFlags, "ptr*", ppCompiledEffect, "ptr*", ppErrors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an ID3D10Effect from a buffer containing a compiled effect.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to a compiled effect.
     * @param {Pointer} DataLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pData</i>.
     * @param {Integer} FXFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Effect <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-effect-constants">compile options</a>.
     * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
     * 
     * A pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
     * @param {ID3D10EffectPool} pEffectPool Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool</a>*</b>
     * 
     * Optional. A pointer to an memory space for effect variables that are shared across effects (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool Interface</a>).
     * @param {Pointer<ID3D10Effect>} ppEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect Interface</a> which contains the created effect.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10createeffectfrommemory
     */
    static D3D10CreateEffectFromMemory(pData, DataLength, FXFlags, pDevice, pEffectPool, ppEffect) {
        result := DllCall("d3d10.dll\D3D10CreateEffectFromMemory", "ptr", pData, "ptr", DataLength, "uint", FXFlags, "ptr", pDevice, "ptr", pEffectPool, "ptr*", ppEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Create an effect pool (or shared memory location), to enable sharing variables between effects.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * A pointer to a compiled effect.
     * @param {Pointer} DataLength Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * Length of <i>pData</i>.
     * @param {Integer} FXFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Effect <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-effect-constants">compile options</a>.
     * @param {ID3D10Device} pDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device</a>*</b>
     * 
     * A pointer to the device (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10device">ID3D10Device Interface</a>).
     * @param {Pointer<ID3D10EffectPool>} ppEffectPool Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool</a>**</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effectpool">ID3D10EffectPool Interface</a> that contains the effect pool.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10createeffectpoolfrommemory
     */
    static D3D10CreateEffectPoolFromMemory(pData, DataLength, FXFlags, pDevice, ppEffectPool) {
        result := DllCall("d3d10.dll\D3D10CreateEffectPoolFromMemory", "ptr", pData, "ptr", DataLength, "uint", FXFlags, "ptr", pDevice, "ptr*", ppEffectPool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function -- which disassembles a compiled effect into a text string that contains assembly instructions and register assignments -- has been deprecated. Instead, use D3DDisassemble10Effect.
     * @param {ID3D10Effect} pEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10effect/nn-d3d10effect-id3d10effect">ID3D10Effect Interface</a>, which contains the compiled effect.
     * @param {BOOL} EnableColorCode Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Include HTML tags in the output to color code the result.
     * @param {Pointer<ID3DBlob>} ppDisassembly Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob</a>**</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/nn-d3dcommon-id3d10blob">ID3D10Blob Interface</a> which contains the disassembled shader.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-d3d10disassembleeffect
     */
    static D3D10DisassembleEffect(pEffect, EnableColorCode, ppDisassembly) {
        result := DllCall("d3d10.dll\D3D10DisassembleEffect", "ptr", pEffect, "int", EnableColorCode, "ptr*", ppDisassembly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Create a Direct3D 10.1 device that represents the display adapter.
     * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
     * 
     * Pointer to the display adapter (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>) when creating a hardware device; otherwise set this parameter to 
     *         <b>NULL</b>. If <b>NULL</b> is specified when creating a hardware device, Direct3D will use the first adapter enumerated 
     *         by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">EnumAdapters</a>.
     * @param {Integer} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
     * 
     * The device-driver type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>). The driver type determines the type of device you will create.
     * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
     * 
     * This is set to <b>NULL</b> except for D3D10_DRIVER_TYPE_SOFTWARE driver types.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that 
     *         enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
     * @param {Integer} HardwareLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a></b>
     * 
     * The version of hardware that is available for acceleration (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a>).
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Bit flag that indicates the version of the SDK. Should be D3D10_1_SDK_VERSION, defined in D3D10.h.
     * @param {Pointer<ID3D10Device1>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>**</b>
     * 
     * Address of a pointer to the device created (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1 Interface</a>).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/nf-d3d10_1-d3d10createdevice1
     */
    static D3D10CreateDevice1(pAdapter, DriverType, Software, Flags, HardwareLevel, SDKVersion, ppDevice) {
        Software := Software is Win32Handle ? NumGet(Software, "ptr") : Software

        result := DllCall("d3d10_1.dll\D3D10CreateDevice1", "ptr", pAdapter, "int", DriverType, "ptr", Software, "uint", Flags, "int", HardwareLevel, "uint", SDKVersion, "ptr*", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Create a Direct3D 10.1 device and a swap chain.
     * @param {IDXGIAdapter} pAdapter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>.
     * @param {Integer} DriverType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a></b>
     * 
     * The type of driver for the device. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/ne-d3d10misc-d3d10_driver_type">D3D10_DRIVER_TYPE</a>.
     * @param {HMODULE} Software Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMODULE</a></b>
     * 
     * A handle to the DLL that implements a software rasterizer. Must be <b>NULL</b> if DriverType is non-software. 
     *         The HMODULE of a DLL can be obtained with <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a>, 
     *           <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibraryexa">LoadLibraryEx</a>, 
     *           or <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandlea">GetModuleHandle</a>.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Optional. Device creation flags (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_create_device_flag">D3D10_CREATE_DEVICE_FLAG</a>) that 
     *         enable <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-api-features-layers">API layers</a>. These flags can be bitwise OR'd together.
     * @param {Integer} HardwareLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a></b>
     * 
     * The version of hardware that is available for acceleration (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/ne-d3d10_1-d3d10_feature_level1">D3D10_FEATURE_LEVEL1</a>).
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Bit flag that indicates the version of the SDK. Should be D3D10_1_SDK_VERSION, defined in D3D10.h.
     * @param {Pointer<DXGI_SWAP_CHAIN_DESC>} pSwapChainDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>*</b>
     * 
     * Description of the swap chain. See <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ns-dxgi-dxgi_swap_chain_desc">DXGI_SWAP_CHAIN_DESC</a>.
     * @param {Pointer<IDXGISwapChain>} ppSwapChain Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiswapchain">IDXGISwapChain</a>.
     * @param {Pointer<ID3D10Device1>} ppDevice Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nn-d3d10_1-id3d10device1">ID3D10Device1 Interface</a> that will receive the newly created device.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/nf-d3d10_1-d3d10createdeviceandswapchain1
     */
    static D3D10CreateDeviceAndSwapChain1(pAdapter, DriverType, Software, Flags, HardwareLevel, SDKVersion, pSwapChainDesc, ppSwapChain, ppDevice) {
        Software := Software is Win32Handle ? NumGet(Software, "ptr") : Software

        result := DllCall("d3d10_1.dll\D3D10CreateDeviceAndSwapChain1", "ptr", pAdapter, "int", DriverType, "ptr", Software, "uint", Flags, "int", HardwareLevel, "uint", SDKVersion, "ptr", pSwapChainDesc, "ptr*", ppSwapChain, "ptr*", ppDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}

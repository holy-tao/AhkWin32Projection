#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.Direct3D11
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_16BIT_INDEX_STRIP_CUT_VALUE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_32BIT_INDEX_STRIP_CUT_VALUE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_8BIT_INDEX_STRIP_CUT_VALUE := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT := 9

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CLIP_OR_CULL_DISTANCE_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CLIP_OR_CULL_DISTANCE_ELEMENT_COUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT := 14

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_HW_SLOT_COUNT := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_PARTIAL_UPDATE_EXTENTS_BYTE_ALIGNMENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COUNT := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_FLOWCONTROL_NESTING_LIMIT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_IMMEDIATE_VALUE_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_INPUT_RESOURCE_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_INPUT_RESOURCE_REGISTER_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_INPUT_RESOURCE_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_INPUT_RESOURCE_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_SAMPLER_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_SAMPLER_REGISTER_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_SAMPLER_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_SAMPLER_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_SAMPLER_SLOT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_SUBROUTINE_NESTING_LIMIT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_TEMP_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_TEMP_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_TEMP_REGISTER_COUNT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_TEMP_REGISTER_READS_PER_INST := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_TEMP_REGISTER_READ_PORTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MAX := 10

/**
 * @type {Integer (Int32)}
 */
export global D3D11_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MIN := -10

/**
 * @type {Integer (Int32)}
 */
export global D3D11_COMMONSHADER_TEXEL_OFFSET_MAX_NEGATIVE := -8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMMONSHADER_TEXEL_OFFSET_MAX_POSITIVE := 7

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET00_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET00_MAX_NUM_THREADS_PER_GROUP := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET01_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 240

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET01_MAX_NUM_THREADS_PER_GROUP := 68

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET02_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 224

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET02_MAX_NUM_THREADS_PER_GROUP := 72

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET03_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 208

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET03_MAX_NUM_THREADS_PER_GROUP := 76

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET04_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 192

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET04_MAX_NUM_THREADS_PER_GROUP := 84

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET05_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 176

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET05_MAX_NUM_THREADS_PER_GROUP := 92

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET06_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 160

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET06_MAX_NUM_THREADS_PER_GROUP := 100

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET07_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 144

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET07_MAX_NUM_THREADS_PER_GROUP := 112

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET08_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET08_MAX_NUM_THREADS_PER_GROUP := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET09_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 112

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET09_MAX_NUM_THREADS_PER_GROUP := 144

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET10_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 96

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET10_MAX_NUM_THREADS_PER_GROUP := 168

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET11_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 80

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET11_MAX_NUM_THREADS_PER_GROUP := 204

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET12_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET12_MAX_NUM_THREADS_PER_GROUP := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET13_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 48

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET13_MAX_NUM_THREADS_PER_GROUP := 340

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET14_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET14_MAX_NUM_THREADS_PER_GROUP := 512

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET15_MAX_BYTES_TGSM_WRITABLE_PER_THREAD := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_BUCKET15_MAX_NUM_THREADS_PER_GROUP := 768

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_DISPATCH_MAX_THREAD_GROUPS_IN_Z_DIMENSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_RAW_UAV_BYTE_ALIGNMENT := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_THREAD_GROUP_MAX_THREADS_PER_GROUP := 768

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_THREAD_GROUP_MAX_X := 768

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_THREAD_GROUP_MAX_Y := 768

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_4_X_UAV_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION := 65535

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_TGSM_REGISTER_COUNT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_TGSM_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_TGSM_RESOURCE_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_TGSM_RESOURCE_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADGROUPID_REGISTER_COMPONENTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADGROUPID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADIDINGROUPFLATTENED_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADIDINGROUPFLATTENED_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADIDINGROUP_REGISTER_COMPONENTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADIDINGROUP_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADID_REGISTER_COMPONENTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREADID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_GROUP_MAX_THREADS_PER_GROUP := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_GROUP_MAX_X := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_GROUP_MAX_Y := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_GROUP_MAX_Z := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_GROUP_MIN_X := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_GROUP_MIN_Y := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_GROUP_MIN_Z := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_CS_THREAD_LOCAL_TEMP_REGISTER_POOL := 16384

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_BLEND_FACTOR_ALPHA := 1

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_BLEND_FACTOR_BLUE := 1

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_BLEND_FACTOR_GREEN := 1

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_BLEND_FACTOR_RED := 1

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_BORDER_COLOR_COMPONENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_DEPTH_BIAS := 0

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_DEPTH_BIAS_CLAMP := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_MAX_ANISOTROPY := 16

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_MIP_LOD_BIAS := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_RENDER_TARGET_ARRAY_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_SAMPLE_MASK := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_SCISSOR_ENDX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_SCISSOR_ENDY := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_SCISSOR_STARTX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_SCISSOR_STARTY := 0

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_SLOPE_SCALED_DEPTH_BIAS := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_STENCIL_READ_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_STENCIL_REFERENCE := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_STENCIL_WRITE_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_VIEWPORT_AND_SCISSORRECT_INDEX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_VIEWPORT_HEIGHT := 0

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_VIEWPORT_MAX_DEPTH := 0

/**
 * @type {Float}
 */
export global D3D11_DEFAULT_VIEWPORT_MIN_DEPTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_VIEWPORT_TOPLEFTX := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_VIEWPORT_TOPLEFTY := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEFAULT_VIEWPORT_WIDTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS := 3968

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_CONTROL_POINT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_CONTROL_POINT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_CONTROL_POINT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_CONTROL_POINT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENTS := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_DOMAIN_POINT_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_DOMAIN_POINT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_DOMAIN_POINT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PATCH_CONSTANT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PATCH_CONSTANT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PRIMITIVE_ID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_OUTPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DS_OUTPUT_REGISTER_COUNT := 32

/**
 * @type {Float}
 */
export global D3D11_FLOAT16_FUSED_TOLERANCE_IN_ULP := 0.6

/**
 * @type {Float}
 */
export global D3D11_FLOAT32_MAX := 3.4028235E+38

/**
 * @type {Float}
 */
export global D3D11_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP := 0.6

/**
 * @type {Float}
 */
export global D3D11_FLOAT_TO_SRGB_EXPONENT_DENOMINATOR := 2.4

/**
 * @type {Float}
 */
export global D3D11_FLOAT_TO_SRGB_EXPONENT_NUMERATOR := 1

/**
 * @type {Float}
 */
export global D3D11_FLOAT_TO_SRGB_OFFSET := 0.055

/**
 * @type {Float}
 */
export global D3D11_FLOAT_TO_SRGB_SCALE_1 := 12.92

/**
 * @type {Float}
 */
export global D3D11_FLOAT_TO_SRGB_SCALE_2 := 1.055

/**
 * @type {Float}
 */
export global D3D11_FLOAT_TO_SRGB_THRESHOLD := 0.0031308

/**
 * @type {Float}
 */
export global D3D11_FTOI_INSTRUCTION_MAX_INPUT := 2.1474836E+09

/**
 * @type {Float}
 */
export global D3D11_FTOI_INSTRUCTION_MIN_INPUT := -2.1474836E+09

/**
 * @type {Float}
 */
export global D3D11_FTOU_INSTRUCTION_MAX_INPUT := 4.2949673E+09

/**
 * @type {Float}
 */
export global D3D11_FTOU_INSTRUCTION_MIN_INPUT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_INSTANCE_ID_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_INSTANCE_ID_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_INSTANCE_ID_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_INSTANCE_ID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_PRIM_CONST_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_PRIM_CONST_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_PRIM_CONST_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_PRIM_CONST_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_PRIM_CONST_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_INPUT_REGISTER_VERTICES := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_MAX_INSTANCE_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_MAX_OUTPUT_VERTEX_COUNT_ACROSS_INSTANCES := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_OUTPUT_ELEMENTS := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_OUTPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_GS_OUTPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_CONTROL_POINT_PHASE_INPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_CONTROL_POINT_PHASE_OUTPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_CONTROL_POINT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_CONTROL_POINT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_CONTROL_POINT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_FORK_PHASE_INSTANCE_COUNT_UPPER_BOUND := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_FORK_INSTANCE_ID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_FORK_INSTANCE_ID_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_FORK_INSTANCE_ID_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_PRIMITIVE_ID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_JOIN_PHASE_INSTANCE_COUNT_UPPER_BOUND := 4294967295

/**
 * @type {Float}
 */
export global D3D11_HS_MAXTESSFACTOR_LOWER_BOUND := 1

/**
 * @type {Float}
 */
export global D3D11_HS_MAXTESSFACTOR_UPPER_BOUND := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS := 3968

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_PATCH_CONSTANT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_PATCH_CONSTANT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_HS_OUTPUT_PATCH_CONSTANT_REGISTER_SCALAR_COMPONENTS := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_DEFAULT_INDEX_BUFFER_OFFSET_IN_BYTES := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_DEFAULT_PRIMITIVE_TOPOLOGY := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_DEFAULT_VERTEX_BUFFER_OFFSET_IN_BYTES := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_INDEX_INPUT_RESOURCE_SLOT_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_INSTANCE_ID_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_INTEGER_ARITHMETIC_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_PATCH_MAX_CONTROL_POINT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_PRIMITIVE_ID_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_VERTEX_ID_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_INTEGER_DIVIDE_BY_ZERO_QUOTIENT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_INTEGER_DIVIDE_BY_ZERO_REMAINDER := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_KEEP_UNORDERED_ACCESS_VIEWS := 4294967295

/**
 * @type {Float}
 */
export global D3D11_LINEAR_GAMMA := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MAJOR_VERSION := 11

/**
 * @type {Float}
 */
export global D3D11_MAX_BORDER_COLOR_COMPONENT := 1

/**
 * @type {Float}
 */
export global D3D11_MAX_DEPTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MAX_MAXANISOTROPY := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MAX_MULTISAMPLE_SAMPLE_COUNT := 32

/**
 * @type {Float}
 */
export global D3D11_MAX_POSITION_VALUE := 3.4028236E+34

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MAX_TEXTURE_DIMENSION_2_TO_EXP := 17

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MINOR_VERSION := 0

/**
 * @type {Float}
 */
export global D3D11_MIN_BORDER_COLOR_COMPONENT := 0

/**
 * @type {Float}
 */
export global D3D11_MIN_DEPTH := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MIN_MAXANISOTROPY := 0

/**
 * @type {Float}
 */
export global D3D11_MIP_LOD_BIAS_MAX := 15.99

/**
 * @type {Float}
 */
export global D3D11_MIP_LOD_BIAS_MIN := -16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MIP_LOD_FRACTIONAL_BIT_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MIP_LOD_RANGE_BIT_COUNT := 8

/**
 * @type {Float}
 */
export global D3D11_MULTISAMPLE_ANTIALIAS_LINE_WIDTH := 1.4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PIXEL_ADDRESS_RANGE_BIT_COUNT := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_CS_UAV_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_CS_UAV_REGISTER_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_CS_UAV_REGISTER_READS_PER_INST := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_CS_UAV_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_FRONTFACING_DEFAULT_VALUE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_FRONTFACING_FALSE_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_FRONTFACING_TRUE_VALUE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_INPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_INPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_INPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_INPUT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_INPUT_REGISTER_READ_PORTS := 1

/**
 * @type {Float}
 */
export global D3D11_PS_LEGACY_PIXEL_CENTER_FRACTIONAL_COMPONENT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_DEPTH_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_DEPTH_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_DEPTH_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_MASK_REGISTER_COMPONENTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_MASK_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_MASK_REGISTER_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PS_OUTPUT_REGISTER_COUNT := 8

/**
 * @type {Float}
 */
export global D3D11_PS_PIXEL_CENTER_FRACTIONAL_COMPONENT := 0.5

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_RAW_UAV_SRV_BYTE_ALIGNMENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_BLEND_OBJECT_COUNT_PER_DEVICE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_BUFFER_RESOURCE_TEXEL_COUNT_2_TO_EXP := 27

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_CONSTANT_BUFFER_ELEMENT_COUNT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_DEPTH_STENCIL_OBJECT_COUNT_PER_DEVICE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_DRAWINDEXED_INDEX_COUNT_2_TO_EXP := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_DRAW_VERTEX_COUNT_2_TO_EXP := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_FILTERING_HW_ADDRESSABLE_RESOURCE_DIMENSION := 16384

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_GS_INVOCATION_32BIT_OUTPUT_COMPONENT_LIMIT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_IMMEDIATE_CONSTANT_BUFFER_ELEMENT_COUNT := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_MAXANISOTROPY := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_MIP_LEVELS := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_MULTI_ELEMENT_STRUCTURE_SIZE_IN_BYTES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_RASTERIZER_OBJECT_COUNT_PER_DEVICE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_RENDER_TO_BUFFER_WINDOW_WIDTH := 16384

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_A_TERM := 128

/**
 * @type {Float}
 */
export global D3D11_REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_B_TERM := 0.25

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_C_TERM := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_RESOURCE_VIEW_COUNT_PER_DEVICE_2_TO_EXP := 20

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_SAMPLER_OBJECT_COUNT_PER_DEVICE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_TEXTURE1D_U_DIMENSION := 16384

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_TEXTURE2D_U_OR_V_DIMENSION := 16384

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_TEXTURE3D_U_V_OR_W_DIMENSION := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_REQ_TEXTURECUBE_DIMENSION := 16384

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_MAJOR_VERSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_MAX_INSTANCES := 65535

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_MAX_INTERFACES := 253

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_MAX_INTERFACE_CALL_SITES := 4096

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_MAX_TYPES := 65535

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_MINOR_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHIFT_INSTRUCTION_PAD_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SIMULTANEOUS_RENDER_TARGET_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SO_BUFFER_MAX_STRIDE_IN_BYTES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES := 512

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SO_BUFFER_SLOT_COUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SO_DDI_REGISTER_INDEX_DENOTING_GAP := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SO_NO_RASTERIZED_STREAM := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SO_OUTPUT_COMPONENT_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SO_STREAM_COUNT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SPEC_DATE_DAY := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SPEC_DATE_MONTH := 5

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SPEC_DATE_YEAR := 2011

/**
 * @type {Float}
 */
export global D3D11_SPEC_VERSION := 1.07

/**
 * @type {Float}
 */
export global D3D11_SRGB_GAMMA := 2.2

/**
 * @type {Float}
 */
export global D3D11_SRGB_TO_FLOAT_DENOMINATOR_1 := 12.92

/**
 * @type {Float}
 */
export global D3D11_SRGB_TO_FLOAT_DENOMINATOR_2 := 1.055

/**
 * @type {Float}
 */
export global D3D11_SRGB_TO_FLOAT_EXPONENT := 2.4

/**
 * @type {Float}
 */
export global D3D11_SRGB_TO_FLOAT_OFFSET := 0.055

/**
 * @type {Float}
 */
export global D3D11_SRGB_TO_FLOAT_THRESHOLD := 0.04045

/**
 * @type {Float}
 */
export global D3D11_SRGB_TO_FLOAT_TOLERANCE_IN_ULP := 0.5

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_COMPONENT_BIT_COUNT_DOUBLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_MAXIMUM_ELEMENT_ALIGNMENT_BYTE_MULTIPLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_PIXEL_COMPONENT_COUNT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_PIXEL_ELEMENT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_VECTOR_SIZE := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_VERTEX_ELEMENT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_STANDARD_VERTEX_TOTAL_COMPONENT_COUNT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SUBPIXEL_FRACTIONAL_BIT_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SUBTEXEL_FRACTIONAL_BIT_COUNT := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TESSELLATOR_MAX_EVEN_TESSELLATION_FACTOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TESSELLATOR_MAX_ISOLINE_DENSITY_TESSELLATION_FACTOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TESSELLATOR_MAX_ODD_TESSELLATION_FACTOR := 63

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TESSELLATOR_MAX_TESSELLATION_FACTOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TESSELLATOR_MIN_EVEN_TESSELLATION_FACTOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TESSELLATOR_MIN_ISOLINE_DENSITY_TESSELLATION_FACTOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TESSELLATOR_MIN_ODD_TESSELLATION_FACTOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TEXEL_ADDRESS_RANGE_BIT_COUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_UNBOUND_MEMORY_ACCESS_RESULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VIEWPORT_AND_SCISSORRECT_MAX_INDEX := 15

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VIEWPORT_BOUNDS_MAX := 32767

/**
 * @type {Integer (Int32)}
 */
export global D3D11_VIEWPORT_BOUNDS_MIN := -32768

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_INPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_INPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_INPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_INPUT_REGISTER_READS_PER_INST := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_INPUT_REGISTER_READ_PORTS := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_OUTPUT_REGISTER_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_VS_OUTPUT_REGISTER_COUNT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_WHQL_CONTEXT_COUNT_FOR_RESOURCE_LIMIT := 10

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_WHQL_DRAWINDEXED_INDEX_COUNT_2_TO_EXP := 25

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_WHQL_DRAW_VERTEX_COUNT_2_TO_EXP := 25

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_1_UAV_SLOT_COUNT := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_2_TILED_RESOURCE_TILE_SIZE_IN_BYTES := 65536

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_4_VIDEO_DECODER_MAX_HISTOGRAM_COMPONENTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_4_VIDEO_DECODER_HISTOGRAM_OFFSET_ALIGNMENT := 256

/**
 * @type {Integer (UInt32)}
 */
export global _FACD3D11 := 2172

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_APPEND_ALIGNED_ELEMENT := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_FILTER_REDUCTION_TYPE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_FILTER_REDUCTION_TYPE_SHIFT := 7

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_FILTER_TYPE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MIN_FILTER_SHIFT := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MAG_FILTER_SHIFT := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_MIP_FILTER_SHIFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_COMPARISON_FILTERING_BIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_ANISOTROPIC_FILTERING_BIT := 64

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG2_MOCOMP := Guid("{e6a9f44b-61b0-4563-9ea4-63d2a3c6fe66}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG2_IDCT := Guid("{bf22ad00-03ea-4690-8077-473346209b7e}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG2_VLD := Guid("{ee27417f-5e28-4e65-beea-1d26b508adc9}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG1_VLD := Guid("{6f3ec719-3735-42cc-8063-65cc3cb36616}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG2and1_VLD := Guid("{86695f12-340e-4f04-9fd3-9253dd327460}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_MOCOMP_NOFGT := Guid("{1b81be64-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_MOCOMP_FGT := Guid("{1b81be65-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_IDCT_NOFGT := Guid("{1b81be66-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_IDCT_FGT := Guid("{1b81be67-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_VLD_NOFGT := Guid("{1b81be68-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_VLD_FGT := Guid("{1b81be69-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_VLD_WITHFMOASO_NOFGT := Guid("{d5f04ff9-3418-45d8-9561-32a76aae2ddd}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_VLD_STEREO_PROGRESSIVE_NOFGT := Guid("{d79be8da-0cf1-4c81-b82a-69a4e236f43d}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_VLD_STEREO_NOFGT := Guid("{f9aaccbb-c2b6-4cfc-8779-5707b1760552}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_H264_VLD_MULTIVIEW_NOFGT := Guid("{705b9d82-76cf-49d6-b7e6-ac8872db013c}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_WMV8_POSTPROC := Guid("{1b81be80-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_WMV8_MOCOMP := Guid("{1b81be81-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_WMV9_POSTPROC := Guid("{1b81be90-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_WMV9_MOCOMP := Guid("{1b81be91-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_WMV9_IDCT := Guid("{1b81be94-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VC1_POSTPROC := Guid("{1b81bea0-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VC1_MOCOMP := Guid("{1b81bea1-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VC1_IDCT := Guid("{1b81bea2-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VC1_VLD := Guid("{1b81bea3-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VC1_D2010 := Guid("{1b81bea4-a0c7-11d3-b984-00c04f2e73c5}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG4PT2_VLD_SIMPLE := Guid("{efd64d74-c9e8-41d7-a5e9-e9b0e39fa319}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG4PT2_VLD_ADVSIMPLE_NOGMC := Guid("{ed418a9f-010d-4eda-9ae3-9a65358d8d2e}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MPEG4PT2_VLD_ADVSIMPLE_GMC := Guid("{ab998b5b-4258-44a9-9feb-94e597a6baae}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN := Guid("{5b11d51b-2f4c-4452-bcc3-09f2a1160cc0}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN10 := Guid("{107af0e0-ef1a-4d19-aba8-67a163073d13}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MONOCHROME := Guid("{0685b993-3d8c-43a0-8b28-d74c2d6899a4}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MONOCHROME10 := Guid("{142a1d0f-69dd-4ec9-8591-b12ffcb91a29}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN12 := Guid("{1a72925f-0c2c-4f15-96fb-b17d1473603f}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN10_422 := Guid("{0bac4fe5-1532-4429-a854-f84de04953db}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN12_422 := Guid("{55bcac81-f311-4093-a7d0-1cbc0b849bee}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN_444 := Guid("{4008018f-f537-4b36-98cf-61af8a2c1a33}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN10_EXT := Guid("{9cc55490-e37c-4932-8684-4920f9f6409c}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN10_444 := Guid("{0dabeffa-4458-4602-bc03-0795659d617c}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN12_444 := Guid("{9798634d-fe9d-48e5-b4da-dbec45b3df01}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_HEVC_VLD_MAIN16 := Guid("{a4fbdbb0-a113-482b-a232-635cc0697f6d}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VP9_VLD_PROFILE0 := Guid("{463707f8-a1d0-4585-876d-83aa6d60b89e}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VP9_VLD_10BIT_PROFILE2 := Guid("{a4c749ef-6ecf-48aa-8448-50a7a1165ff7}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_VP8_VLD := Guid("{90b899ea-3a62-4705-88b3-8df04b2744e7}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_AV1_VLD_PROFILE0 := Guid("{b8be4ccb-cf53-46ba-8d59-d6b8a6da5d2a}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_AV1_VLD_PROFILE1 := Guid("{6936ff0f-45b1-4163-9cc1-646ef6946108}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_AV1_VLD_PROFILE2 := Guid("{0c5f2aa1-e541-4089-bb7b-98110a19d7c8}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_AV1_VLD_12BIT_PROFILE2 := Guid("{17127009-a00f-4ce1-994e-bf4081f6f3f0}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_AV1_VLD_12BIT_PROFILE2_420 := Guid("{2d80bed6-9cac-4835-9e91-327bbc4f9ee8}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MJPEG_VLD_420 := Guid("{725cb506-0c29-43c4-9440-8e9397903a04}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MJPEG_VLD_422 := Guid("{5b77b9cd-1a35-4c30-9fd8-ef4b60c035dd}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MJPEG_VLD_444 := Guid("{d95161f9-0d44-47e6-bcf5-1bfbfb268f97}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_MJPEG_VLD_4444 := Guid("{c91748d5-fd18-4aca-9db3-3a6634ab547d}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_JPEG_VLD_420 := Guid("{cf782c83-bef5-4a2c-87cb-6019e7b175ac}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_JPEG_VLD_422 := Guid("{f04df417-eee2-4067-a778-f35c15ab9721}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_PROFILE_JPEG_VLD_444 := Guid("{4cd00e17-89ba-48ef-b9f9-edcb82713f65}")

/**
 * @type {Guid}
 */
export global D3D11_CRYPTO_TYPE_AES128_CTR := Guid("{9b6bd711-4f74-41c9-9e7b-0be2d7d93b4f}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_ENCRYPTION_HW_CENC := Guid("{89d6ac4f-09f2-4229-b2cd-37740a6dfd81}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_BITSTREAM_ENCRYPTION_TYPE_CENC := Guid("{b0405235-c13d-44f2-9ae5-dd48e08e5b67}")

/**
 * @type {Guid}
 */
export global D3D11_DECODER_BITSTREAM_ENCRYPTION_TYPE_CBCS := Guid("{422d9319-9d21-4bb7-9371-faf5a82c3e04}")

/**
 * @type {Guid}
 */
export global D3D11_KEY_EXCHANGE_HW_PROTECTION := Guid("{b1170d8a-628d-4da3-ad3b-82ddb08b4970}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_PROTECTION := Guid("{a84eb584-c495-48aa-b94d-8bd2d6fbce05}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_CHANNEL_TYPE := Guid("{bc1b18a5-b1fb-42ab-bd94-b5828b4bf7be}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_DEVICE_HANDLE := Guid("{ec1c539d-8cff-4e2a-bcc4-f5692f99f480}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_CRYPTO_SESSION := Guid("{2634499e-d018-4d74-ac17-7f724059528d}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT := Guid("{0db207b3-9450-46a6-82de-1b96d44f9cf2}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS := Guid("{649bbadb-f0f4-4639-a15b-24393fc3abac}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_UNRESTRICTED_PROTECTED_SHARED_RESOURCE_COUNT := Guid("{012f0bd6-e662-4474-befd-aa53e5143c6d}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_OUTPUT_ID_COUNT := Guid("{2c042b5e-8c07-46d5-aabe-8f75cbad4c31}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_OUTPUT_ID := Guid("{839ddca3-9b4e-41e4-b053-892bd2a11ee7}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_ACCESSIBILITY_ATTRIBUTES := Guid("{6214d9d2-432c-4abb-9fce-216eea269e3b}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID_COUNT := Guid("{b30f7066-203c-4b07-93fc-ceaafd61241e}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID := Guid("{f83a5958-e986-4bda-beb0-411f6a7a01b7}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_QUERY_CURRENT_ENCRYPTION_WHEN_ACCESSIBLE := Guid("{ec1791c7-dad3-4f15-9ec3-faa93d60d4f0}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_CONFIGURE_INITIALIZE := Guid("{06114bdb-3523-470a-8dca-fbc2845154f0}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_CONFIGURE_PROTECTION := Guid("{50455658-3f47-4362-bf99-bfdfcde9ed29}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_CONFIGURE_CRYPTO_SESSION := Guid("{6346cc54-2cfc-4ad4-8224-d15837de7700}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_CONFIGURE_SHARED_RESOURCE := Guid("{0772d047-1b40-48e8-9ca6-b5f510de9f01}")

/**
 * @type {Guid}
 */
export global D3D11_AUTHENTICATED_CONFIGURE_ENCRYPTION_WHEN_ACCESSIBLE := Guid("{41fff286-6ae0-4d43-9d55-a46e9efd158a}")

/**
 * @type {Guid}
 */
export global D3D11_KEY_EXCHANGE_RSAES_OAEP := Guid("{c1949895-d72a-4a1d-8e5d-ed857d171520}")

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SDK_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_PACKED_TILE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SDK_LAYERS_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEBUG_FEATURE_FLUSH_PER_RENDER_OP := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEBUG_FEATURE_FINISH_PER_RENDER_OP := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEBUG_FEATURE_PRESENT_PER_RENDER_OP := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEBUG_FEATURE_ALWAYS_DISCARD_OFFERED_RESOURCE := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEBUG_FEATURE_NEVER_DISCARD_OFFERED_RESOURCE := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEBUG_FEATURE_AVOID_BEHAVIOR_CHANGING_DEBUG_AIDS := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION := 128

/**
 * @type {Guid}
 */
export global DXGI_DEBUG_D3D11 := Guid("{4b99317b-ac39-4aa6-bb0b-baa04784798f}")

/**
 * @type {String}
 */
export global D3D11_REGKEY_PATH := "Software\Microsoft\Direct3D"

/**
 * @type {String}
 */
export global D3D11_MUTE_DEBUG_OUTPUT := "MuteDebugOutput"

/**
 * @type {String}
 */
export global D3D11_ENABLE_BREAK_ON_MESSAGE := "EnableBreakOnMessage"

/**
 * @type {String}
 */
export global D3D11_INFOQUEUE_STORAGE_FILTER_OVERRIDE := "InfoQueueStorageFilterOverride"

/**
 * @type {String}
 */
export global D3D11_MUTE_CATEGORY := "Mute_CATEGORY_%s"

/**
 * @type {String}
 */
export global D3D11_MUTE_SEVERITY := "Mute_SEVERITY_%s"

/**
 * @type {String}
 */
export global D3D11_MUTE_ID_STRING := "Mute_ID_%s"

/**
 * @type {String}
 */
export global D3D11_MUTE_ID_DECIMAL := "Mute_ID_%d"

/**
 * @type {String}
 */
export global D3D11_UNMUTE_SEVERITY_INFO := "Unmute_SEVERITY_INFO"

/**
 * @type {String}
 */
export global D3D11_BREAKON_CATEGORY := "BreakOn_CATEGORY_%s"

/**
 * @type {String}
 */
export global D3D11_BREAKON_SEVERITY := "BreakOn_SEVERITY_%s"

/**
 * @type {String}
 */
export global D3D11_BREAKON_ID_STRING := "BreakOn_ID_%s"

/**
 * @type {String}
 */
export global D3D11_BREAKON_ID_DECIMAL := "BreakOn_ID_%d"

/**
 * @type {String}
 */
export global D3D11_APPSIZE_STRING := "Size"

/**
 * @type {String}
 */
export global D3D11_APPNAME_STRING := "Name"

/**
 * @type {String}
 */
export global D3D11_FORCE_DEBUGGABLE := "ForceDebuggable"

/**
 * @type {String}
 */
export global D3D11_FORCE_SHADER_SKIP_OPTIMIZATION := "ForceShaderSkipOptimization"

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT := 1024

/**
 * @type {Integer (Int32)}
 */
export global D3D_RETURN_PARAMETER_INDEX := -1

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_DOUBLES := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_EARLY_DEPTH_STENCIL := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_UAVS_AT_EVERY_STAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_64_UAVS := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_MINIMUM_PRECISION := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_11_1_DOUBLE_EXTENSIONS := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_11_1_SHADER_EXTENSIONS := 64

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_LEVEL_9_COMPARISON_FILTERING := 128

/**
 * @type {Integer (UInt32)}
 */
export global D3D_SHADER_REQUIRES_TILED_RESOURCES := 256

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_COMPONENT_X := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_COMPONENT_Y := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_COMPONENT_Z := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_COMPONENT_W := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_WRITES := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_SHADER_TRACE_FLAG_RECORD_REGISTER_READS := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_REGISTER_FLAGS_RELATIVE_INDEXING := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_MISC_GS_EMIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_MISC_GS_CUT := 2

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_MISC_PS_DISCARD := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_MISC_GS_EMIT_STREAM := 8

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_MISC_GS_CUT_STREAM := 16

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_MISC_HALT := 32

/**
 * @type {Integer (UInt32)}
 */
export global D3D11_TRACE_MISC_MESSAGE := 64

/**
 * @type {String}
 */
export global D3DCSX_DLL_W := "d3dcsx_47.dll"

/**
 * @type {String}
 */
export global D3DCSX_DLL_A := "d3dcsx_47.dll"

/**
 * @type {String}
 */
export global D3DCSX_DLL := "d3dcsx_47.dll"

/**
 * @type {Integer (UInt32)}
 */
export global D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DX11_FFT_MAX_TEMP_BUFFERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global D3DX11_FFT_MAX_DIMENSIONS := 32
;@endregion Constants

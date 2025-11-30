#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class Direct3D12 {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_ALWAYS_SET_BIT_AVOIDING_ZEROMEM_MISTAKES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_SHADER_4_COMPONENT_MAPPING => 5768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_16BIT_INDEX_STRIP_CUT_VALUE => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_32BIT_INDEX_STRIP_CUT_VALUE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_8BIT_INDEX_STRIP_CUT_VALUE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_APPEND_ALIGNED_ELEMENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CLIP_OR_CULL_DISTANCE_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CLIP_OR_CULL_DISTANCE_ELEMENT_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_HW_SLOT_COUNT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_PARTIAL_UPDATE_EXTENTS_BYTE_ALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_REGISTER_COUNT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_CONSTANT_BUFFER_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_FLOWCONTROL_NESTING_LIMIT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_IMMEDIATE_VALUE_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_INPUT_RESOURCE_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_INPUT_RESOURCE_REGISTER_COUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_INPUT_RESOURCE_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_INPUT_RESOURCE_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_SAMPLER_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_SAMPLER_REGISTER_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_SAMPLER_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_SAMPLER_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_SAMPLER_SLOT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_SUBROUTINE_NESTING_LIMIT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_TEMP_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_TEMP_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_TEMP_REGISTER_COUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_TEMP_REGISTER_READS_PER_INST => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_TEMP_REGISTER_READ_PORTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MAX => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MIN => -10

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_COMMONSHADER_TEXEL_OFFSET_MAX_NEGATIVE => -8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_COMMONSHADER_TEXEL_OFFSET_MAX_POSITIVE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CONSTANT_BUFFER_DATA_PLACEMENT_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET00_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET00_MAX_NUM_THREADS_PER_GROUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET01_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 240

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET01_MAX_NUM_THREADS_PER_GROUP => 68

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET02_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 224

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET02_MAX_NUM_THREADS_PER_GROUP => 72

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET03_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 208

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET03_MAX_NUM_THREADS_PER_GROUP => 76

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET04_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET04_MAX_NUM_THREADS_PER_GROUP => 84

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET05_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 176

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET05_MAX_NUM_THREADS_PER_GROUP => 92

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET06_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 160

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET06_MAX_NUM_THREADS_PER_GROUP => 100

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET07_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 144

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET07_MAX_NUM_THREADS_PER_GROUP => 112

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET08_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET08_MAX_NUM_THREADS_PER_GROUP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET09_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 112

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET09_MAX_NUM_THREADS_PER_GROUP => 144

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET10_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 96

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET10_MAX_NUM_THREADS_PER_GROUP => 168

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET11_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 80

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET11_MAX_NUM_THREADS_PER_GROUP => 204

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET12_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET12_MAX_NUM_THREADS_PER_GROUP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET13_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 48

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET13_MAX_NUM_THREADS_PER_GROUP => 340

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET14_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET14_MAX_NUM_THREADS_PER_GROUP => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET15_MAX_BYTES_TGSM_WRITABLE_PER_THREAD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_BUCKET15_MAX_NUM_THREADS_PER_GROUP => 768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_DISPATCH_MAX_THREAD_GROUPS_IN_Z_DIMENSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_RAW_UAV_BYTE_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_THREAD_GROUP_MAX_THREADS_PER_GROUP => 768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_THREAD_GROUP_MAX_X => 768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_THREAD_GROUP_MAX_Y => 768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_4_X_UAV_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_TGSM_REGISTER_COUNT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_TGSM_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_TGSM_RESOURCE_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_TGSM_RESOURCE_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADGROUPID_REGISTER_COMPONENTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADGROUPID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADIDINGROUPFLATTENED_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADIDINGROUPFLATTENED_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADIDINGROUP_REGISTER_COMPONENTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADIDINGROUP_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADID_REGISTER_COMPONENTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREADID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_GROUP_MAX_THREADS_PER_GROUP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_GROUP_MAX_X => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_GROUP_MAX_Y => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_GROUP_MAX_Z => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_GROUP_MIN_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_GROUP_MIN_Y => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_GROUP_MIN_Z => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_CS_THREAD_LOCAL_TEMP_REGISTER_POOL => 16384

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_ALPHA => 1

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_BLUE => 1

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_GREEN => 1

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_RED => 1

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_BORDER_COLOR_COMPONENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEFAULT_DEPTH_BIAS => 0

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_DEPTH_BIAS_CLAMP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_MAX_ANISOTROPY => 16

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_MIP_LOD_BIAS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_MSAA_RESOURCE_PLACEMENT_ALIGNMENT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_RENDER_TARGET_ARRAY_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_RESOURCE_PLACEMENT_ALIGNMENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_SAMPLE_MASK => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_SCISSOR_ENDX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_SCISSOR_ENDY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_SCISSOR_STARTX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_SCISSOR_STARTY => 0

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_SLOPE_SCALED_DEPTH_BIAS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_STENCIL_READ_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_STENCIL_REFERENCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_STENCIL_WRITE_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_VIEWPORT_AND_SCISSORRECT_INDEX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_VIEWPORT_HEIGHT => 0

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_VIEWPORT_MAX_DEPTH => 0

    /**
     * @type {Float}
     */
    static D3D12_DEFAULT_VIEWPORT_MIN_DEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_VIEWPORT_TOPLEFTX => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_VIEWPORT_TOPLEFTY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_VIEWPORT_WIDTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DESCRIPTOR_RANGE_OFFSET_APPEND => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DRIVER_RESERVED_REGISTER_SPACE_VALUES_END => 4294967287

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DRIVER_RESERVED_REGISTER_SPACE_VALUES_START => 4294967280

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS => 3968

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_CONTROL_POINT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_CONTROL_POINT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_CONTROL_POINT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_CONTROL_POINT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_DOMAIN_POINT_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_DOMAIN_POINT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_DOMAIN_POINT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PATCH_CONSTANT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PATCH_CONSTANT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PRIMITIVE_ID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_OUTPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DS_OUTPUT_REGISTER_COUNT => 32

    /**
     * @type {Float}
     */
    static D3D12_FLOAT16_FUSED_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Float}
     */
    static D3D12_FLOAT32_MAX => 3.4028235E+38

    /**
     * @type {Float}
     */
    static D3D12_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Float}
     */
    static D3D12_FLOAT_TO_SRGB_EXPONENT_DENOMINATOR => 2.4

    /**
     * @type {Float}
     */
    static D3D12_FLOAT_TO_SRGB_EXPONENT_NUMERATOR => 1

    /**
     * @type {Float}
     */
    static D3D12_FLOAT_TO_SRGB_OFFSET => 0.055

    /**
     * @type {Float}
     */
    static D3D12_FLOAT_TO_SRGB_SCALE_1 => 12.92

    /**
     * @type {Float}
     */
    static D3D12_FLOAT_TO_SRGB_SCALE_2 => 1.055

    /**
     * @type {Float}
     */
    static D3D12_FLOAT_TO_SRGB_THRESHOLD => 0.0031308

    /**
     * @type {Float}
     */
    static D3D12_FTOI_INSTRUCTION_MAX_INPUT => 2.1474836E+09

    /**
     * @type {Float}
     */
    static D3D12_FTOI_INSTRUCTION_MIN_INPUT => -2.1474836E+09

    /**
     * @type {Float}
     */
    static D3D12_FTOU_INSTRUCTION_MAX_INPUT => 4.2949673E+09

    /**
     * @type {Float}
     */
    static D3D12_FTOU_INSTRUCTION_MIN_INPUT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_INSTANCE_ID_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_INSTANCE_ID_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_INSTANCE_ID_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_INSTANCE_ID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_PRIM_CONST_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_PRIM_CONST_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_PRIM_CONST_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_PRIM_CONST_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_PRIM_CONST_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_INPUT_REGISTER_VERTICES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_MAX_INSTANCE_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_MAX_OUTPUT_VERTEX_COUNT_ACROSS_INSTANCES => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_OUTPUT_ELEMENTS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_OUTPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_GS_OUTPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_CONTROL_POINT_PHASE_INPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_CONTROL_POINT_PHASE_OUTPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_CONTROL_POINT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_CONTROL_POINT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_CONTROL_POINT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_FORK_PHASE_INSTANCE_COUNT_UPPER_BOUND => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_FORK_INSTANCE_ID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_FORK_INSTANCE_ID_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_FORK_INSTANCE_ID_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_PRIMITIVE_ID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_JOIN_PHASE_INSTANCE_COUNT_UPPER_BOUND => 4294967295

    /**
     * @type {Float}
     */
    static D3D12_HS_MAXTESSFACTOR_LOWER_BOUND => 1

    /**
     * @type {Float}
     */
    static D3D12_HS_MAXTESSFACTOR_UPPER_BOUND => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS => 3968

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_PATCH_CONSTANT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_PATCH_CONSTANT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_HS_OUTPUT_PATCH_CONSTANT_REGISTER_SCALAR_COMPONENTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_DEFAULT_INDEX_BUFFER_OFFSET_IN_BYTES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_DEFAULT_PRIMITIVE_TOPOLOGY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_DEFAULT_VERTEX_BUFFER_OFFSET_IN_BYTES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_INDEX_INPUT_RESOURCE_SLOT_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_INSTANCE_ID_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_INTEGER_ARITHMETIC_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_PATCH_MAX_CONTROL_POINT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_PRIMITIVE_ID_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_VERTEX_ID_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_INTEGER_DIVIDE_BY_ZERO_QUOTIENT => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_INTEGER_DIVIDE_BY_ZERO_REMAINDER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_KEEP_UNORDERED_ACCESS_VIEWS => 4294967295

    /**
     * @type {Float}
     */
    static D3D12_LINEAR_GAMMA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAJOR_VERSION => 12

    /**
     * @type {Float}
     */
    static D3D12_MAX_BORDER_COLOR_COMPONENT => 1

    /**
     * @type {Float}
     */
    static D3D12_MAX_DEPTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_LIVE_STATIC_SAMPLERS => 2032

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_MAXANISOTROPY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_MULTISAMPLE_SAMPLE_COUNT => 32

    /**
     * @type {Float}
     */
    static D3D12_MAX_POSITION_VALUE => 3.4028236E+34

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_ROOT_COST => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_SHADER_VISIBLE_DESCRIPTOR_HEAP_SIZE_TIER_1 => 1000000

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_SHADER_VISIBLE_DESCRIPTOR_HEAP_SIZE_TIER_2 => 1000000

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_SHADER_VISIBLE_SAMPLER_HEAP_SIZE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_TEXTURE_DIMENSION_2_TO_EXP => 17

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAX_VIEW_INSTANCE_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MINOR_VERSION => 0

    /**
     * @type {Float}
     */
    static D3D12_MIN_BORDER_COLOR_COMPONENT => 0

    /**
     * @type {Float}
     */
    static D3D12_MIN_DEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MIN_MAXANISOTROPY => 0

    /**
     * @type {Float}
     */
    static D3D12_MIP_LOD_BIAS_MAX => 15.99

    /**
     * @type {Float}
     */
    static D3D12_MIP_LOD_BIAS_MIN => -16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MIP_LOD_FRACTIONAL_BIT_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MIP_LOD_RANGE_BIT_COUNT => 8

    /**
     * @type {Float}
     */
    static D3D12_MULTISAMPLE_ANTIALIAS_LINE_WIDTH => 1.4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_OS_RESERVED_REGISTER_SPACE_VALUES_END => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_OS_RESERVED_REGISTER_SPACE_VALUES_START => 4294967288

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PACKED_TILE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PIXEL_ADDRESS_RANGE_BIT_COUNT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PREVIEW_SDK_VERSION => 717

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_CS_UAV_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_CS_UAV_REGISTER_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_CS_UAV_REGISTER_READS_PER_INST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_CS_UAV_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_FRONTFACING_DEFAULT_VALUE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_FRONTFACING_FALSE_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_FRONTFACING_TRUE_VALUE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_INPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_INPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_INPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_INPUT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_INPUT_REGISTER_READ_PORTS => 1

    /**
     * @type {Float}
     */
    static D3D12_PS_LEGACY_PIXEL_CENTER_FRACTIONAL_COMPONENT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_DEPTH_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_DEPTH_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_DEPTH_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_MASK_REGISTER_COMPONENTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_MASK_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_MASK_REGISTER_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_PS_OUTPUT_REGISTER_COUNT => 8

    /**
     * @type {Float}
     */
    static D3D12_PS_PIXEL_CENTER_FRACTIONAL_COMPONENT => 0.5

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAW_UAV_SRV_BYTE_ALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_AABB_BYTE_ALIGNMENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_INSTANCE_DESCS_BYTE_ALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_MAX_ATTRIBUTE_SIZE_IN_BYTES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_MAX_DECLARABLE_TRACE_RECURSION_DEPTH => 31

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_MAX_GEOMETRIES_PER_BOTTOM_LEVEL_ACCELERATION_STRUCTURE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_MAX_INSTANCES_PER_TOP_LEVEL_ACCELERATION_STRUCTURE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_MAX_PRIMITIVES_PER_BOTTOM_LEVEL_ACCELERATION_STRUCTURE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_MAX_RAY_GENERATION_SHADER_THREADS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_MAX_SHADER_RECORD_STRIDE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_OPACITY_MICROMAP_ARRAY_BYTE_ALIGNMENT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_OPACITY_MICROMAP_OC1_MAX_SUBDIVISION_LEVEL => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RAYTRACING_TRANSFORM3X4_BYTE_ALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_BLEND_OBJECT_COUNT_PER_DEVICE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_BUFFER_RESOURCE_TEXEL_COUNT_2_TO_EXP => 27

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_CONSTANT_BUFFER_ELEMENT_COUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_DEPTH_STENCIL_OBJECT_COUNT_PER_DEVICE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_DRAWINDEXED_INDEX_COUNT_2_TO_EXP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_DRAW_VERTEX_COUNT_2_TO_EXP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_FILTERING_HW_ADDRESSABLE_RESOURCE_DIMENSION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_GS_INVOCATION_32BIT_OUTPUT_COMPONENT_LIMIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_IMMEDIATE_CONSTANT_BUFFER_ELEMENT_COUNT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_MAXANISOTROPY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_MIP_LEVELS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_MULTI_ELEMENT_STRUCTURE_SIZE_IN_BYTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_RASTERIZER_OBJECT_COUNT_PER_DEVICE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_RENDER_TO_BUFFER_WINDOW_WIDTH => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_A_TERM => 128

    /**
     * @type {Float}
     */
    static D3D12_REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_B_TERM => 0.25

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_C_TERM => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_RESOURCE_VIEW_COUNT_PER_DEVICE_2_TO_EXP => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_SAMPLER_OBJECT_COUNT_PER_DEVICE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_SUBRESOURCES => 30720

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_TEXTURE1D_U_DIMENSION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_TEXTURE2D_U_OR_V_DIMENSION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_TEXTURE3D_U_V_OR_W_DIMENSION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_REQ_TEXTURECUBE_DIMENSION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_RS_SET_SHADING_RATE_COMBINER_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SDK_VERSION => 618

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_IDENTIFIER_SIZE_IN_BYTES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_MAJOR_VERSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_MAX_INSTANCES => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_MAX_INTERFACES => 253

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_MAX_INTERFACE_CALL_SITES => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_MAX_TYPES => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_MINOR_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHIFT_INSTRUCTION_PAD_VALUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SIMULTANEOUS_RENDER_TARGET_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SMALL_MSAA_RESOURCE_PLACEMENT_ALIGNMENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SMALL_RESOURCE_PLACEMENT_ALIGNMENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SO_BUFFER_MAX_STRIDE_IN_BYTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SO_BUFFER_SLOT_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SO_DDI_REGISTER_INDEX_DENOTING_GAP => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SO_NO_RASTERIZED_STREAM => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SO_OUTPUT_COMPONENT_COUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SO_STREAM_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SPEC_DATE_DAY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SPEC_DATE_MONTH => 11

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SPEC_DATE_YEAR => 2014

    /**
     * @type {Float}
     */
    static D3D12_SPEC_VERSION => 1.16

    /**
     * @type {Float}
     */
    static D3D12_SRGB_GAMMA => 2.2

    /**
     * @type {Float}
     */
    static D3D12_SRGB_TO_FLOAT_DENOMINATOR_1 => 12.92

    /**
     * @type {Float}
     */
    static D3D12_SRGB_TO_FLOAT_DENOMINATOR_2 => 1.055

    /**
     * @type {Float}
     */
    static D3D12_SRGB_TO_FLOAT_EXPONENT => 2.4

    /**
     * @type {Float}
     */
    static D3D12_SRGB_TO_FLOAT_OFFSET => 0.055

    /**
     * @type {Float}
     */
    static D3D12_SRGB_TO_FLOAT_THRESHOLD => 0.04045

    /**
     * @type {Float}
     */
    static D3D12_SRGB_TO_FLOAT_TOLERANCE_IN_ULP => 0.5

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_COMPONENT_BIT_COUNT_DOUBLED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_MAXIMUM_ELEMENT_ALIGNMENT_BYTE_MULTIPLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_PIXEL_COMPONENT_COUNT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_PIXEL_ELEMENT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_VECTOR_SIZE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_VERTEX_ELEMENT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_STANDARD_VERTEX_TOTAL_COMPONENT_COUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SUBPIXEL_FRACTIONAL_BIT_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SUBTEXEL_FRACTIONAL_BIT_COUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SYSTEM_RESERVED_REGISTER_SPACE_VALUES_END => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SYSTEM_RESERVED_REGISTER_SPACE_VALUES_START => 4294967280

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TESSELLATOR_MAX_EVEN_TESSELLATION_FACTOR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TESSELLATOR_MAX_ISOLINE_DENSITY_TESSELLATION_FACTOR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TESSELLATOR_MAX_ODD_TESSELLATION_FACTOR => 63

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TESSELLATOR_MAX_TESSELLATION_FACTOR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TESSELLATOR_MIN_EVEN_TESSELLATION_FACTOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TESSELLATOR_MIN_ISOLINE_DENSITY_TESSELLATION_FACTOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TESSELLATOR_MIN_ODD_TESSELLATION_FACTOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TEXEL_ADDRESS_RANGE_BIT_COUNT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TEXTURE_DATA_PITCH_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TEXTURE_DATA_PLACEMENT_ALIGNMENT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TIGHT_ALIGNMENT_MIN_COMMITTED_RESOURCE_ALIGNMENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TIGHT_ALIGNMENT_MIN_PLACED_RESOURCE_ALIGNMENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TILED_RESOURCE_TILE_SIZE_IN_BYTES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_TRACKED_WORKLOAD_MAX_INSTANCES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_UAV_COUNTER_PLACEMENT_ALIGNMENT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_UAV_SLOT_COUNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_UNBOUND_MEMORY_ACCESS_RESULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_DECODE_MAX_ARGUMENTS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_DECODE_MAX_HISTOGRAM_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_DECODE_MIN_BITSTREAM_OFFSET_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_DECODE_MIN_HISTOGRAM_OFFSET_ALIGNMENT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_DECODE_STATUS_MACROBLOCKS_AFFECTED_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_INVALID_DPB_RESOURCE_INDEX => 255

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_MAX_TILE_COLS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_MAX_TILE_ROWS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SUPERRES_DENOM_MIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_ENCODER_AV1_SUPERRES_NUM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_MAX_FILTERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIDEO_PROCESS_STEREO_VIEWS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIEWPORT_AND_SCISSORRECT_MAX_INDEX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VIEWPORT_BOUNDS_MAX => 32767

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIEWPORT_BOUNDS_MIN => -32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_INPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_INPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_INPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_INPUT_REGISTER_READS_PER_INST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_INPUT_REGISTER_READ_PORTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_OUTPUT_REGISTER_COMPONENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_VS_OUTPUT_REGISTER_COUNT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_WHQL_CONTEXT_COUNT_FOR_RESOURCE_LIMIT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_WHQL_DRAWINDEXED_INDEX_COUNT_2_TO_EXP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_WHQL_DRAW_VERTEX_COUNT_2_TO_EXP => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_WORK_GRAPHS_BACKING_MEMORY_ALIGNMENT_IN_BYTES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_WORK_GRAPHS_MAX_NODE_DEPTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LUID_DEFINED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_MASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADER_COMPONENT_MAPPING_SHIFT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_FILTER_REDUCTION_TYPE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_FILTER_REDUCTION_TYPE_SHIFT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_FILTER_TYPE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MIN_FILTER_SHIFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAG_FILTER_SHIFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MIP_FILTER_SHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_ANISOTROPIC_FILTERING_BIT => 64

    /**
     * @type {Guid}
     */
    static D3D12_PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED => Guid("{62b0084e-c70e-4daa-a109-30ff8d5a0482}")

    /**
     * @type {Guid}
     */
    static CLSID_D3D12Debug => Guid("{f2352aeb-dd84-49fe-b97b-a9dcfdcc1b4f}")

    /**
     * @type {Guid}
     */
    static CLSID_D3D12Tools => Guid("{e38216b1-3c8c-4833-aa09-0a06b65d96c8}")

    /**
     * @type {Guid}
     */
    static CLSID_D3D12DeviceRemovedExtendedData => Guid("{4a75bbc4-9ff4-4ad8-9f18-abae84dc5ff2}")

    /**
     * @type {Guid}
     */
    static CLSID_D3D12SDKConfiguration => Guid("{7cda6aca-a03e-49c8-9458-0334d20e07ce}")

    /**
     * @type {Guid}
     */
    static CLSID_D3D12DeviceFactory => Guid("{114863bf-c386-4aee-b39d-8f0bbb062955}")

    /**
     * @type {Guid}
     */
    static CLSID_D3D12DSRDeviceFactory => Guid("{bb6dd27e-94a9-41a6-9f1b-133772172428}")

    /**
     * @type {Guid}
     */
    static CLSID_D3D12StateObjectFactory => Guid("{54e1c9f3-1303-4112-bf8e-7bf2bb606a73}")

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADING_RATE_X_AXIS_SHIFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADING_RATE_VALID_MASK => 3

    /**
     * @type {Guid}
     */
    static WKPDID_D3DAutoDebugObjectNameW => Guid("{d4902e36-757a-4942-9594-b6769afa43cd}")

    /**
     * @type {Guid}
     */
    static DXGI_DEBUG_D3D12 => Guid("{cf59a98c-a950-4326-91ef-9bbaa17bfd95}")

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_STENCIL_REF => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_INNER_COVERAGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_TYPED_UAV_LOAD_ADDITIONAL_FORMATS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_ROVS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_VIEWPORT_AND_RT_ARRAY_INDEX_FROM_ANY_SHADER_FEEDING_RASTERIZER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_WAVE_OPS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_INT64_OPS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_VIEW_ID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_BARYCENTRICS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_NATIVE_16BIT_OPS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_SHADING_RATE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_RAYTRACING_TIER_1_1 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_SAMPLER_FEEDBACK => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_ATOMIC_INT64_ON_TYPED_RESOURCE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_ATOMIC_INT64_ON_GROUP_SHARED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_DERIVATIVES_IN_MESH_AND_AMPLIFICATION_SHADERS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_RESOURCE_DESCRIPTOR_HEAP_INDEXING => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_SAMPLER_DESCRIPTOR_HEAP_INDEXING => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_WAVE_MMA => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_ATOMIC_INT64_ON_DESCRIPTOR_HEAP_RESOURCE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_ADVANCED_TEXTURE_OPS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_WRITEABLE_MSAA_TEXTURES => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_REQUIRES_SAMPLE_CMP_GRADIENT_OR_BIAS => 2147483648

    /**
     * @type {Guid}
     */
    static D3D12ExperimentalShaderModels => Guid("{76f5573e-f13a-40f5-b297-81ce9e18933f}")

    /**
     * @type {Guid}
     */
    static D3D12TiledResourceTier4 => Guid("{c9c4725f-a81a-4f56-8c5b-c51039d694fb}")

    /**
     * @type {Guid}
     */
    static D3D12GPUUploadHeapsOnUnsupportedOS => Guid("{45dc51f3-767f-4588-b206-0baa2b16fbae}")
;@endregion Constants

;@region Methods
    /**
     * Serializes a root signature version 1.0 that can be passed to ID3D12Device::CreateRootSignature.
     * @param {Pointer<D3D12_ROOT_SIGNATURE_DESC>} pRootSignature Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a>*</b>
     * 
     * The description of the root signature, as a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> structure.
     * @param {Integer} Version Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d_root_signature_version">D3D_ROOT_SIGNATURE_VERSION</a>-typed value that specifies the version of root signature.
     * @param {Pointer<ID3DBlob>} ppBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the serialized root signature.
     * @param {Pointer<ID3DBlob>} ppErrorBlob Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access serializer error messages, or <b>NULL</b> if there are no errors.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-d3d12serializerootsignature
     */
    static D3D12SerializeRootSignature(pRootSignature, Version, ppBlob, ppErrorBlob) {
        result := DllCall("d3d12.dll\D3D12SerializeRootSignature", "ptr", pRootSignature, "int", Version, "ptr*", ppBlob, "ptr*", ppErrorBlob, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deserializes a root signature so you can determine the layout definition (D3D12_ROOT_SIGNATURE_DESC).
     * @param {Pointer} pSrcData Type: <b>LPCVOID</b>
     * 
     * A pointer to the source data for the serialized root signature.
     * @param {Pointer} SrcDataSizeInBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Pointer<Guid>} pRootSignatureDeserializerInterface Type: <b><b>REFIID</b></b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the root signature deserializer interface. See remarks.
     * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the root signature deserializer.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-d3d12createrootsignaturedeserializer
     */
    static D3D12CreateRootSignatureDeserializer(pSrcData, SrcDataSizeInBytes, pRootSignatureDeserializerInterface) {
        result := DllCall("d3d12.dll\D3D12CreateRootSignatureDeserializer", "ptr", pSrcData, "ptr", SrcDataSizeInBytes, "ptr", pRootSignatureDeserializerInterface, "ptr*", &ppRootSignatureDeserializer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRootSignatureDeserializer
    }

    /**
     * Serializes a root signature of any version that can be passed to ID3D12Device::CreateRootSignature.
     * @param {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} pRootSignature Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a>*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a> that contains a description of any version of a root signature.
     * @param {Pointer<ID3DBlob>} ppBlob Type: <b>ID3DBlob**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the serialized root signature.
     * @param {Pointer<ID3DBlob>} ppErrorBlob Type: <b>ID3DBlob**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access serializer error messages, or <b>NULL</b> if there are no errors.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-d3d12serializeversionedrootsignature
     */
    static D3D12SerializeVersionedRootSignature(pRootSignature, ppBlob, ppErrorBlob) {
        result := DllCall("d3d12.dll\D3D12SerializeVersionedRootSignature", "ptr", pRootSignature, "ptr*", ppBlob, "ptr*", ppErrorBlob, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Generates an interface that can return the deserialized data structure, via GetUnconvertedRootSignatureDesc.
     * @param {Pointer} pSrcData Type: <b>LPCVOID</b>
     * 
     * A pointer to the source data for the serialized root signature.
     * @param {Pointer} SrcDataSizeInBytes Type: <b>SIZE_T</b>
     * 
     * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Pointer<Guid>} pRootSignatureDeserializerInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the root signature deserializer interface. See remarks.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the root signature deserializer.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-d3d12createversionedrootsignaturedeserializer
     */
    static D3D12CreateVersionedRootSignatureDeserializer(pSrcData, SrcDataSizeInBytes, pRootSignatureDeserializerInterface) {
        result := DllCall("d3d12.dll\D3D12CreateVersionedRootSignatureDeserializer", "ptr", pSrcData, "ptr", SrcDataSizeInBytes, "ptr", pRootSignatureDeserializerInterface, "ptr*", &ppRootSignatureDeserializer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppRootSignatureDeserializer
    }

    /**
     * Creates a device that represents the display adapter.
     * @param {IUnknown} pAdapter Type: <b>IUnknown*</b>
     * 
     * A pointer to the video adapter to use when creating a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-intro">device</a>.
     *             Pass <b>NULL</b> to use the default adapter, which is the first adapter that is enumerated by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory1::EnumAdapters</a>.
     *             
     * 
     * <div class="alert"><b>Note</b>  Don't mix the use of DXGI 1.0 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>) and DXGI 1.1 (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a>) in an application.
     *               Use <b>IDXGIFactory</b> or <b>IDXGIFactory1</b>, but not both in an application.
     *             </div>
     * <div> </div>
     * @param {Integer} MinimumFeatureLevel Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a></b>
     * 
     * The minimum <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a> required for successful device creation.
     * @param {Pointer<Guid>} riid Type: <b><b>REFIID</b></b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the device interface.
     *             This parameter, and <i>ppDevice</i>, can be addressed with the single macro
     *           <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iid_ppv_args">IID_PPV_ARGS</a>.
     * @returns {Pointer<Void>} Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the device. Pass **NULL** to test if device creation would succeed, but to not actually create the device. If **NULL** is passed and device creation would succeed, **S_FALSE** is returned.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-d3d12createdevice
     */
    static D3D12CreateDevice(pAdapter, MinimumFeatureLevel, riid) {
        result := DllCall("d3d12.dll\D3D12CreateDevice", "ptr", pAdapter, "int", MinimumFeatureLevel, "ptr", riid, "ptr*", &ppDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppDevice
    }

    /**
     * Gets a debug interface.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the debug interface.
     *             The <b>REFIID</b>, or <b>GUID</b>, of the debug interface can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug">ID3D12Debug</a>) will get the <b>GUID</b> of the debug interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The debug interface, as a pointer to pointer to void.
     *             See
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug">ID3D12Debug</a>and
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice">ID3D12DebugDevice</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-d3d12getdebuginterface
     */
    static D3D12GetDebugInterface(riid) {
        result := DllCall("d3d12.dll\D3D12GetDebugInterface", "ptr", riid, "ptr*", &ppvDebug := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvDebug
    }

    /**
     * Enables a list of experimental features.
     * @param {Integer} NumFeatures Type: <b>UINT</b>
     * 
     * The number of experimental features to enable.
     * @param {Pointer<Guid>} pIIDs Type: <b>const IID*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>__in_ecount(NumFeatures)</c>
     * 
     * A pointer to an array of IDs that specify which of the available experimental features to enable.
     * @param {Pointer<Void>} pConfigurationStructs Type: <b>void*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>__in_ecount(NumFeatures)</c>
     * 
     * Structures that contain additional configuration details that some experimental features might need to be enabled.
     * @param {Pointer<Integer>} pConfigurationStructSizes Type: <b>UINT*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015">SAL</a>: <c>__in_ecount(NumFeatures)</c>
     * 
     * The sizes of any configuration structs passed in pConfigurationStructs parameter.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code that can include E_NOINTERFACE if an unrecognized feature is specified or Developer Mode is not enabled, or E_INVALIDARG if the configuration of a feature is in correct, the experimental features specified are not compatible, or other errors.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-d3d12enableexperimentalfeatures
     */
    static D3D12EnableExperimentalFeatures(NumFeatures, pIIDs, pConfigurationStructs, pConfigurationStructSizes) {
        pConfigurationStructsMarshal := pConfigurationStructs is VarRef ? "ptr" : "ptr"
        pConfigurationStructSizesMarshal := pConfigurationStructSizes is VarRef ? "uint*" : "ptr"

        result := DllCall("d3d12.dll\D3D12EnableExperimentalFeatures", "uint", NumFeatures, "ptr", pIIDs, pConfigurationStructsMarshal, pConfigurationStructs, pConfigurationStructSizesMarshal, pConfigurationStructSizes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12getinterface
     */
    static D3D12GetInterface(rclsid, riid) {
        result := DllCall("d3d12.dll\D3D12GetInterface", "ptr", rclsid, "ptr", riid, "ptr*", &ppvDebug := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvDebug
    }

;@endregion Methods
}

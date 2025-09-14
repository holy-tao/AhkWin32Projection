#Requires AutoHotkey v2.0.0 64-bit

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
     * @type {Integer (Single)}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_ALPHA => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_BLUE => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_GREEN => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D12_DEFAULT_BLEND_FACTOR_RED => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D12_DEFAULT_BORDER_COLOR_COMPONENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEFAULT_DEPTH_BIAS => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D12_DEFAULT_DEPTH_BIAS_CLAMP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_DEFAULT_MAX_ANISOTROPY => 16

    /**
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
     */
    static D3D12_DEFAULT_VIEWPORT_MAX_DEPTH => 0

    /**
     * @type {Integer (Single)}
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
     * @type {Integer (Double)}
     */
    static D3D12_FLOAT16_FUSED_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT32_MAX => 3.4028235E+38

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP => 0.6

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT_TO_SRGB_EXPONENT_DENOMINATOR => 2.4

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT_TO_SRGB_EXPONENT_NUMERATOR => 1

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT_TO_SRGB_OFFSET => 0.055

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT_TO_SRGB_SCALE_1 => 12.92

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT_TO_SRGB_SCALE_2 => 1.055

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FLOAT_TO_SRGB_THRESHOLD => 0.0031308

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FTOI_INSTRUCTION_MAX_INPUT => 2.1474836E+09

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FTOI_INSTRUCTION_MIN_INPUT => -2.1474836E+09

    /**
     * @type {Integer (Single)}
     */
    static D3D12_FTOU_INSTRUCTION_MAX_INPUT => 4.2949673E+09

    /**
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
     */
    static D3D12_HS_MAXTESSFACTOR_LOWER_BOUND => 1

    /**
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
     */
    static D3D12_LINEAR_GAMMA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MAJOR_VERSION => 12

    /**
     * @type {Integer (Single)}
     */
    static D3D12_MAX_BORDER_COLOR_COMPONENT => 1

    /**
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
     */
    static D3D12_MIN_BORDER_COLOR_COMPONENT => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D12_MIN_DEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_MIN_MAXANISOTROPY => 0

    /**
     * @type {Integer (Single)}
     */
    static D3D12_MIP_LOD_BIAS_MAX => 15.99

    /**
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
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
    static D3D12_PREVIEW_SDK_VERSION => 714

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
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
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
     * @type {Integer (Single)}
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
    static D3D12_SDK_VERSION => 614

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
     * @type {Integer (Double)}
     */
    static D3D12_SPEC_VERSION => 1.16

    /**
     * @type {Integer (Single)}
     */
    static D3D12_SRGB_GAMMA => 2.2

    /**
     * @type {Integer (Single)}
     */
    static D3D12_SRGB_TO_FLOAT_DENOMINATOR_1 => 12.92

    /**
     * @type {Integer (Single)}
     */
    static D3D12_SRGB_TO_FLOAT_DENOMINATOR_2 => 1.055

    /**
     * @type {Integer (Single)}
     */
    static D3D12_SRGB_TO_FLOAT_EXPONENT => 2.4

    /**
     * @type {Integer (Single)}
     */
    static D3D12_SRGB_TO_FLOAT_OFFSET => 0.055

    /**
     * @type {Integer (Single)}
     */
    static D3D12_SRGB_TO_FLOAT_THRESHOLD => 0.04045

    /**
     * @type {Integer (Single)}
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
     * @type {Integer (UInt32)}
     */
    static LUID_DEFINED => 1

    /**
     * @type {String}
     */
    static D3D12_PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED => "{62b0084e-c70e-4daa-a109-30ff8d5a0482}"

    /**
     * @type {String}
     */
    static CLSID_D3D12Debug => "{f2352aeb-dd84-49fe-b97b-a9dcfdcc1b4f}"

    /**
     * @type {String}
     */
    static CLSID_D3D12Tools => "{e38216b1-3c8c-4833-aa09-0a06b65d96c8}"

    /**
     * @type {String}
     */
    static CLSID_D3D12DeviceRemovedExtendedData => "{4a75bbc4-9ff4-4ad8-9f18-abae84dc5ff2}"

    /**
     * @type {String}
     */
    static CLSID_D3D12SDKConfiguration => "{7cda6aca-a03e-49c8-9458-0334d20e07ce}"

    /**
     * @type {String}
     */
    static CLSID_D3D12DeviceFactory => "{114863bf-c386-4aee-b39d-8f0bbb062955}"

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADING_RATE_X_AXIS_SHIFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D12_SHADING_RATE_VALID_MASK => 3

    /**
     * @type {String}
     */
    static WKPDID_D3DAutoDebugObjectNameW => "{d4902e36-757a-4942-9594-b6769afa43cd}"

    /**
     * @type {String}
     */
    static DXGI_DEBUG_D3D12 => "{cf59a98c-a950-4326-91ef-9bbaa17bfd95}"

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
     * @type {String}
     */
    static D3D12ExperimentalShaderModels => "{76f5573e-f13a-40f5-b297-81ce9e18933f}"

    /**
     * @type {String}
     */
    static D3D12TiledResourceTier4 => "{c9c4725f-a81a-4f56-8c5b-c51039d694fb}"
;@endregion Constants

;@region Methods
    /**
     * Serializes a root signature version 1.0 that can be passed to ID3D12Device::CreateRootSignature.
     * @remarks
     * This function has been superceded by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializeversionedrootsignature">D3D12SerializeVersionedRootSignature</a> as of the Windows 10 Anniversary Update (14393).
     * 
     * If an application procedurally generates a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a> data structure, it must pass a pointer to this <b>D3D12_ROOT_SIGNATURE_DESC</b> in a call to <b>D3D12SerializeRootSignature</b> to make the serialized form.
     *         The application then passes the serialized form to which <i>ppBlob</i> points into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a>.
     *       
     * 
     * If a shader has been authored with a root signature in it, the compiled shader will contain a serialized root signature in it already. In this case, pass the compiled shader blob to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a> to obtain the runtime root signature object.
     *       
     * 
     * The function signature PFN_D3D12_SERIALIZE_ROOT_SIGNATURE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
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
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12serializerootsignature
     */
    static D3D12SerializeRootSignature(pRootSignature, Version, ppBlob, ppErrorBlob) {
        result := DllCall("d3d12.dll\D3D12SerializeRootSignature", "ptr", pRootSignature, "int", Version, "ptr", ppBlob, "ptr", ppErrorBlob, "int")
        return result
    }

    /**
     * Deserializes a root signature so you can determine the layout definition (D3D12_ROOT_SIGNATURE_DESC).
     * @remarks
     * This function has been superceded by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createversionedrootsignaturedeserializer">D3D12CreateVersionedRootSignatureDeserializer</a>.
     * 
     * If an application has a serialized root signature already or has a compiled shader that contains a root signature and wants to determine the layout definition, it can call <b>D3D12CreateRootSignatureDeserializer</b> to generate a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignaturedeserializer">ID3D12RootSignatureDeserializer</a> interface. <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12rootsignaturedeserializer-getrootsignaturedesc">ID3D12RootSignatureDeserializer::GetRootSignature</a> can return the deserialized data structure
     *         (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc">D3D12_ROOT_SIGNATURE_DESC</a>).
     *         <b>ID3D12RootSignatureDeserializer</b> just owns the lifetime of the memory for the deserialized data structure.
     *       
     * 
     * The <b>REFIID</b>, or <b>GUID</b>, of the interface to the root signature deserializer can be obtained by using the __uuidof() macro. For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12rootsignaturedeserializer">ID3D12RootSignatureDeserializer</a>) will get the <b>GUID</b> of the interface to a root signature deserializer.
     *       
     * 
     * The function signature PFN_D3D12_CREATE_ROOT_SIGNATURE_DESERIALIZER is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
     * @param {Pointer<Void>} pSrcData Type: <b>LPCVOID</b>
     * 
     * A pointer to the source data for the serialized root signature.
     * @param {Pointer} SrcDataSizeInBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Pointer<Guid>} pRootSignatureDeserializerInterface Type: <b><b>REFIID</b></b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the root signature deserializer interface. See remarks.
     * @param {Pointer<Void>} ppRootSignatureDeserializer Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the root signature deserializer.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createrootsignaturedeserializer
     */
    static D3D12CreateRootSignatureDeserializer(pSrcData, SrcDataSizeInBytes, pRootSignatureDeserializerInterface, ppRootSignatureDeserializer) {
        result := DllCall("d3d12.dll\D3D12CreateRootSignatureDeserializer", "ptr", pSrcData, "ptr", SrcDataSizeInBytes, "ptr", pRootSignatureDeserializerInterface, "ptr", ppRootSignatureDeserializer, "int")
        return result
    }

    /**
     * Serializes a root signature of any version that can be passed to ID3D12Device::CreateRootSignature.
     * @remarks
     * If an application procedurally generates a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc1">D3D12_ROOT_SIGNATURE_DESC1</a> data structure, it must pass a pointer to this <b>D3D12_ROOT_SIGNATURE_DESC1</b> in a call to <b>D3D12SerializeVersionedRootSignature</b> to make the serialized form.
     *         The application then passes the serialized form to which <i>ppBlob</i> points into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a>.
     * 
     * 
     * If a shader has been authored with a root signature in it, the compiled shader will contain a serialized root signature in it already. In this case, pass the compiled shader blob to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrootsignature">ID3D12Device::CreateRootSignature</a> to obtain the runtime root signature object.
     * 
     * > Note that for Xbox developers, use of HLSL-authored root signatures is strongly recommended.
     * 
     * 
     * The function signature PFN_D3D12_SERIALIZE_VERSIONED_ROOT_SIGNATURE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
     *       
     * 
     * This function was released with the Windows 10 Anniversary Update (14393) and supersedes <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializerootsignature">D3D12SerializeRootSignature</a>.
     * @param {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} pRootSignature Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a>*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc">D3D12_VERSIONED_ROOT_SIGNATURE_DESC</a> that contains a description of any version of a root signature.
     * @param {Pointer<ID3DBlob>} ppBlob Type: <b>ID3DBlob**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access the serialized root signature.
     * @param {Pointer<ID3DBlob>} ppErrorBlob Type: <b>ID3DBlob**</b>
     * 
     * A pointer to a memory block that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff728743(v=vs.85)">ID3DBlob</a> interface that you can use to access serializer error messages, or <b>NULL</b> if there are no errors.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12serializeversionedrootsignature
     */
    static D3D12SerializeVersionedRootSignature(pRootSignature, ppBlob, ppErrorBlob) {
        result := DllCall("d3d12.dll\D3D12SerializeVersionedRootSignature", "ptr", pRootSignature, "ptr", ppBlob, "ptr", ppErrorBlob, "int")
        return result
    }

    /**
     * Generates an interface that can return the deserialized data structure, via GetUnconvertedRootSignatureDesc.
     * @remarks
     * If an application has a serialized root signature already or has a compiled shader that contains a root signature and wants to determine the layout definition, it can call <b>D3D12CreateVersionedRootSignatureDeserializer</b> to generate a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer">ID3D12VersionedRootSignatureDeserializer</a> interface. <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getrootsignaturedescatversion">ID3D12VersionedRootSignatureDeserializer::GetRootSignatureDescAtVersion</a> can return the deserialized data structure
     *         (<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_signature_desc1">D3D12_ROOT_SIGNATURE_DESC1</a>).
     *         <b>ID3D12VersionedRootSignatureDeserializer</b> just owns the lifetime of the memory for the deserialized data structure.
     *       
     * 
     * The <b>REFIID</b>, or <b>GUID</b>, of the interface to the root signature deserializer can be obtained by using the __uuidof() macro. For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer">ID3D12VersionedRootSignatureDeserializer</a>) will get the <b>GUID</b> of the interface to a root signature deserializer.
     *       
     * 
     * The function signature PFN_D3D12_CREATE_ROOT_SIGNATURE_DESERIALIZER is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
     *       
     * 
     * This function supercedes <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createrootsignaturedeserializer">D3D12CreateRootSignatureDeserializer</a>.
     * @param {Pointer<Void>} pSrcData Type: <b>LPCVOID</b>
     * 
     * A pointer to the source data for the serialized root signature.
     * @param {Pointer} SrcDataSizeInBytes Type: <b>SIZE_T</b>
     * 
     * The size, in bytes, of the block of memory that <i>pSrcData</i> points to.
     * @param {Pointer<Guid>} pRootSignatureDeserializerInterface Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the root signature deserializer interface. See remarks.
     * @param {Pointer<Void>} ppRootSignatureDeserializer Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the root signature deserializer.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns <b>S_OK</b> if successful; otherwise, returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createversionedrootsignaturedeserializer
     */
    static D3D12CreateVersionedRootSignatureDeserializer(pSrcData, SrcDataSizeInBytes, pRootSignatureDeserializerInterface, ppRootSignatureDeserializer) {
        result := DllCall("d3d12.dll\D3D12CreateVersionedRootSignatureDeserializer", "ptr", pSrcData, "ptr", SrcDataSizeInBytes, "ptr", pRootSignatureDeserializerInterface, "ptr", ppRootSignatureDeserializer, "int")
        return result
    }

    /**
     * Creates a device that represents the display adapter. (D3D12CreateDevice)
     * @remarks
     * Direct3D 12 devices are singletons per adapter. If a Direct3D 12 device already exists in the current process for a given adapter, then a subsequent call to **D3D12CreateDevice** returns the existing device. If the current Direct3D 12 device is in a removed state (that is, [ID3D12Device::GetDeviceRemovedReason](nf-d3d12-id3d12device-getdeviceremovedreason.md) returns a failing HRESULT), then **D3D12CreateDevice** fails instead of returning the existing device. The sameness of two adapters (that is, they have the same identity) is determined by comparing their LUIDs, not their pointers.
     * 
     * In order to be sure to pick up the first adapter that supports D3D12, use the following code. 
     * 
     * 
     * ``` syntax
     * void GetHardwareAdapter(IDXGIFactory4* pFactory, IDXGIAdapter1** ppAdapter)
     * {
     *     *ppAdapter = nullptr;
     *     for (UINT adapterIndex = 0; ; ++adapterIndex)
     *     {
     *         IDXGIAdapter1* pAdapter = nullptr;
     *         if (DXGI_ERROR_NOT_FOUND == pFactory->EnumAdapters1(adapterIndex, &pAdapter))
     *         {
     *             // No more adapters to enumerate.
     *             break;
     *         } 
     * 
     *         // Check to see if the adapter supports Direct3D 12, but don't create the
     *         // actual device yet.
     *         if (SUCCEEDED(D3D12CreateDevice(pAdapter, D3D_FEATURE_LEVEL_11_0, _uuidof(ID3D12Device), nullptr)))
     *         {
     *             *ppAdapter = pAdapter;
     *             return;
     *         }
     *         pAdapter->Release();
     *     }
     * }
     * 
     * ```
     * 
     * The function signature PFN_D3D12_CREATE_DEVICE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
     *       
     * 
     * The <b>REFIID</b>, or <b>GUID</b>, of the interface to a device can be obtained by using the<c> __uuidof()</c> macro.
     *         For example, <c>__uuidof</c>(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12device">ID3D12Device</a>) will get the <b>GUID</b> of the interface to a device.
     * @param {Pointer<IUnknown>} pAdapter Type: <b>IUnknown*</b>
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
     * @param {Pointer<Void>} ppDevice Type: <b><b>void</b>**</b>
     * 
     * A pointer to a memory block that receives a pointer to the device. Pass **NULL** to test if device creation would succeed, but to not actually create the device. If **NULL** is passed and device creation would succeed, **S_FALSE** is returned.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method can return one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     *           
     * 
     * Possible return values include those documented for <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-createdxgifactory1">CreateDXGIFactory1</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgifactory-enumadapters">IDXGIFactory::EnumAdapters</a>.
     *           
     * If **ppDevice** is **NULL** and the function succeeds, **S_FALSE** is returned, rather than **S_OK**.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createdevice
     */
    static D3D12CreateDevice(pAdapter, MinimumFeatureLevel, riid, ppDevice) {
        result := DllCall("d3d12.dll\D3D12CreateDevice", "ptr", pAdapter, "int", MinimumFeatureLevel, "ptr", riid, "ptr", ppDevice, "int")
        return result
    }

    /**
     * Gets a debug interface.
     * @remarks
     * The function signature PFN_D3D12_GET_DEBUG_INTERFACE is provided as a typedef, so that you can use dynamic linking techniques (<a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>) instead of statically linking.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The globally unique identifier (<b>GUID</b>) for the debug interface.
     *             The <b>REFIID</b>, or <b>GUID</b>, of the debug interface can be obtained by using the __uuidof() macro.
     *             For example, __uuidof(<a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug">ID3D12Debug</a>) will get the <b>GUID</b> of the debug interface.
     * @param {Pointer<Void>} ppvDebug Type: <b>void**</b>
     * 
     * The debug interface, as a pointer to pointer to void.
     *             See
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug">ID3D12Debug</a> and
     *             <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice">ID3D12DebugDevice</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12getdebuginterface
     */
    static D3D12GetDebugInterface(riid, ppvDebug) {
        result := DllCall("d3d12.dll\D3D12GetDebugInterface", "ptr", riid, "ptr", ppvDebug, "int")
        return result
    }

    /**
     * Enables a list of experimental features.
     * @remarks
     * Call this function before device creation.
     * 
     * Because the set of experimental features will change over time, and because these features may not be stable, they are intended for development and experimentation only. This is enforced by requiring Developer Mode to be active before any experimental features can be enabled.
     * 
     * The set of experimental features that are currently supported can be found in the D3D12.h header, near the definition of the D3D12EnableExperimentalFeatures function; because experimental features are only made available infrequently, its typical to find that no experimental features are currently supported.
     * 
     * Some experimental features might be identified by using an IID as the GUID. For these features, you can use D3D12GetDebugInterface, passing an IID as a parameter, to retrieve the interface for manipulating that feature.
     * 
     * If this function is called again with a different list of features to enable, all current D3D12 devices are set to the DEVICE_REMOVED state.
     * @param {Integer} NumFeatures Type: <b>UINT</b>
     * 
     * The number of experimental features to enable.
     * @param {Pointer<Guid>} pIIDs Type: <b>const IID*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>__in_ecount(NumFeatures)</c>
     * 
     * A pointer to an array of IDs that specify which of the available experimental features to enable.
     * @param {Pointer<Void>} pConfigurationStructs Type: <b>void*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>__in_ecount(NumFeatures)</c>
     * 
     * Structures that contain additional configuration details that some experimental features might need to be enabled.
     * @param {Pointer<UInt32>} pConfigurationStructSizes Type: <b>UINT*</b>
     * 
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-function-parameters-and-return-values?view=vs-2015&preserve-view=true">SAL</a>: <c>__in_ecount(NumFeatures)</c>
     * 
     * The sizes of any configuration structs passed in pConfigurationStructs parameter.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code that can include E_NOINTERFACE if an unrecognized feature is specified or Developer Mode is not enabled, or E_INVALIDARG if the configuration of a feature is in correct, the experimental features specified are not compatible, or other errors.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12enableexperimentalfeatures
     */
    static D3D12EnableExperimentalFeatures(NumFeatures, pIIDs, pConfigurationStructs, pConfigurationStructSizes) {
        result := DllCall("d3d12.dll\D3D12EnableExperimentalFeatures", "uint", NumFeatures, "ptr", pIIDs, "ptr", pConfigurationStructs, "ptr", pConfigurationStructSizes, "int")
        return result
    }

    /**
     * Selects an SDK version at runtime when the system is in Windows Developer Mode.
     * @param {Pointer<Guid>} rclsid Type: \_In\_ **[REFCLSID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
     * 
     * The CLSID associated with the data and code that will be used to create the object.
     * 
     * The following CLSIDs are defined.
     * 
     * * DEFINE_GUID(CLSID_D3D12Debug,                        0xf2352aeb, 0xdd84, 0x49fe, 0xb9, 0x7b, 0xa9, 0xdc, 0xfd, 0xcc, 0x1b, 0x4f);
     * * DEFINE_GUID(CLSID_D3D12Tools,                        0xe38216b1, 0x3c8c, 0x4833, 0xaa, 0x09, 0x0a, 0x06, 0xb6, 0x5d, 0x96, 0xc8);
     * * DEFINE_GUID(CLSID_D3D12DeviceRemovedExtendedData,    0x4a75bbc4, 0x9ff4, 0x4ad8, 0x9f, 0x18, 0xab, 0xae, 0x84, 0xdc, 0x5f, 0xf2);
     * * DEFINE_GUID(CLSID_D3D12SDKConfiguration,             0x7cda6aca, 0xa03e, 0x49c8, 0x94, 0x58, 0x03, 0x34, 0xd2, 0x0e, 0x07, 0xce);
     * 
     * They correspond, respectively, to the following interfaces.
     * 
     * * [ID3D12Debug interface](/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug)
     * * [ID3D12Tools interface](/windows/win32/api/d3d12/nn-d3d12-id3d12tools)
     * * [ID3D12DeviceRemovedExtendedDataSettings interface](/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddatasettings)
     * * [ID3D12SDKConfiguration interface](nn-d3d12-id3d12sdkconfiguration.md)
     * @param {Pointer<Guid>} riid Type: \_In\_ **[REFIID](/openspecs/windows_protocols/ms-oaut/bbde795f-5398-42d8-9f59-3613da03c318)**
     * 
     * The globally unique identifier (**GUID**) for the SDK configuration interface. The **REFIID**, or **GUID**, of the interface can be obtained by using the `__uuidof` macro. For example, `__uuidof(ID3D12SDKConfiguration)` will retrieve the **GUID** of the debug interface.
     * @param {Pointer<Void>} ppvDebug Type: \_COM\_Outptr\_opt\_ **[void](/windows/win32/winprog/windows-data-types)\*\***
     * 
     * The `out` parameter that contains the requested interface on return (for example, the SDK configuration interface), as a pointer to pointer to void. See [ID3D12SDKConfiguration](nn-d3d12-id3d12sdkconfiguration.md).
     * @returns {Integer} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If the function succeeds, then it returns **S_OK**. Otherwise, it returns one of the [Direct3D 12 return codes](/windows/win32/direct3d12/d3d12-graphics-reference-returnvalues).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12getinterface
     */
    static D3D12GetInterface(rclsid, riid, ppvDebug) {
        result := DllCall("d3d12.dll\D3D12GetInterface", "ptr", rclsid, "ptr", riid, "ptr", ppvDebug, "int")
        return result
    }

;@endregion Methods
}

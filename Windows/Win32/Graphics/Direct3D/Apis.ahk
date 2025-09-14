#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class Direct3D {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_REQ_TEXTURE1D_U_DIMENSION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_3_REQ_TEXTURE1D_U_DIMENSION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_REQ_TEXTURE2D_U_OR_V_DIMENSION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_3_REQ_TEXTURE2D_U_OR_V_DIMENSION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_REQ_TEXTURECUBE_DIMENSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_3_REQ_TEXTURECUBE_DIMENSION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_REQ_TEXTURE3D_U_V_OR_W_DIMENSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_DEFAULT_MAX_ANISOTROPY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_IA_PRIMITIVE_MAX_COUNT => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_2_IA_PRIMITIVE_MAX_COUNT => 1048575

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_SIMULTANEOUS_RENDER_TARGET_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_3_SIMULTANEOUS_RENDER_TARGET_COUNT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_1_MAX_TEXTURE_REPEAT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_2_MAX_TEXTURE_REPEAT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_FL9_3_MAX_TEXTURE_REPEAT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_DOUBLES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_COMPUTE_SHADERS_PLUS_RAW_AND_STRUCTURED_BUFFERS_VIA_SHADER_4_X => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_UAVS_AT_EVERY_STAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_64_UAVS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_MINIMUM_PRECISION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_11_1_DOUBLE_EXTENSIONS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_11_1_SHADER_EXTENSIONS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_LEVEL_9_COMPARISON_FILTERING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_TILED_RESOURCES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_STENCIL_REF => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_INNER_COVERAGE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_TYPED_UAV_LOAD_ADDITIONAL_FORMATS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_ROVS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_VIEWPORT_AND_RT_ARRAY_INDEX_FROM_ANY_SHADER_FEEDING_RASTERIZER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_WAVE_OPS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_INT64_OPS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_VIEW_ID => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_BARYCENTRICS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_NATIVE_16BIT_OPS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_SHADING_RATE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_RAYTRACING_TIER_1_1 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_SAMPLER_FEEDBACK => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_ATOMIC_INT64_ON_TYPED_RESOURCE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_ATOMIC_INT64_ON_GROUP_SHARED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_DERIVATIVES_IN_MESH_AND_AMPLIFICATION_SHADERS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_RESOURCE_DESCRIPTOR_HEAP_INDEXING => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_SAMPLER_DESCRIPTOR_HEAP_INDEXING => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_WAVE_MMA => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_ATOMIC_INT64_ON_DESCRIPTOR_HEAP_RESOURCE => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_ADVANCED_TEXTURE_OPS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_WRITEABLE_MSAA_TEXTURES => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SHADER_FEATURE_SAMPLE_CMP_GRADIENT_OR_BIAS => 2147483648

    /**
     * @type {String}
     */
    static WKPDID_D3DDebugObjectName => "{429b8c22-9188-4b0c-8742-acb0bf85c200}"

    /**
     * @type {String}
     */
    static WKPDID_D3DDebugObjectNameW => "{4cca5fd8-921f-42c8-8566-70caf2a9b741}"

    /**
     * @type {String}
     */
    static WKPDID_CommentStringW => "{d0149dc0-90e8-4ec8-8144-e900ad266bb2}"

    /**
     * @type {String}
     */
    static WKPDID_D3D12UniqueObjectId => "{1b39de15-ec04-4bae-ba4d-8cef79fc04c1}"

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_COMPONENT_MASK_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_COMPONENT_MASK_Y => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_COMPONENT_MASK_Z => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_COMPONENT_MASK_W => 8

    /**
     * @type {String}
     */
    static D3D_TEXTURE_LAYOUT_ROW_MAJOR => "{b5dc234f-72bb-4bec-9705-8cf258df6b6c}"

    /**
     * @type {String}
     */
    static D3D_TEXTURE_LAYOUT_64KB_STANDARD_SWIZZLE => "{4c0f29e3-3f5f-4d35-84c9-bc0983b62c28}"
;@endregion Constants

;@region Methods
;@endregion Methods
}

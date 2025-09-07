#Requires AutoHotkey v2.0.0 64-bit

/**
 * Direct3D 11 feature options.
 * @remarks
 * This enumeration is used when querying a driver about support for these features by calling <a href="https://docs.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a>. Each value in this enumeration has a corresponding data structure that is required to be passed to the <i>pFeatureSupportData</i> parameter of <b>ID3D11Device::CheckFeatureSupport</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_feature
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE{

    /**
     * The driver supports <a href="https://docs.microsoft.com/windows/win32/direct3d11/overviews-direct3d-11-render-multi-thread-intro">multithreading</a>. To see an example of testing a driver for multithread support, see <a href="https://docs.microsoft.com/windows/win32/direct3d11/overviews-direct3d-11-render-multi-thread-support">How To: Check for Driver Support</a>. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_threading">D3D11_FEATURE_DATA_THREADING</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_THREADING => 0

    /**
     * Supports the use of the double-precision shaders in HLSL. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_doubles">D3D11_FEATURE_DATA_DOUBLES</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_DOUBLES => 1

    /**
     * Supports the formats in <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_format_support">D3D11_FORMAT_SUPPORT</a>. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_format_support">D3D11_FEATURE_DATA_FORMAT_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_FORMAT_SUPPORT => 2

    /**
     * Supports the formats in <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_format_support2">D3D11_FORMAT_SUPPORT2</a>. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_format_support2">D3D11_FEATURE_DATA_FORMAT_SUPPORT2</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_FORMAT_SUPPORT2 => 3

    /**
     * Supports compute shaders and raw and structured buffers. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d10_x_hardware_options">D3D11_FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D10_X_HARDWARE_OPTIONS => 4

    /**
     * Supports Direct3D 11.1 feature options. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options">D3D11_FEATURE_DATA_D3D11_OPTIONS</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D11_OPTIONS => 5

    /**
     * Supports specific adapter architecture. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_architecture_info">D3D11_FEATURE_DATA_ARCHITECTURE_INFO</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_ARCHITECTURE_INFO => 6

    /**
     * Supports Direct3D 9 feature options. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_options">D3D11_FEATURE_DATA_D3D9_OPTIONS</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D9_OPTIONS => 7

    /**
     * Supports minimum precision of shaders. For more info about HLSL minimum precision, see <a href="https://docs.microsoft.com/windows/win32/direct3d11/direct3d-11-1-features">using HLSL minimum precision</a>. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_shader_min_precision_support">D3D11_FEATURE_DATA_SHADER_MIN_PRECISION_SUPPORT</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_SHADER_MIN_PRECISION_SUPPORT => 8

    /**
     * Supports Direct3D 9 shadowing feature. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_shadow_support">D3D11_FEATURE_DATA_D3D9_SHADOW_SUPPORT</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D9_SHADOW_SUPPORT => 9

    /**
     * Supports Direct3D 11.2 feature options. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1">D3D11_FEATURE_DATA_D3D11_OPTIONS1</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D11_OPTIONS1 => 10

    /**
     * Supports Direct3D 11.2 instancing options. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_simple_instancing_support">D3D11_FEATURE_DATA_D3D9_SIMPLE_INSTANCING_SUPPORT</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D9_SIMPLE_INSTANCING_SUPPORT => 11

    /**
     * Supports Direct3D 11.2 marker options. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_marker_support">D3D11_FEATURE_DATA_MARKER_SUPPORT</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_MARKER_SUPPORT => 12

    /**
     * Supports Direct3D 9 feature options, which includes the Direct3D 9 shadowing feature and instancing support. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_options1">D3D11_FEATURE_DATA_D3D9_OPTIONS1</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D9_OPTIONS1 => 13

    /**
     * Supports Direct3D 11.3 conservative rasterization feature options. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options2">D3D11_FEATURE_DATA_D3D11_OPTIONS2</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.3.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D11_OPTIONS2 => 14

    /**
     * Supports Direct3D 11.4 conservative rasterization feature options. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options3">D3D11_FEATURE_DATA_D3D11_OPTIONS3</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.4.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D11_OPTIONS3 => 15

    /**
     * Supports GPU virtual addresses. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_gpu_virtual_address_support">D3D11_FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_GPU_VIRTUAL_ADDRESS_SUPPORT => 16

    /**
     * Supports a single boolean for NV12 shared textures. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11_4/ns-d3d11_4-d3d11_feature_data_d3d11_options4">D3D11_FEATURE_DATA_D3D11_OPTIONS4</a>.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.4.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D11_OPTIONS4 => 17

    /**
     * Supports shader cache, described in <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_shader_cache">D3D11_FEATURE_DATA_SHADER_CACHE</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_SHADER_CACHE => 18

    /**
     * Supports a <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shared_resource_tier">D3D11_SHARED_RESOURCE_TIER</a> to indicate the level of support for shared resources in the current graphics driver. Refer to <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options5">D3D11_FEATURE_DATA_D3D11_OPTIONS5</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_D3D11_OPTIONS5 => 19

    /**
     * Supports displayable surfaces, described in [D3D11_FEATURE_DATA_DISPLAYABLE](/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_displayable).
     * @type {Integer (Int32)}
     */
    static D3D11_FEATURE_DISPLAYABLE => 20
}

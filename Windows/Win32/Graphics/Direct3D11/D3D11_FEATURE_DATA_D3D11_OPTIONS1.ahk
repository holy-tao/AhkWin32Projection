#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes Direct3D 11.2 feature options in the current graphics driver.
 * @remarks
 * 
 * If the Direct3D API is the Direct3D 11.2 runtime and can support 11.2 features, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkfeaturesupport">ID3D11Device::CheckFeatureSupport</a> for <b>D3D11_FEATURE_D3D11_OPTIONS1</b> will return a SUCCESS code when valid parameters are passed. The members of <b>D3D11_FEATURE_DATA_D3D11_OPTIONS1</b> will be set appropriately based on the system's graphics hardware and graphics driver.
 * 
 * <h3><a id="Mappable_default_buffers"></a><a id="mappable_default_buffers"></a><a id="MAPPABLE_DEFAULT_BUFFERS"></a>Mappable default buffers</h3>
 * When creating a default buffer with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_cpu_access_flag">D3D11_CPU_ACCESS_FLAG</a>, only the <b>D3D11_BIND_SHADER_RESOURCE</b> and <b>D3D11_BIND_UNORDERED_ACCESS</b> <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">bind flags</a> may be used.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_FLAG</a> cannot be used when creating resources with <b>D3D11_CPU_ACCESS</b> flags.
 * 
 * On non-unified memory architecture systems (discrete GPUs), apps should not use mappable default buffers if the compute shader code accesses the same byte in a default buffer more than once - sending the data across the bus multiple times eliminates the performance gained by mapping the default buffer instead of copying it.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FEATURE_DATA_D3D11_OPTIONS1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_tiled_resources_tier">D3D11_TILED_RESOURCES_TIER</a></b>
     * 
     * Specifies whether the hardware and driver support tiled resources. The runtime sets this member to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_tiled_resources_tier">D3D11_TILED_RESOURCES_TIER</a>-typed value that indicates if the hardware and driver support tiled resources and at what tier level.
     * @type {Integer}
     */
    TiledResourcesTier {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether the hardware and driver support the filtering options (<a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_filter">D3D11_FILTER</a>) of comparing the result to the minimum or maximum value during texture sampling. The runtime sets this member to <b>TRUE</b> if the hardware and driver support these filtering options.
     * @type {BOOL}
     */
    MinMaxFiltering {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies whether the hardware and driver also support the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11devicecontext1-clearview">ID3D11DeviceContext1::ClearView</a> method on depth formats. For info about valid depth formats, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a>.
     * @type {BOOL}
     */
    ClearViewAlsoSupportsDepthOnlyFormats {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Specifies support for creating <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11buffer">ID3D11Buffer</a> resources that can be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-map">ID3D11DeviceContext::Map</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-unmap">ID3D11DeviceContext::Unmap</a> methods. This means that the <b>CPUAccessFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a> structure may be set with the desired <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_cpu_access_flag">D3D11_CPU_ACCESS_FLAG</a> elements when the <b>Usage</b> member of <b>D3D11_BUFFER_DESC</b> is set to <b>D3D11_USAGE_DEFAULT</b>. The runtime sets this member to <b>TRUE</b> if the hardware is capable of at least <b>D3D_FEATURE_LEVEL_11_0</b> and the graphics device driver supports mappable default buffers.
     * @type {BOOL}
     */
    MapOnDefaultBuffers {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}

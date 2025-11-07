#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support that the adapter provides for render passes, ray tracing, and shader-resource view tier 3 tiled resources.
 * @remarks
 * 
 * Pass <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE_D3D12_OPTIONS5</a> to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">ID3D12Device::CheckFeatureSupport</a> to retrieve a <b>D3D12_FEATURE_DATA_D3D12_OPTIONS5</b> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_d3d12_options5
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS5 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A boolean value indicating whether the options require shader-resource view tier 3 tiled resource support. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_tiled_resources_tier">D3D12_TILED_RESOURCES_TIER</a>.
     * @type {BOOL}
     */
    SRVOnlyTiledResourceTier3 {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The extent to which a device driver and/or the hardware efficiently supports render passes. See <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_tier">D3D12_RENDERPASS_TIER</a>.
     * @type {Integer}
     */
    RenderPassesTier {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    RaytracingTier {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}

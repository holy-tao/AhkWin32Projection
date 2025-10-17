#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support that the adapter provides for variable-rate shading (VRS), and indicates whether or not background processing is supported.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_d3d12_options6
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS6 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>[BOOL](/windows/desktop/winprog/windows-data-types)</b>
     * 
     * Indicates whether 2x4, 4x2, and 4x4 coarse pixel sizes are supported for single-sampled rendering; and whether coarse pixel size 2x4 is supported for 2x MSAA. `true` if those sizes are supported, otherwise `false`.
     * @type {BOOL}
     */
    AdditionalShadingRatesSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>[BOOL](/windows/desktop/winprog/windows-data-types)</b>
     * 
     * Indicates whether the per-provoking-vertex (also known as per-primitive) rate can be used with more than one viewport. If so, then, in that case, that rate can be used when `SV_ViewportIndex` is written to. `true` if that rate can be used with more than one viewport, otherwise `false`.
     * @type {BOOL}
     */
    PerPrimitiveShadingRateSupportedWithViewportIndexing {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>[D3D12_VARIABLE_SHADING_RATE_TIER](/windows/desktop/api/d3d12/ne-d3d12-d3d12_variable_shading_rate_tier)</b>
     * 
     * Indicates the shading rate tier.
     * @type {Integer}
     */
    VariableShadingRateTier {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>[UINT](/windows/desktop/winprog/windows-data-types)</b>
     * 
     * Indicates the tile size of the screen-space image as a **UINT**.
     * @type {Integer}
     */
    ShadingRateImageTileSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>[BOOL](/windows/desktop/winprog/windows-data-types)</b>
     * 
     * Indicates whether or not background processing is supported. `true` if background processing is supported, otherwise `false`. For more info, see the [Direct3D 12 background processing spec](https://microsoft.github.io/DirectX-Specs/d3d/BackgroundProcessing.html).
     * @type {BOOL}
     */
    BackgroundProcessingSupported {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}

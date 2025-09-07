#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether or not the SUM combiner can be used, and whether or not *SV_ShadingRate* can be set from a mesh shader.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options10
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS10 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not the SUM combiner can be used (this relates to [variable-rate shading](/windows/desktop/direct3d12/vrs) Tier 2). `true` if it can, otherwise `false`.
     * @type {Integer}
     */
    VariableRateShadingSumCombinerSupported {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not *SV_ShadingRate* can be set from a mesh shader (this relates to [variable-rate shading](/windows/desktop/direct3d12/vrs) Tier 2). `true` if it can, otherwise `false`.
     * @type {Integer}
     */
    MeshShaderPerPrimitiveShadingRateSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

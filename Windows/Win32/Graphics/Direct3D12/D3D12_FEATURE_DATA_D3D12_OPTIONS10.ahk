#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates whether or not the SUM combiner can be used, and whether or not *SV_ShadingRate* can be set from a mesh shader.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options10
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS10 {
    #StructPack 4

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not the SUM combiner can be used (this relates to [variable-rate shading](/windows/desktop/direct3d12/vrs) Tier 2). `true` if it can, otherwise `false`.
     */
    VariableRateShadingSumCombinerSupported : BOOL

    /**
     * Type: \_Out\_ **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * 
     * Indicates whether or not *SV_ShadingRate* can be set from a mesh shader (this relates to [variable-rate shading](/windows/desktop/direct3d12/vrs) Tier 2). `true` if it can, otherwise `false`.
     */
    MeshShaderPerPrimitiveShadingRateSupported : BOOL

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER.ahk" { D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Indicates the level of support that the adapter provides for depth-bounds tests and programmable sample positions.
 * @remarks
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-checkfeaturesupport">CheckFeatureSupport</a> to determine the level of support offered for the optional Depth-bounds test and programmable sample positions features.
 * 
 * See the enumeration constant D3D12_FEATURE_D3D12_OPTIONS2 in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options2
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS2 {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes">SAL</a>: <c>_Out_</c>
     * 
     * On return, contains true if depth-bounds tests are supported; otherwise, false.
     */
    DepthBoundsTestSupported : BOOL

    /**
     * <a href="https://docs.microsoft.com/visualstudio/code-quality/annotating-structs-and-classes">SAL</a>: <c>_Out_</c>
     * 
     * On return, contains a value that indicates the level of support offered for programmable sample positions.
     */
    ProgrammableSamplePositionsTier : D3D12_PROGRAMMABLE_SAMPLE_POSITIONS_TIER

}

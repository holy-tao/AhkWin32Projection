#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes Direct3D 11.3 feature options in the current graphics driver. (D3D11_FEATURE_DATA_D3D11_OPTIONS3)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options3
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_D3D11_OPTIONS3 {
    #StructPack 4

    /**
     * Whether to use the VP and RT array index from any shader feeding the rasterizer.
     */
    VPAndRTArrayIndexFromAnyShaderFeedingRasterizer : BOOL

}

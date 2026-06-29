#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER.ahk" { D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * This feature is currently in preview.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_displayable
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_DISPLAYABLE {
    #StructPack 4

    DisplayableTexture : BOOL

    SharedResourceCompatibilityTier : D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER

}

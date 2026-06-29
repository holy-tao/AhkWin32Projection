#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_SHARED_RESOURCE_TIER.ahk" { D3D11_SHARED_RESOURCE_TIER }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the level of displayable surfaces supported in the current graphics driver.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_displayable
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_DISPLAYABLE {
    #StructPack 4

    /**
     * Type: **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * `true` if the driver supports displayable surfaces; otherwise, `false`.
     */
    DisplayableTexture : BOOL

    /**
     * Type: **[D3D11_SHARED_RESOURCE_TIER](/windows/win32/api/d3d11/ne-d3d11-d3d11_shared_resource_tier)**
     * 
     * The level of support for shared resources in the current graphics driver.
     */
    SharedResourceTier : D3D11_SHARED_RESOURCE_TIER

}

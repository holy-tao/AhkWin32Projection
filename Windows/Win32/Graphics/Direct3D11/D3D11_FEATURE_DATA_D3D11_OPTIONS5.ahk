#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_SHARED_RESOURCE_TIER.ahk" { D3D11_SHARED_RESOURCE_TIER }

/**
 * Describes the level of support for shared resources in the current graphics driver.
 * @remarks
 * Use this structure with the **D3D11_FEATURE_D3D11_OPTIONS5** member of [D3D11_FEATURE](./ne-d3d11-d3d11_feature.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options5
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_FEATURE_DATA_D3D11_OPTIONS5 {
    #StructPack 4

    /**
     * Type: **[D3D11_SHARED_RESOURCE_TIER](./ne-d3d11-d3d11_shared_resource_tier.md)**
     * 
     * The level of support for shared resources in the current graphics driver.
     */
    SharedResourceTier : D3D11_SHARED_RESOURCE_TIER

}

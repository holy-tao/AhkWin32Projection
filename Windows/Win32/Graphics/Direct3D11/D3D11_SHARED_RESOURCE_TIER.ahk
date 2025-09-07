#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the level of support for shared resources in the current graphics driver
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shared_resource_tier
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHARED_RESOURCE_TIER{

    /**
     * Specifies the support available when [D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing](./ns-d3d11-d3d11_feature_data_d3d11_options.md) is `FALSE` (only very old drivers have this value set to `FALSE`).
 * 
 * See [Extended support for shared Texture2D resources](/windows/win32/direct3d11/direct3d-11-1-features#extended-support-for-shared-texture2d-resources).
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_0 => 0

    /**
     * Specifies the support available when [D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing](./ns-d3d11-d3d11_feature_data_d3d11_options.md) and [D3D11_FEATURE_DATA_D3D11_OPTIONS4::ExtendedNV12SharedTextureSupported](/windows/win32/api/d3d11_4/ns-d3d11_4-d3d11_feature_data_d3d11_options4) are `TRUE`.
 * 
 * You can share additional formats; see [Extended support for shared Texture2D resources](/windows/win32/direct3d11/direct3d-11-1-features#extended-support-for-shared-texture2d-resources).
 * 
 * Only formats that are still shareable when **D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing** == `FALSE` can be shared across APIs between Direct3D 11 and Direct3D 12.
 * 
 * Resource formats added by **D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing** == `TRUE` can't be shared across APIs.
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_1 => 1

    /**
     * Specifies the support available when [D3D11_FEATURE_DATA_D3D11_OPTIONS4::ExtendedNV12SharedTextureSupported](../d3d11_4/ns-d3d11_4-d3d11_feature_data_d3d11_options4.md) is `TRUE`. Also see [Extended NV12 texture support](/windows/win32/direct3d11/direct3d-11-4-features#extended-nv12-texture-support).
 * 
 * See [Extended support for shared Texture2D resources](/windows/win32/direct3d11/direct3d-11-1-features#extended-support-for-shared-texture2d-resources).
 * 
 * Sharing across APIs between Direct3D 11 and Direct3D 12 is possible for the **D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing** == `TRUE` format list.
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_2 => 2

    /**
     * Specifies that [DXGI_FORMAT_R11G11B10_FLOAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) supports NT handle sharing. Also see [CreateSharedHandle](../dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle.md).
 * 
 * Sharing across APIs between Direct3D 11 and Direct3D 12 is possible for the **DXGI_FORMAT_R11G11B10_FLOAT** format.
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_3 => 3
}

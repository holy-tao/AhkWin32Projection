#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify TBD.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_shared_resource_tier
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHARED_RESOURCE_TIER extends Win32Enum{

    /**
     * Specifies the support available when [D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing](./ns-d3d11-d3d11_feature_data_d3d11_options.md) is **FALSE**.
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_0 => 0

    /**
     * Specifies the support available when [D3D11_FEATURE_DATA_D3D11_OPTIONS::ExtendedResourceSharing](./ns-d3d11-d3d11_feature_data_d3d11_options.md) is **TRUE**.
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_1 => 1

    /**
     * Specifies the support available when [D3D11_FEATURE_DATA_D3D11_OPTIONS4::ExtendedNV12SharedTextureSupported](../d3d11_4/ns-d3d11_4-d3d11_feature_data_d3d11_options4.md) is **TRUE**. Also see [Extended NV12 texture support](/windows/win32/direct3d11/direct3d-11-4-features#extended-nv12-texture-support).
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_2 => 2

    /**
     * Specifies that [DXGI_FORMAT_R11G11B10_FLOAT](../dxgiformat/ne-dxgiformat-dxgi_format.md) supports NT handle sharing. Also see [CreateSharedHandle](../dxgi1_2/nf-dxgi1_2-idxgiresource1-createsharedhandle.md).
     * @type {Integer (Int32)}
     */
    static D3D11_SHARED_RESOURCE_TIER_3 => 3
}

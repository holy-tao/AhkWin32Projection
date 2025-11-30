#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a cross-API sharing support tier.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_shared_resource_compatibility_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER extends Win32Enum{

    /**
     * Specifies that the most basic level of cross-API sharing is supported, including the following resource data formats.
     * 
     * * DXGI_FORMAT_R8G8B8A8_UNORM
     * * DXGI_FORMAT_R8G8B8A8_UNORM_SRGB
     * * DXGI_FORMAT_B8G8R8A8_UNORM
     * * DXGI_FORMAT_B8G8R8A8_UNORM_SRGB
     * * DXGI_FORMAT_B8G8R8X8_UNORM
     * * DXGI_FORMAT_B8G8R8X8_UNORM_SRGB
     * * DXGI_FORMAT_R10G10B10A2_UNORM
     * * DXGI_FORMAT_R16G16B16A16_FLOAT
     * @type {Integer (Int32)}
     */
    static D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_0 => 0

    /**
     * Specifies that cross-API sharing functionality of Tier 0 is supported, plus the following formats.
     * 
     * * DXGI_FORMAT_R16G16B16A16_TYPELESS
     * * DXGI_FORMAT_R10G10B10A2_TYPELESS
     * * DXGI_FORMAT_R8G8B8A8_TYPELESS
     * * DXGI_FORMAT_R8G8B8X8_TYPELESS
     * * DXGI_FORMAT_R16G16_TYPELESS
     * * DXGI_FORMAT_R8G8_TYPELESS
     * * DXGI_FORMAT_R32_TYPELESS
     * * DXGI_FORMAT_R16_TYPELESS
     * * DXGI_FORMAT_R8_TYPELESS
     * 
     * This level support is built into WDDM 2.4.
     * 
     * Also see [Extended support for shared Texture2D resources](/windows/win32/direct3d11/direct3d-11-1-features#extended-support-for-shared-texture2d-resources).
     * @type {Integer (Int32)}
     */
    static D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_1 => 1

    /**
     * Specifies that cross-API sharing functionality of Tier 1 is supported, plus the following formats.
     * 
     * * DXGI_FORMAT_NV12 (also see [Extended NV12 texture support](/windows/win32/direct3d11/direct3d-11-4-features#extended-nv12-texture-support))
     * @type {Integer (Int32)}
     */
    static D3D12_SHARED_RESOURCE_COMPATIBILITY_TIER_2 => 2
}

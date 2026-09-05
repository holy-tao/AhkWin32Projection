#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of resource to view as a render target.
 * @remarks
 * Specify one of the values in this enumeration in the <b>ViewDimension</b> member of a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_view_desc">D3D12_RENDER_TARGET_VIEW_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_rtv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_RTV_DIMENSION extends Win32Enum {

    /**
     * Do not use this value, as it will cause <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrendertargetview">ID3D12Device::CreateRenderTargetView</a> to fail.
     * Native name: D3D12_RTV_DIMENSION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The resource will be accessed as a buffer.
     * Native name: D3D12_RTV_DIMENSION_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 1

    /**
     * The resource will be accessed as a 1D texture.
     * Native name: D3D12_RTV_DIMENSION_TEXTURE1D
     * @type {Integer (Int32)}
     */
    static TEXTURE1D => 2

    /**
     * The resource will be accessed as an array of 1D textures.
     * Native name: D3D12_RTV_DIMENSION_TEXTURE1DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE1DARRAY => 3

    /**
     * The resource will be accessed as a 2D texture.
     * Native name: D3D12_RTV_DIMENSION_TEXTURE2D
     * @type {Integer (Int32)}
     */
    static TEXTURE2D => 4

    /**
     * The resource will be accessed as an array of 2D textures.
     * Native name: D3D12_RTV_DIMENSION_TEXTURE2DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DARRAY => 5

    /**
     * The resource will be accessed as a 2D texture with multisampling.
     * Native name: D3D12_RTV_DIMENSION_TEXTURE2DMS
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMS => 6

    /**
     * The resource will be accessed as an array of 2D textures with multisampling.
     * Native name: D3D12_RTV_DIMENSION_TEXTURE2DMSARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMSARRAY => 7

    /**
     * The resource will be accessed as a 3D texture.
     * Native name: D3D12_RTV_DIMENSION_TEXTURE3D
     * @type {Integer (Int32)}
     */
    static TEXTURE3D => 8
}

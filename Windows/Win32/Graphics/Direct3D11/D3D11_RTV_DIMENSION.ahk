#Requires AutoHotkey v2.0.0 64-bit

/**
 * These flags identify the type of resource that will be viewed as a render target.
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_render_target_view_desc">D3D11_RENDER_TARGET_VIEW_DESC</a> to create a render-target view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_rtv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_RTV_DIMENSION{

    /**
     * Do not use this value, as it will cause <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrendertargetview">ID3D11Device::CreateRenderTargetView</a> to fail.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_UNKNOWN => 0

    /**
     * The resource will be accessed as a buffer.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_BUFFER => 1

    /**
     * The resource will be accessed as a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_TEXTURE1D => 2

    /**
     * The resource will be accessed as an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * The resource will be accessed as a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_TEXTURE2D => 4

    /**
     * The resource will be accessed as an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * The resource will be accessed as a 2D texture with multisampling.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_TEXTURE2DMS => 6

    /**
     * The resource will be accessed as an array of 2D textures with multisampling.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * The resource will be accessed as a 3D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_RTV_DIMENSION_TEXTURE3D => 8
}

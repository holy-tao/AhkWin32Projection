#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to access a resource used in a depth-stencil view. (D3D11_DSV_DIMENSION)
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a> to create a depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_dsv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_DSV_DIMENSION{

    /**
     * <i>D3D11_DSV_DIMENSION_UNKNOWN</i> is not a valid value for <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a> and is not used.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_DIMENSION_UNKNOWN => 0

    /**
     * The resource will be accessed as a 1D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_DIMENSION_TEXTURE1D => 1

    /**
     * The resource will be accessed as an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_DIMENSION_TEXTURE1DARRAY => 2

    /**
     * The resource will be accessed as a 2D texture.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_DIMENSION_TEXTURE2D => 3

    /**
     * The resource will be accessed as an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_DIMENSION_TEXTURE2DARRAY => 4

    /**
     * The resource will be accessed as a 2D texture with multisampling.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_DIMENSION_TEXTURE2DMS => 5

    /**
     * The resource will be accessed as an array of 2D textures with multisampling.
     * @type {Integer (Int32)}
     */
    static D3D11_DSV_DIMENSION_TEXTURE2DMSARRAY => 6
}

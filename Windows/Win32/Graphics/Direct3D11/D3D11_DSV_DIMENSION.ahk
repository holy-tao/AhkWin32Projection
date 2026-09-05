#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to access a resource used in a depth-stencil view. (D3D11_DSV_DIMENSION)
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a> to create a depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_dsv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_DSV_DIMENSION extends Win32Enum {

    /**
     * <i>D3D11_DSV_DIMENSION_UNKNOWN</i> is not a valid value for <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc">D3D11_DEPTH_STENCIL_VIEW_DESC</a> and is not used.
     * Native name: D3D11_DSV_DIMENSION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The resource will be accessed as a 1D texture.
     * Native name: D3D11_DSV_DIMENSION_TEXTURE1D
     * @type {Integer (Int32)}
     */
    static TEXTURE1D => 1

    /**
     * The resource will be accessed as an array of 1D textures.
     * Native name: D3D11_DSV_DIMENSION_TEXTURE1DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE1DARRAY => 2

    /**
     * The resource will be accessed as a 2D texture.
     * Native name: D3D11_DSV_DIMENSION_TEXTURE2D
     * @type {Integer (Int32)}
     */
    static TEXTURE2D => 3

    /**
     * The resource will be accessed as an array of 2D textures.
     * Native name: D3D11_DSV_DIMENSION_TEXTURE2DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DARRAY => 4

    /**
     * The resource will be accessed as a 2D texture with multisampling.
     * Native name: D3D11_DSV_DIMENSION_TEXTURE2DMS
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMS => 5

    /**
     * The resource will be accessed as an array of 2D textures with multisampling.
     * Native name: D3D11_DSV_DIMENSION_TEXTURE2DMSARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMSARRAY => 6
}

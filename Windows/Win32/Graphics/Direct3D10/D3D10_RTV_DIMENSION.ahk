#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to access a resource used in a render-target view.
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a> to create a render-target view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_rtv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_RTV_DIMENSION extends Win32Enum {

    /**
     * The resource will be accessed according to its type as determined from the actual instance this enumeration is paired with when the render-target view is created.
     * Native name: D3D10_RTV_DIMENSION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">buffer</a>.
     * Native name: D3D10_RTV_DIMENSION_BUFFER
     * @type {Integer (Int32)}
     */
    static BUFFER => 1

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">1D texture</a>.
     * Native name: D3D10_RTV_DIMENSION_TEXTURE1D
     * @type {Integer (Int32)}
     */
    static TEXTURE1D => 2

    /**
     * The resource will be accessed as an array of 1D textures.
     * Native name: D3D10_RTV_DIMENSION_TEXTURE1DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE1DARRAY => 3

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">2D texture</a>.
     * Native name: D3D10_RTV_DIMENSION_TEXTURE2D
     * @type {Integer (Int32)}
     */
    static TEXTURE2D => 4

    /**
     * The resource will be accessed as an array of 2D textures.
     * Native name: D3D10_RTV_DIMENSION_TEXTURE2DARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DARRAY => 5

    /**
     * The resource will be accessed as a 2D texture with multisampling.
     * Native name: D3D10_RTV_DIMENSION_TEXTURE2DMS
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMS => 6

    /**
     * The resource will be accessed as an array of 2D textures with multisampling.
     * Native name: D3D10_RTV_DIMENSION_TEXTURE2DMSARRAY
     * @type {Integer (Int32)}
     */
    static TEXTURE2DMSARRAY => 7

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">3D texture</a>.
     * Native name: D3D10_RTV_DIMENSION_TEXTURE3D
     * @type {Integer (Int32)}
     */
    static TEXTURE3D => 8
}

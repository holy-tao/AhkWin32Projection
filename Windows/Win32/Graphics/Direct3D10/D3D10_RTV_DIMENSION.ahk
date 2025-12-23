#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to access a resource used in a render-target view.
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_render_target_view_desc">D3D10_RENDER_TARGET_VIEW_DESC</a> to create a render-target view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_rtv_dimension
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_RTV_DIMENSION extends Win32Enum{

    /**
     * The resource will be accessed according to its type as determined from the actual instance this enumeration is paired with when the render-target view is created.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_UNKNOWN => 0

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">buffer</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_BUFFER => 1

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">1D texture</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_TEXTURE1D => 2

    /**
     * The resource will be accessed as an array of 1D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_TEXTURE1DARRAY => 3

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">2D texture</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_TEXTURE2D => 4

    /**
     * The resource will be accessed as an array of 2D textures.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_TEXTURE2DARRAY => 5

    /**
     * The resource will be accessed as a 2D texture with multisampling.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_TEXTURE2DMS => 6

    /**
     * The resource will be accessed as an array of 2D textures with multisampling.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_TEXTURE2DMSARRAY => 7

    /**
     * The resource will be accessed as a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">3D texture</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_RTV_DIMENSION_TEXTURE3D => 8
}

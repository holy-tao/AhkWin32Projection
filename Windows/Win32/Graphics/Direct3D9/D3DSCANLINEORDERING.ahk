#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags indicating the method the rasterizer uses to create an image on a surface.
 * @remarks
 * This enumeration is used as a member in [**D3DDISPLAYMODEFILTER**](d3ddisplaymodefilter.md) and [**D3DDISPLAYMODEEX**](d3ddisplaymodeex.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dscanlineordering
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSCANLINEORDERING{

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_INTERLACED => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags indicating the method the rasterizer uses to create an image on a surface.
 * @remarks
 * This enumeration is used as a member in [**D3DDISPLAYMODEFILTER**](d3ddisplaymodefilter.md) and [**D3DDISPLAYMODEEX**](d3ddisplaymodeex.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dscanlineordering
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DSCANLINEORDERING extends Win32Enum {

    /**
     * Native name: D3DSCANLINEORDERING_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: D3DSCANLINEORDERING_PROGRESSIVE
     * @type {Integer (Int32)}
     */
    static PROGRESSIVE => 1

    /**
     * Native name: D3DSCANLINEORDERING_INTERLACED
     * @type {Integer (Int32)}
     */
    static INTERLACED => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines stencil-buffer operations.
 * @remarks
 * Stencil-buffer entries are integer values ranging from 0 through 2ⁿ - 1, where n is the bit depth of the stencil buffer.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dstencilop
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DSTENCILOP extends Win32Enum {

    /**
     * Native name: D3DSTENCILOP_KEEP
     * @type {Integer (Int32)}
     */
    static KEEP => 1

    /**
     * Native name: D3DSTENCILOP_ZERO
     * @type {Integer (Int32)}
     */
    static ZERO => 2

    /**
     * Native name: D3DSTENCILOP_REPLACE
     * @type {Integer (Int32)}
     */
    static REPLACE => 3

    /**
     * Native name: D3DSTENCILOP_INCRSAT
     * @type {Integer (Int32)}
     */
    static INCRSAT => 4

    /**
     * Native name: D3DSTENCILOP_DECRSAT
     * @type {Integer (Int32)}
     */
    static DECRSAT => 5

    /**
     * Native name: D3DSTENCILOP_INVERT
     * @type {Integer (Int32)}
     */
    static INVERT => 6

    /**
     * Native name: D3DSTENCILOP_INCR
     * @type {Integer (Int32)}
     */
    static INCR => 7

    /**
     * Native name: D3DSTENCILOP_DECR
     * @type {Integer (Int32)}
     */
    static DECR => 8
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_COLOR_BASIS extends Win32Enum {

    /**
     * Native name: D3DKMDT_CB_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static CB_UNINITIALIZED => 0

    /**
     * Native name: D3DKMDT_CB_INTENSITY
     * @type {Integer (Int32)}
     */
    static CB_INTENSITY => 1

    /**
     * Native name: D3DKMDT_CB_SRGB
     * @type {Integer (Int32)}
     */
    static CB_SRGB => 2

    /**
     * Native name: D3DKMDT_CB_SCRGB
     * @type {Integer (Int32)}
     */
    static CB_SCRGB => 3

    /**
     * Native name: D3DKMDT_CB_YCBCR
     * @type {Integer (Int32)}
     */
    static CB_YCBCR => 4

    /**
     * Native name: D3DKMDT_CB_YPBPR
     * @type {Integer (Int32)}
     */
    static CB_YPBPR => 5
}

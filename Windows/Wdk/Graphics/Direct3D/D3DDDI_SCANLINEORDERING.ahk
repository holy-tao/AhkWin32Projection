#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_SCANLINEORDERING extends Win32Enum {

    /**
     * Native name: D3DDDI_SCANLINEORDERING_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: D3DDDI_SCANLINEORDERING_PROGRESSIVE
     * @type {Integer (Int32)}
     */
    static PROGRESSIVE => 1

    /**
     * Native name: D3DDDI_SCANLINEORDERING_INTERLACED
     * @type {Integer (Int32)}
     */
    static INTERLACED => 2
}

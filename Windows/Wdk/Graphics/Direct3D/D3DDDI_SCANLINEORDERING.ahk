#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_SCANLINEORDERING extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_SCANLINEORDERING_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_SCANLINEORDERING_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_SCANLINEORDERING_INTERLACED => 2
}

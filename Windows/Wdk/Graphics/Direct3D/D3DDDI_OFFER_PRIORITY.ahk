#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_OFFER_PRIORITY extends Win32Enum {

    /**
     * Native name: D3DDDI_OFFER_PRIORITY_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3DDDI_OFFER_PRIORITY_LOW
     * @type {Integer (Int32)}
     */
    static LOW => 1

    /**
     * Native name: D3DDDI_OFFER_PRIORITY_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 2

    /**
     * Native name: D3DDDI_OFFER_PRIORITY_HIGH
     * @type {Integer (Int32)}
     */
    static HIGH => 3

    /**
     * Native name: D3DDDI_OFFER_PRIORITY_AUTO
     * @type {Integer (Int32)}
     */
    static AUTO => 4
}

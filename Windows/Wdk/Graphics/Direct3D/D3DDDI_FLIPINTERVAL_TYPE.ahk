#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDI_FLIPINTERVAL_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDI_FLIPINTERVAL_IMMEDIATE
     * @type {Integer (Int32)}
     */
    static IMMEDIATE => 0

    /**
     * Native name: D3DDDI_FLIPINTERVAL_ONE
     * @type {Integer (Int32)}
     */
    static ONE => 1

    /**
     * Native name: D3DDDI_FLIPINTERVAL_TWO
     * @type {Integer (Int32)}
     */
    static TWO => 2

    /**
     * Native name: D3DDDI_FLIPINTERVAL_THREE
     * @type {Integer (Int32)}
     */
    static THREE => 3

    /**
     * Native name: D3DDDI_FLIPINTERVAL_FOUR
     * @type {Integer (Int32)}
     */
    static FOUR => 4

    /**
     * Native name: D3DDDI_FLIPINTERVAL_IMMEDIATE_ALLOW_TEARING
     * @type {Integer (Int32)}
     */
    static IMMEDIATE_ALLOW_TEARING => 5
}

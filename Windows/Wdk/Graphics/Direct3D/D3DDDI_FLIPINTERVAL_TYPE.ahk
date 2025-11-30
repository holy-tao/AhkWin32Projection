#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDI_FLIPINTERVAL_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_IMMEDIATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_ONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_TWO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_THREE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_FOUR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_FLIPINTERVAL_IMMEDIATE_ALLOW_TEARING => 5
}

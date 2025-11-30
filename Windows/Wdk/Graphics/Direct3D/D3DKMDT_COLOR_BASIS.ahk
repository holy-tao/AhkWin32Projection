#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_COLOR_BASIS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_CB_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_CB_INTENSITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_CB_SRGB => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_CB_SCRGB => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_CB_YCBCR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_CB_YPBPR => 5
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class ItemDataPosition extends Win32Enum {

    /**
     * Native name: ItemDataPositionAfterHeader
     * @type {Integer (Int32)}
     */
    static AfterHeader => 0

    /**
     * Native name: ItemDataPositionAfterPalette
     * @type {Integer (Int32)}
     */
    static AfterPalette => 1

    /**
     * Native name: ItemDataPositionAfterBits
     * @type {Integer (Int32)}
     */
    static AfterBits => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ItemDataPosition extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ItemDataPositionAfterHeader => 0

    /**
     * @type {Integer (Int32)}
     */
    static ItemDataPositionAfterPalette => 1

    /**
     * @type {Integer (Int32)}
     */
    static ItemDataPositionAfterBits => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LIST_ITEM_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LIF_ITEMINDEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIF_STATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LIF_ITEMID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LIF_URL => 8
}

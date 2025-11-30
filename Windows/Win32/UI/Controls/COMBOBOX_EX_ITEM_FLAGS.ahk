#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class COMBOBOX_EX_ITEM_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_DI_SETITEM => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_INDENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_LPARAM => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_OVERLAY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_SELECTEDIMAGE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CBEIF_TEXT => 1
}

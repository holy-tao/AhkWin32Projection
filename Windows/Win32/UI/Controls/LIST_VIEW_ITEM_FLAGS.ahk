#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LIST_VIEW_ITEM_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_PARAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_STATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_INDENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_NORECOMPUTE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_GROUPID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_COLUMNS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_COLFMT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_DI_SETITEM => 4096
}

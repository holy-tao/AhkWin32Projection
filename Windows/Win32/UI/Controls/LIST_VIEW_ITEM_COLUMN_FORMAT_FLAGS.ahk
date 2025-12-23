#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LIST_VIEW_ITEM_COLUMN_FORMAT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_LINE_BREAK => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_FILL => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_WRAP => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_NO_TITLE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_TILE_PLACEMENTMASK => 3145728
}

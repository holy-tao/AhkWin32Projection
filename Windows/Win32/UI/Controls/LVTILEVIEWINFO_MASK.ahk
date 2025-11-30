#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVTILEVIEWINFO_MASK extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LVTVIM_TILESIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVTVIM_COLUMNS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVTVIM_LABELMARGIN => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class SMALLCLOSEBUTTONSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SCBS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCBS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCBS_PUSHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCBS_DISABLED => 4
}

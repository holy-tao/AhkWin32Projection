#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class MDIMINBUTTONSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MDMI_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDMI_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDMI_PUSHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static MDMI_DISABLED => 4
}

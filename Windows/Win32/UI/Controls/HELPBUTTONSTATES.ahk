#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class HELPBUTTONSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HBS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HBS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HBS_PUSHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static HBS_DISABLED => 4
}

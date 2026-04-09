#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class CPVIEW extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CPVIEW_CLASSIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static CPVIEW_ALLITEMS => 0

    /**
     * @type {Integer (Int32)}
     */
    static CPVIEW_CATEGORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static CPVIEW_HOME => 1
}

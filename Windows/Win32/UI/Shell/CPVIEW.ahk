#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class CPVIEW extends Win32Enum {

    /**
     * Native name: CPVIEW_CLASSIC
     * @type {Integer (Int32)}
     */
    static CLASSIC => 0

    /**
     * Native name: CPVIEW_ALLITEMS
     * @type {Integer (Int32)}
     */
    static ALLITEMS => 0

    /**
     * Native name: CPVIEW_CATEGORY
     * @type {Integer (Int32)}
     */
    static CATEGORY => 1

    /**
     * Native name: CPVIEW_HOME
     * @type {Integer (Int32)}
     */
    static HOME => 1
}

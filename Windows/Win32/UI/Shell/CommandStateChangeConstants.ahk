#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CommandStateChangeConstants extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CSC_UPDATECOMMANDS => -1

    /**
     * @type {Integer (Int32)}
     */
    static CSC_NAVIGATEFORWARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static CSC_NAVIGATEBACK => 2
}

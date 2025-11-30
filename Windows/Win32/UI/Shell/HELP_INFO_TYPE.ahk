#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class HELP_INFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HELPINFO_WINDOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static HELPINFO_MENUITEM => 2
}

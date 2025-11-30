#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SMINFOMASK extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SMIM_TYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SMIM_FLAGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SMIM_ICON => 4
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SFVS_SELECT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SFVS_SELECT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SFVS_SELECT_ALLITEMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SFVS_SELECT_INVERT => 2
}

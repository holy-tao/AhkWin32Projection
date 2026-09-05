#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class _NMCII_FLAGS extends Win32Enum {

    /**
     * Native name: NMCII_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: NMCII_ITEMS
     * @type {Integer (Int32)}
     */
    static ITEMS => 1

    /**
     * Native name: NMCII_FOLDERS
     * @type {Integer (Int32)}
     */
    static FOLDERS => 2
}

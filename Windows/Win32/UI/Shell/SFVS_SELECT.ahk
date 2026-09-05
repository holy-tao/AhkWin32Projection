#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SFVS_SELECT extends Win32Enum {

    /**
     * Native name: SFVS_SELECT_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SFVS_SELECT_ALLITEMS
     * @type {Integer (Int32)}
     */
    static ALLITEMS => 1

    /**
     * Native name: SFVS_SELECT_INVERT
     * @type {Integer (Int32)}
     */
    static INVERT => 2
}

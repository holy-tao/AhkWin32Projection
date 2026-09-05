#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class ASSOC_FILTER extends Win32BitflagEnum {

    /**
     * Native name: ASSOC_FILTER_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: ASSOC_FILTER_RECOMMENDED
     * @type {Integer (Int32)}
     */
    static RECOMMENDED => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SIATTRIBFLAGS extends Win32BitflagEnum {

    /**
     * Native name: SIATTRIBFLAGS_AND
     * @type {Integer (Int32)}
     */
    static AND => 1

    /**
     * Native name: SIATTRIBFLAGS_OR
     * @type {Integer (Int32)}
     */
    static OR => 2

    /**
     * Native name: SIATTRIBFLAGS_APPCOMPAT
     * @type {Integer (Int32)}
     */
    static APPCOMPAT => 3

    /**
     * Native name: SIATTRIBFLAGS_MASK
     * @type {Integer (Int32)}
     */
    static MASK => 3

    /**
     * Native name: SIATTRIBFLAGS_ALLITEMS
     * @type {Integer (Int32)}
     */
    static ALLITEMS => 16384
}

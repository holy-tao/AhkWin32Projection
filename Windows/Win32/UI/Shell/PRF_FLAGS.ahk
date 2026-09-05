#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class PRF_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: PRF_VERIFYEXISTS
     * @type {Integer (Int32)}
     */
    static VERIFYEXISTS => 1

    /**
     * Native name: PRF_TRYPROGRAMEXTENSIONS
     * @type {Integer (Int32)}
     */
    static TRYPROGRAMEXTENSIONS => 3

    /**
     * Native name: PRF_FIRSTDIRDEF
     * @type {Integer (Int32)}
     */
    static FIRSTDIRDEF => 4

    /**
     * Native name: PRF_DONTFINDLNK
     * @type {Integer (Int32)}
     */
    static DONTFINDLNK => 8

    /**
     * Native name: PRF_REQUIREABSOLUTE
     * @type {Integer (Int32)}
     */
    static REQUIREABSOLUTE => 16
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class DUMPTYPE extends Win32Enum {

    /**
     * Native name: DUMPTYPE_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 0

    /**
     * Native name: DUMPTYPE_MINI
     * @type {Integer (Int32)}
     */
    static MINI => 1

    /**
     * Native name: DUMPTYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2
}

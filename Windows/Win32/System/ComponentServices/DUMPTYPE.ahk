#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class DUMPTYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DUMPTYPE_FULL => 0

    /**
     * @type {Integer (Int32)}
     */
    static DUMPTYPE_MINI => 1

    /**
     * @type {Integer (Int32)}
     */
    static DUMPTYPE_NONE => 2
}

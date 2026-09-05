#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UBidiPairedBracketType extends Win32Enum {

    /**
     * Native name: U_BPT_NONE
     * @type {Integer (Int32)}
     */
    static BPT_NONE => 0

    /**
     * Native name: U_BPT_OPEN
     * @type {Integer (Int32)}
     */
    static BPT_OPEN => 1

    /**
     * Native name: U_BPT_CLOSE
     * @type {Integer (Int32)}
     */
    static BPT_CLOSE => 2
}

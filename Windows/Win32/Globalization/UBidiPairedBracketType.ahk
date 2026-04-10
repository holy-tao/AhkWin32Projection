#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UBidiPairedBracketType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static U_BPT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_BPT_OPEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_BPT_CLOSE => 2
}

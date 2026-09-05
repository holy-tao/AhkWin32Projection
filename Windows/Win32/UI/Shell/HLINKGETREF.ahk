#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLINKGETREF extends Win32Enum {

    /**
     * Native name: HLINKGETREF_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: HLINKGETREF_ABSOLUTE
     * @type {Integer (Int32)}
     */
    static ABSOLUTE => 1

    /**
     * Native name: HLINKGETREF_RELATIVE
     * @type {Integer (Int32)}
     */
    static RELATIVE => 2
}

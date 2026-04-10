#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLINKGETREF extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HLINKGETREF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HLINKGETREF_ABSOLUTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HLINKGETREF_RELATIVE => 2
}

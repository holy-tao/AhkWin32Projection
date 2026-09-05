#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class EXpsFontOptions extends Win32Enum {

    /**
     * Native name: Font_Normal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: Font_Obfusticate
     * @type {Integer (Int32)}
     */
    static Obfusticate => 1
}

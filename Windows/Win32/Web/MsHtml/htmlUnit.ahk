#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlUnit extends Win32Enum {

    /**
     * Native name: htmlUnitCharacter
     * @type {Integer (Int32)}
     */
    static Character => 1

    /**
     * Native name: htmlUnitWord
     * @type {Integer (Int32)}
     */
    static Word => 2

    /**
     * Native name: htmlUnitSentence
     * @type {Integer (Int32)}
     */
    static Sentence => 3

    /**
     * Native name: htmlUnitTextEdit
     * @type {Integer (Int32)}
     */
    static TextEdit => 6

    /**
     * Native name: htmlUnit_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlUnit extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnitCharacter => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnitWord => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnitSentence => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnitTextEdit => 6

    /**
     * @type {Integer (Int32)}
     */
    static htmlUnit_Max => 2147483647
}

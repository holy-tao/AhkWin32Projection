#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemcimtypeenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemCimtypeEnum extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint8 => 16

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint8 => 17

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint16 => 18

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint32 => 3

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint32 => 19

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint64 => 20

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint64 => 21

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeReal32 => 4

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeReal64 => 5

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeBoolean => 11

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeString => 8

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeDatetime => 101

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeReference => 102

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeChar16 => 103

    /**
     * @type {Integer (Int32)}
     */
    static wbemCimtypeObject => 13
}

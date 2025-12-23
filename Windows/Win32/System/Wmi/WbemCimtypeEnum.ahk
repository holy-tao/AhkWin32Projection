#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Define the valid CIM types of a property value.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemcimtypeenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemCimtypeEnum extends Win32Enum{

    /**
     * Signed 8-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint8 => 16

    /**
     * Unsigned 8-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint8 => 17

    /**
     * Signed 16-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint16 => 2

    /**
     * Unsigned 16-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint16 => 18

    /**
     * Signed 32-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint32 => 3

    /**
     * Unsigned 32-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint32 => 19

    /**
     * Signed 64-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeSint64 => 20

    /**
     * Unsigned 64-bit integer
     * @type {Integer (Int32)}
     */
    static wbemCimtypeUint64 => 21

    /**
     * 32-bit real number
     * @type {Integer (Int32)}
     */
    static wbemCimtypeReal32 => 4

    /**
     * 64-bit real number
     * @type {Integer (Int32)}
     */
    static wbemCimtypeReal64 => 5

    /**
     * Boolean value
     * @type {Integer (Int32)}
     */
    static wbemCimtypeBoolean => 11

    /**
     * String
     * @type {Integer (Int32)}
     */
    static wbemCimtypeString => 8

    /**
     * Date/time value
     * @type {Integer (Int32)}
     */
    static wbemCimtypeDatetime => 101

    /**
     * Reference to a CIM object
     * @type {Integer (Int32)}
     */
    static wbemCimtypeReference => 102

    /**
     * 16-bit character
     * @type {Integer (Int32)}
     */
    static wbemCimtypeChar16 => 103

    /**
     * CIM object
     * @type {Integer (Int32)}
     */
    static wbemCimtypeObject => 13
}

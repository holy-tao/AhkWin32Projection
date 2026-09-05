#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Define the valid CIM types of a property value.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemcimtypeenum
 * @namespace Windows.Win32.System.Wmi
 */
class WbemCimtypeEnum extends Win32Enum {

    /**
     * Signed 8-bit integer
     * Native name: wbemCimtypeSint8
     * @type {Integer (Int32)}
     */
    static Sint8 => 16

    /**
     * Unsigned 8-bit integer
     * Native name: wbemCimtypeUint8
     * @type {Integer (Int32)}
     */
    static Uint8 => 17

    /**
     * Signed 16-bit integer
     * Native name: wbemCimtypeSint16
     * @type {Integer (Int32)}
     */
    static Sint16 => 2

    /**
     * Unsigned 16-bit integer
     * Native name: wbemCimtypeUint16
     * @type {Integer (Int32)}
     */
    static Uint16 => 18

    /**
     * Signed 32-bit integer
     * Native name: wbemCimtypeSint32
     * @type {Integer (Int32)}
     */
    static Sint32 => 3

    /**
     * Unsigned 32-bit integer
     * Native name: wbemCimtypeUint32
     * @type {Integer (Int32)}
     */
    static Uint32 => 19

    /**
     * Signed 64-bit integer
     * Native name: wbemCimtypeSint64
     * @type {Integer (Int32)}
     */
    static Sint64 => 20

    /**
     * Unsigned 64-bit integer
     * Native name: wbemCimtypeUint64
     * @type {Integer (Int32)}
     */
    static Uint64 => 21

    /**
     * 32-bit real number
     * Native name: wbemCimtypeReal32
     * @type {Integer (Int32)}
     */
    static Real32 => 4

    /**
     * 64-bit real number
     * Native name: wbemCimtypeReal64
     * @type {Integer (Int32)}
     */
    static Real64 => 5

    /**
     * Boolean value
     * Native name: wbemCimtypeBoolean
     * @type {Integer (Int32)}
     */
    static Boolean => 11

    /**
     * String
     * Native name: wbemCimtypeString
     * @type {Integer (Int32)}
     */
    static String => 8

    /**
     * Date/time value
     * Native name: wbemCimtypeDatetime
     * @type {Integer (Int32)}
     */
    static Datetime => 101

    /**
     * Reference to a CIM object
     * Native name: wbemCimtypeReference
     * @type {Integer (Int32)}
     */
    static Reference => 102

    /**
     * 16-bit character
     * Native name: wbemCimtypeChar16
     * @type {Integer (Int32)}
     */
    static Char16 => 103

    /**
     * CIM object
     * Native name: wbemCimtypeObject
     * @type {Integer (Int32)}
     */
    static Object => 13
}

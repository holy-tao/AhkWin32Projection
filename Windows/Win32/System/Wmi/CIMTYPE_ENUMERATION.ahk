#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values that specify different CIM data types.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-cimtype_enumeration
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class CIMTYPE_ENUMERATION{

    /**
     * An illegal value.
     * @type {Integer (Int32)}
     */
    static CIM_ILLEGAL => 4095

    /**
     * An empty (null) value.
     * @type {Integer (Int32)}
     */
    static CIM_EMPTY => 0

    /**
     * An 8-bit signed integer.
     * @type {Integer (Int32)}
     */
    static CIM_SINT8 => 16

    /**
     * An 8-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static CIM_UINT8 => 17

    /**
     * A 16-bit signed integer.
     * @type {Integer (Int32)}
     */
    static CIM_SINT16 => 2

    /**
     * A 16-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static CIM_UINT16 => 18

    /**
     * A 32-bit signed integer.
     * @type {Integer (Int32)}
     */
    static CIM_SINT32 => 3

    /**
     * A 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static CIM_UINT32 => 19

    /**
     * A 64-bit signed integer.
     * @type {Integer (Int32)}
     */
    static CIM_SINT64 => 20

    /**
     * A 64-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static CIM_UINT64 => 21

    /**
     * A 32-bit real number.
     * @type {Integer (Int32)}
     */
    static CIM_REAL32 => 4

    /**
     * A 64-bit real number.
     * @type {Integer (Int32)}
     */
    static CIM_REAL64 => 5

    /**
     * A Boolean value.
     * @type {Integer (Int32)}
     */
    static CIM_BOOLEAN => 11

    /**
     * A string value.
     * @type {Integer (Int32)}
     */
    static CIM_STRING => 8

    /**
     * A DateTime value.
     * @type {Integer (Int32)}
     */
    static CIM_DATETIME => 101

    /**
     * Reference (__Path) of another Object.
     * @type {Integer (Int32)}
     */
    static CIM_REFERENCE => 102

    /**
     * A 16-bit character value.
     * @type {Integer (Int32)}
     */
    static CIM_CHAR16 => 103

    /**
     * An Object value.
     * @type {Integer (Int32)}
     */
    static CIM_OBJECT => 13

    /**
     * An array value.
     * @type {Integer (Int32)}
     */
    static CIM_FLAG_ARRAY => 8192
}

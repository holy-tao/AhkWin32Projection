#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ATTRIBUTE_TYPE enumeration defines possible values for a helper attribute.
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ne-ndattrib-attribute_type
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class ATTRIBUTE_TYPE extends Win32Enum{

    /**
     * An invalid attribute.
     * @type {Integer (Int32)}
     */
    static AT_INVALID => 0

    /**
     * A true or false value.
     * @type {Integer (Int32)}
     */
    static AT_BOOLEAN => 1

    /**
     * An 8-bit signed integer.
     * @type {Integer (Int32)}
     */
    static AT_INT8 => 2

    /**
     * An 8-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static AT_UINT8 => 3

    /**
     * A 16-bit signed integer.
     * @type {Integer (Int32)}
     */
    static AT_INT16 => 4

    /**
     * A 16-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static AT_UINT16 => 5

    /**
     * A 32-bit signed integer.
     * @type {Integer (Int32)}
     */
    static AT_INT32 => 6

    /**
     * A 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static AT_UINT32 => 7

    /**
     * A 64-bit signed integer.
     * @type {Integer (Int32)}
     */
    static AT_INT64 => 8

    /**
     * A 64-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static AT_UINT64 => 9

    /**
     * A string.
     * @type {Integer (Int32)}
     */
    static AT_STRING => 10

    /**
     * A GUID structure.
     * @type {Integer (Int32)}
     */
    static AT_GUID => 11

    /**
     * A LifeTime structure.
     * @type {Integer (Int32)}
     */
    static AT_LIFE_TIME => 12

    /**
     * An IPv4 or IPv6 address.
     * @type {Integer (Int32)}
     */
    static AT_SOCKADDR => 13

    /**
     * A byte array.
     * @type {Integer (Int32)}
     */
    static AT_OCTET_STRING => 14
}

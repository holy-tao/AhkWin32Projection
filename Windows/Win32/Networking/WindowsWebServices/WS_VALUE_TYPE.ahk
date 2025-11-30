#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The types of fixed-size primitives.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_value_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_VALUE_TYPE extends Win32Enum{

    /**
     * Used to indicate a BOOL value.
     * @type {Integer (Int32)}
     */
    static WS_BOOL_VALUE_TYPE => 0

    /**
     * Used to indicate a signed 8-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_INT8_VALUE_TYPE => 1

    /**
     * Used to indicate a signed 16-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_INT16_VALUE_TYPE => 2

    /**
     * Used to indicate a signed 32-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_INT32_VALUE_TYPE => 3

    /**
     * Used to indicate a signed 64-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_INT64_VALUE_TYPE => 4

    /**
     * Used to indicate an unsigned 8-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_UINT8_VALUE_TYPE => 5

    /**
     * Used to indicate an unsigned 16-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_UINT16_VALUE_TYPE => 6

    /**
     * Used to indicate an unsigned 32-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_UINT32_VALUE_TYPE => 7

    /**
     * Used to indicate an unsigned 64-bit integer.
     * @type {Integer (Int32)}
     */
    static WS_UINT64_VALUE_TYPE => 8

    /**
     * Used to indicate a 32-bit floating point value.
     * @type {Integer (Int32)}
     */
    static WS_FLOAT_VALUE_TYPE => 9

    /**
     * Used to indicate a 64-bit floating point value.
     * @type {Integer (Int32)}
     */
    static WS_DOUBLE_VALUE_TYPE => 10

    /**
     * Used to indicate a 96-bit fixed point value.
     * @type {Integer (Int32)}
     */
    static WS_DECIMAL_VALUE_TYPE => 11

    /**
     * Used to indicate a date and time.
     * @type {Integer (Int32)}
     */
    static WS_DATETIME_VALUE_TYPE => 12

    /**
     * Used to indicate a signed 64-bit time period in 100 nanosecond units.
     * @type {Integer (Int32)}
     */
    static WS_TIMESPAN_VALUE_TYPE => 13

    /**
     * Used to indicate a GUID.
     * @type {Integer (Int32)}
     */
    static WS_GUID_VALUE_TYPE => 14

    /**
     * Used to indicate a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a>.
     * @type {Integer (Int32)}
     */
    static WS_DURATION_VALUE_TYPE => 15
}

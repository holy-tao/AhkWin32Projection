#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The types of fixed-size primitives.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_value_type
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_VALUE_TYPE extends Win32Enum {

    /**
     * Used to indicate a BOOL value.
     * Native name: WS_BOOL_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static BOOL_VALUE_TYPE => 0

    /**
     * Used to indicate a signed 8-bit integer.
     * Native name: WS_INT8_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static INT8_VALUE_TYPE => 1

    /**
     * Used to indicate a signed 16-bit integer.
     * Native name: WS_INT16_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static INT16_VALUE_TYPE => 2

    /**
     * Used to indicate a signed 32-bit integer.
     * Native name: WS_INT32_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static INT32_VALUE_TYPE => 3

    /**
     * Used to indicate a signed 64-bit integer.
     * Native name: WS_INT64_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static INT64_VALUE_TYPE => 4

    /**
     * Used to indicate an unsigned 8-bit integer.
     * Native name: WS_UINT8_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static UINT8_VALUE_TYPE => 5

    /**
     * Used to indicate an unsigned 16-bit integer.
     * Native name: WS_UINT16_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static UINT16_VALUE_TYPE => 6

    /**
     * Used to indicate an unsigned 32-bit integer.
     * Native name: WS_UINT32_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static UINT32_VALUE_TYPE => 7

    /**
     * Used to indicate an unsigned 64-bit integer.
     * Native name: WS_UINT64_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static UINT64_VALUE_TYPE => 8

    /**
     * Used to indicate a 32-bit floating point value.
     * Native name: WS_FLOAT_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static FLOAT_VALUE_TYPE => 9

    /**
     * Used to indicate a 64-bit floating point value.
     * Native name: WS_DOUBLE_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static DOUBLE_VALUE_TYPE => 10

    /**
     * Used to indicate a 96-bit fixed point value.
     * Native name: WS_DECIMAL_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static DECIMAL_VALUE_TYPE => 11

    /**
     * Used to indicate a date and time.
     * Native name: WS_DATETIME_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static DATETIME_VALUE_TYPE => 12

    /**
     * Used to indicate a signed 64-bit time period in 100 nanosecond units.
     * Native name: WS_TIMESPAN_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static TIMESPAN_VALUE_TYPE => 13

    /**
     * Used to indicate a GUID.
     * Native name: WS_GUID_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static GUID_VALUE_TYPE => 14

    /**
     * Used to indicate a <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_duration">WS_DURATION</a>.
     * Native name: WS_DURATION_VALUE_TYPE
     * @type {Integer (Int32)}
     */
    static DURATION_VALUE_TYPE => 15
}

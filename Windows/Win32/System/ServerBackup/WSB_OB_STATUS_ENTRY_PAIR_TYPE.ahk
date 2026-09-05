#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of the parameter value.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ne-wsbonline-wsb_ob_status_entry_pair_type
 * @namespace Windows.Win32.System.ServerBackup
 */
class WSB_OB_STATUS_ENTRY_PAIR_TYPE extends Win32Enum {

    /**
     * The value type is undefined.
     * Native name: WSB_OB_ET_UNDEFINED
     * @type {Integer (Int32)}
     */
    static ET_UNDEFINED => 0

    /**
     * The value type is string.
     * Native name: WSB_OB_ET_STRING
     * @type {Integer (Int32)}
     */
    static ET_STRING => 1

    /**
     * The value type is integer.
     * Native name: WSB_OB_ET_NUMBER
     * @type {Integer (Int32)}
     */
    static ET_NUMBER => 2

    /**
     * The value type is datetime which represents an instant in time, typically expressed as a date and time of day. All time-related values are specified in Coordinated Universal Time (UTC) format.
     * Native name: WSB_OB_ET_DATETIME
     * @type {Integer (Int32)}
     */
    static ET_DATETIME => 3

    /**
     * The value type is time. All time-related values are specified in UTC format.
     * Native name: WSB_OB_ET_TIME
     * @type {Integer (Int32)}
     */
    static ET_TIME => 4

    /**
     * The value type is size.
     * Native name: WSB_OB_ET_SIZE
     * @type {Integer (Int32)}
     */
    static ET_SIZE => 5

    /**
     * The maximum enumeration value for this enumeration.
     * Native name: WSB_OB_ET_MAX
     * @type {Integer (Int32)}
     */
    static ET_MAX => 6
}

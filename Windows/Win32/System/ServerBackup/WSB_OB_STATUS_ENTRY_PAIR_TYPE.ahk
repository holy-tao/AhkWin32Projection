#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of the parameter value.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ne-wsbonline-wsb_ob_status_entry_pair_type
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class WSB_OB_STATUS_ENTRY_PAIR_TYPE{

    /**
     * The value type is undefined.
     * @type {Integer (Int32)}
     */
    static WSB_OB_ET_UNDEFINED => 0

    /**
     * The value type is string.
     * @type {Integer (Int32)}
     */
    static WSB_OB_ET_STRING => 1

    /**
     * The value type is integer.
     * @type {Integer (Int32)}
     */
    static WSB_OB_ET_NUMBER => 2

    /**
     * The value type is datetime which represents an instant in time, typically expressed as a date and time of day. All time-related values are specified in Coordinated Universal Time (UTC) format.
     * @type {Integer (Int32)}
     */
    static WSB_OB_ET_DATETIME => 3

    /**
     * The value type is time. All time-related values are specified in UTC format.
     * @type {Integer (Int32)}
     */
    static WSB_OB_ET_TIME => 4

    /**
     * The value type is size.
     * @type {Integer (Int32)}
     */
    static WSB_OB_ET_SIZE => 5

    /**
     * The maximum enumeration value for this enumeration.
     * @type {Integer (Int32)}
     */
    static WSB_OB_ET_MAX => 6
}

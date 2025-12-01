#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The values of the NEW_LOG_FILE_FREQUENCY enumeration type specify how frequently new log files are created.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-new_log_file_frequency
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class NEW_LOG_FILE_FREQUENCY extends Win32Enum{

    /**
     * Allows the log file to grow without limit. Do not create new log files periodically.
     * @type {Integer (Int32)}
     */
    static IAS_LOGGING_UNLIMITED_SIZE => 0

    /**
     * Creates a new log file each day.
     * @type {Integer (Int32)}
     */
    static IAS_LOGGING_DAILY => 1

    /**
     * Creates a new log file each week.
     * @type {Integer (Int32)}
     */
    static IAS_LOGGING_WEEKLY => 2

    /**
     * Creates a new log file each month.
     * @type {Integer (Int32)}
     */
    static IAS_LOGGING_MONTHLY => 3

    /**
     * Creates a new log file when the log file reaches a particular size.
     * @type {Integer (Int32)}
     */
    static IAS_LOGGING_WHEN_FILE_SIZE_REACHES => 4
}

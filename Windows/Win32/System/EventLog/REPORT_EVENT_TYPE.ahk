#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class REPORT_EVENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_SUCCESS => 0

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_AUDIT_FAILURE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_AUDIT_SUCCESS => 8

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_ERROR_TYPE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_INFORMATION_TYPE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static EVENTLOG_WARNING_TYPE => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MAILBOX_EVENT_LOG extends Win32Enum {

    /**
     * Native name: CxlMailboxEventRecords_InformationalEventLog
     * @type {Integer (Int32)}
     */
    static Records_InformationalEventLog => 0

    /**
     * Native name: CxlMailboxEventRecords_WarningEventLog
     * @type {Integer (Int32)}
     */
    static Records_WarningEventLog => 1

    /**
     * Native name: CxlMailboxEventRecords_FailureEventLog
     * @type {Integer (Int32)}
     */
    static Records_FailureEventLog => 2

    /**
     * Native name: CxlMailboxEventRecords_FatalEventLog
     * @type {Integer (Int32)}
     */
    static Records_FatalEventLog => 3

    /**
     * Native name: CxlMailboxEventRecords_DynamicCapacityEventLog
     * @type {Integer (Int32)}
     */
    static Records_DynamicCapacityEventLog => 4
}

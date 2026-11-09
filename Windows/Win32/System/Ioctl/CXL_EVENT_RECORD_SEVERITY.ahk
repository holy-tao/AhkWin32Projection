#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_EVENT_RECORD_SEVERITY extends Win32Enum {

    /**
     * Native name: CxlEventRecordSeverity_Informational
     * @type {Integer (Int32)}
     */
    static Informational => 0

    /**
     * Native name: CxlEventRecordSeverity_Warning
     * @type {Integer (Int32)}
     */
    static Warning => 1

    /**
     * Native name: CxlEventRecordSeverity_Failure
     * @type {Integer (Int32)}
     */
    static Failure => 2

    /**
     * Native name: CxlEventRecordSeverity_Fatal
     * @type {Integer (Int32)}
     */
    static Fatal => 3

    /**
     * Native name: CxlEventRecordSeverity_Max
     * @type {Integer (Int32)}
     */
    static Max => 4
}

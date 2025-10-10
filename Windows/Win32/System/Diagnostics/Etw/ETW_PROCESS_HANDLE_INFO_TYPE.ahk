#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies what kind of operation will be done on a handle.
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ne-evntrace-etw_process_handle_info_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class ETW_PROCESS_HANDLE_INFO_TYPE{

    /**
     * Used to query partition identifying information.  <i>InBuffer</i> should be Null.  <i>OutBuffer</i> should be large enough to hold the returned <a href="https://docs.microsoft.com/windows/desktop/ETW/etw-trace-partition-information">ETW_TRACE_PARTITION_INFORMATION</a> structure.  Note that this will only return a non-zero structure when the queried handle is for a trace file generated from a non-host partition on Windows 10, version 1709.
     * @type {Integer (Int32)}
     */
    static EtwQueryPartitionInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static EtwQueryPartitionInformationV2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static EtwQueryLastDroppedTimes => 3

    /**
     * @type {Integer (Int32)}
     */
    static EtwQueryLogFileHeader => 4

    /**
     * Marks the last value in the enumeration for testing purposes.  Should not be used.
     * @type {Integer (Int32)}
     */
    static EtwQueryProcessHandleInfoMax => 5
}

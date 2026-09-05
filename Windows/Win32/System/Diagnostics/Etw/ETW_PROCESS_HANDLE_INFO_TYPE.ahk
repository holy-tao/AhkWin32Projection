#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the operation that will be performed on a trace processing session.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ne-evntrace-etw_process_handle_info_type
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_PROCESS_HANDLE_INFO_TYPE extends Win32Enum {

    /**
     * Used to query partition identifying information. _InBuffer_ should be Null.
     * _OutBuffer_ should be large enough to hold the returned
     * [ETW_TRACE_PARTITION_INFORMATION](/windows/win32/api/evntrace/ns-evntrace-etw_trace_partition_information)
     * structure. Note that this will only return a non-zero structure when the queried
     * handle is for a trace file generated from a non-host partition on Windows 10,
     * version 1709 or later.
     * Native name: EtwQueryPartitionInformation
     * @type {Integer (Int32)}
     */
    static QueryPartitionInformation => 1

    /**
     * This is the same as **EtwQueryPartitionInformation**, except that it returns an
     * `ETW_TRACE_PARTITION_INFORMATION_V2` structure which has string partition IDs.
     * Native name: EtwQueryPartitionInformationV2
     * @type {Integer (Int32)}
     */
    static QueryPartitionInformationV2 => 2

    /**
     * Returns a ULONG stream count followed by an array of LARGE_INTEGER timestamps,
     * indexed by CPU number, of the last event dropped on each CPU stream. The zero
     * timestamp indicates that the CPU stream never dropped any events. The timestamps
     * use the clock type specified by the trace configuration (e.g. QPC, System Time,
     * or CPU counter).
     * Native name: EtwQueryLastDroppedTimes
     * @type {Integer (Int32)}
     */
    static QueryLastDroppedTimes => 3

    /**
     * Native name: EtwQueryLogFileHeader
     * @type {Integer (Int32)}
     */
    static QueryLogFileHeader => 4

    /**
     * Marks the last value in the enumeration for testing purposes. Should not be
     * used.
     * Native name: EtwQueryProcessHandleInfoMax
     * @type {Integer (Int32)}
     */
    static QueryProcessHandleInfoMax => 5
}

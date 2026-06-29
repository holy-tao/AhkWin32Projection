#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the performance data block that you queried, for example, the number of performance objects returned by the provider and the time-based values that you use when calculating performance values.
 * @remarks
 * The performance data block is returned when a consumer calls <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryvalueexa">RegQueryValueEx</a> to retrieve one or more performance objects. This structure is the first structure in the returned block. The next structure in the block is the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> structure, which defines a performance object. For details on the layout of the performance data block, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
 * 
 * Consumers use <b>PerfTime</b>, <b>PerfFreq</b>, and <b>PerfTime100nSec</b> when calculating counter values unless the counter type contains the <b>PERF_OBJECT_TIMER</b> flag in which case the consumer uses the <b>PerfTime</b> and <b>PerfFreq</b> members of <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_data_block
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_DATA_BLOCK {
    #StructPack 8

    /**
     * Array of four wide-characters that contains "PERF".
     */
    Signature : WCHAR[4]

    /**
     * Indicates if the counter values are in big endian format or little endian format. If one, the counter values are in little endian format. If zero, the counter values are in big endian format. This value may be zero (big endian format) if you retrieve performance data from a foreign computer, such as a UNIX computer.
     */
    LittleEndian : UInt32

    /**
     * Version of the performance structures.
     */
    Version : UInt32

    /**
     * Revision of the performance structures.
     */
    Revision : UInt32

    /**
     * Total size of the performance data block, in bytes.
     */
    TotalByteLength : UInt32

    /**
     * Size of this structure, in bytes. You use the header length to find the first <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> structure in the performance data block.
     */
    HeaderLength : UInt32

    /**
     * Number of performance objects in the performance data block.
     */
    NumObjectTypes : UInt32

    /**
     * Reserved.
     */
    DefaultObject : Int32

    /**
     * Time when the system was monitored. This member is in Coordinated Universal Time (UTC) format.
     */
    SystemTime : SYSTEMTIME

    /**
     * Performance-counter value, in counts, for the system being monitored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a>.
     */
    PerfTime : Int64

    /**
     * Performance-counter frequency, in counts per second, for the system being monitored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a>.
     */
    PerfFreq : Int64

    /**
     * Performance-counter value, in 100 nanosecond units, for the system being monitored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemtimeasfiletime">GetSystemTimeAsFileTime</a>.
     */
    PerfTime100nSec : Int64

    /**
     * Size of the computer name located at <b>SystemNameOffset</b>, in bytes.
     */
    SystemNameLength : UInt32

    /**
     * Offset from the beginning of this structure to the Unicode name of the computer being monitored.
     */
    SystemNameOffset : UInt32

}

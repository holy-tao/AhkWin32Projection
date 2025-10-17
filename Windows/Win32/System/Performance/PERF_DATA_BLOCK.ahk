#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Describes the performance data block that you queried, for example, the number of performance objects returned by the provider and the time-based values that you use when calculating performance values.
 * @remarks
 * 
  * The performance data block is returned when a consumer calls <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryvalueexa">RegQueryValueEx</a> to retrieve one or more performance objects. This structure is the first structure in the returned block. The next structure in the block is the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> structure, which defines a performance object. For details on the layout of the performance data block, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
  * 
  * Consumers use <b>PerfTime</b>, <b>PerfFreq</b>, and <b>PerfTime100nSec</b> when calculating counter values unless the counter type contains the <b>PERF_OBJECT_TIMER</b> flag in which case the consumer uses the <b>PerfTime</b> and <b>PerfFreq</b> members of <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winperf/ns-winperf-perf_data_block
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_DATA_BLOCK extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Array of four wide-characters that contains "PERF".
     * @type {String}
     */
    Signature {
        get => StrGet(this.ptr + 0, 3, "UTF-16")
        set => StrPut(value, this.ptr + 0, 3, "UTF-16")
    }

    /**
     * Indicates if the counter values are in big endian format or little endian format. If one, the counter values are in little endian format. If zero, the counter values are in big endian format. This value may be zero (big endian format) if you retrieve performance data from a foreign computer, such as a UNIX computer.
     * @type {Integer}
     */
    LittleEndian {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Version of the performance structures.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Revision of the performance structures.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Total size of the performance data block, in bytes.
     * @type {Integer}
     */
    TotalByteLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Size of this structure, in bytes. You use the header length to find the first <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> structure in the performance data block.
     * @type {Integer}
     */
    HeaderLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Number of performance objects in the performance data block.
     * @type {Integer}
     */
    NumObjectTypes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    DefaultObject {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Time when the system was monitored. This member is in Coordinated Universal Time (UTC) format.
     * @type {SYSTEMTIME}
     */
    SystemTime{
        get {
            if(!this.HasProp("__SystemTime"))
                this.__SystemTime := SYSTEMTIME(40, this)
            return this.__SystemTime
        }
    }

    /**
     * Performance-counter value, in counts, for the system being monitored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a>.
     * @type {Integer}
     */
    PerfTime {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * Performance-counter frequency, in counts per second, for the system being monitored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancefrequency">QueryPerformanceFrequency</a>.
     * @type {Integer}
     */
    PerfFreq {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * Performance-counter value, in 100 nanosecond units, for the system being monitored. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-getsystemtimeasfiletime">GetSystemTimeAsFileTime</a>.
     * @type {Integer}
     */
    PerfTime100nSec {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * Size of the computer name located at <b>SystemNameOffset</b>, in bytes.
     * @type {Integer}
     */
    SystemNameLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Offset from the beginning of this structure to the Unicode name of the computer being monitored.
     * @type {Integer}
     */
    SystemNameOffset {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}

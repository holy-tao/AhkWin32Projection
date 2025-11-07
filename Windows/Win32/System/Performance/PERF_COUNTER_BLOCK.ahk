#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the block of memory that contains the raw performance counter data for an object's counters.
 * @remarks
 * 
 * The <b>CounterOffset</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> provides the offset from the beginning of this structure to the counter value.
 * 
 * The location of the <b>PERF_COUNTER_BLOCK</b> structure within the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> block depends on if the object contains instances. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
 * 
 * You must ensure that the size of the counter block is aligned to an 8-byte boundary. For example, if the performance object includes two DWORD counters, you must add an additional four bytes to the counter block to make it aligned to an 8-byte boundary.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winperf/ns-winperf-perf_counter_block
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_BLOCK extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Size of this structure and the raw counter data that follows, in bytes.
     * @type {Integer}
     */
    ByteLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}

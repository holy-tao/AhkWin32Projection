#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the block of memory that contains the raw performance counter data for an object's counters.
 * @remarks
 * The <b>CounterOffset</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_counter_definition">PERF_COUNTER_DEFINITION</a> provides the offset from the beginning of this structure to the counter value.
 * 
 * The location of the <b>PERF_COUNTER_BLOCK</b> structure within the <a href="https://docs.microsoft.com/windows/desktop/api/winperf/ns-winperf-perf_object_type">PERF_OBJECT_TYPE</a> block depends on if the object contains instances. For details, see <a href="https://docs.microsoft.com/windows/desktop/PerfCtrs/performance-data-format">Performance Data Format</a>.
 * 
 * You must ensure that the size of the counter block is aligned to an 8-byte boundary. For example, if the performance object includes two DWORD counters, you must add an additional four bytes to the counter block to make it aligned to an 8-byte boundary.
 * @see https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_counter_block
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTER_BLOCK {
    #StructPack 4

    /**
     * Size of this structure and the raw counter data that follows, in bytes.
     */
    ByteLength : UInt32

}

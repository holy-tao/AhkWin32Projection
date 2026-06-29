#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * Provides information about the PERF_DATA_HEADER block that contains the structure.
 * @remarks
 * The ordering of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> blocks is based on the <b>Index</b> member of
 * the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_identifier">PERF_COUNTER_IDENTIFIER</a> blocks that the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterinfo">PerfQueryCounterInfo</a> function gets. Each
 * <b>PERF_COUNTER_HEADER</b> block is 8-byte aligned, so the value of the <b>dwTotalSize</b> is  a multiple
 * of 8 bytes.
 * 
 * 
 * 
 * The timestamp information in the <b>PERF_DATA_HEADER</b> structure is required when
 * you compute the display values of certain performance counters.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_data_header
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_DATA_HEADER {
    #StructPack 8

    /**
     * The sum of the size of the <b>PERF_DATA_HEADER</b> structure and the sizes of all of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> blocks in the <b>PERF_DATA_HEADER</b> block.
     */
    dwTotalSize : UInt32

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> blocks that the <b>PERF_DATA_HEADER</b> block contains.
     */
    dwNumCounters : UInt32

    /**
     * The timestamp from a high-resolution clock.
     */
    PerfTimeStamp : Int64

    /**
     * The number of 100 nanosecond intervals since January 1, 1601, in Coordinated Universal Time (UTC).
     */
    PerfTime100NSec : Int64

    /**
     * The frequency of a high-resolution clock.
     */
    PerfFreq : Int64

    /**
     * The time at which data is collected by the provider.
     */
    SystemTime : SYSTEMTIME

}

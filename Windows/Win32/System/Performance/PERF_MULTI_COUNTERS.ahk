#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about the PERF_MULTI_COUNTERS block that contains the structure.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function gets a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that may
 * contain a <b>PERF_MULTI_COUNTERS</b> block within the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_multi_counters
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_MULTI_COUNTERS {
    #StructPack 4

    /**
     * The total size of the <b>PERF_MULTI_COUNTERS</b> block, in bytes. This total size is the sum of the sizes of the <b>PERF_MULTI_COUNTERS</b> structure and all of the performance counter identifiers.
     */
    dwSize : UInt32

    /**
     * The number of performance counter identifiers that the <b>PERF_MULTI_COUNTERS</b> block contains.
     */
    dwCounters : UInt32

}

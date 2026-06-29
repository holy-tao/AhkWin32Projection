#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the PERF_COUNTER_DATA block that contains the structure.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function returns a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that may contain <b>PERF_COUNTER_DATA</b> blocks directly, or indirectly as part of a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_multi_instances">PERF_MULTI_INSTANCES</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_data
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTER_DATA {
    #StructPack 4

    /**
     * The size of the raw performance counter data that follows the <b>PERF_COUNTER_DATA</b> structure in the <b>PERF_COUNTER_DATA</b> block, in bytes.
     */
    dwDataSize : UInt32

    /**
     * The total size of the <b>PERF_COUNTER_DATA</b> block, which is the sum of the sizes opf the following items:
     * 
     * <ul>
     * <li>The <b>PERF_COUNTER_DATA</b> structure</li>
     * <li>The raw performance counter data</li>
     * <li>The padding that ensures that the size of the  <b>PERF_COUNTER_DATA</b> block is a multiple of 8 bytes</li>
     * </ul>
     */
    dwSize : UInt32

}

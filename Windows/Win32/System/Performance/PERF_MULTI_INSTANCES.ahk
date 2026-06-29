#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about the PERF_MULTI_INSTANCES block that contains the structure.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function gets a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that may
 * contain <b>PERF_MULTI_INSTANCES</b> blocks within the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_multi_instances
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_MULTI_INSTANCES {
    #StructPack 4

    /**
     * The total size of the <b>PERF_MULTI_INSTANCES</b> block, in bytes. This total size is the sum of the sizes of the <b>PERF_MULTI_INSTANCES</b> structure and the instance data blocks.
     */
    dwTotalSize : UInt32

    /**
     * The number of instance data blocks in the <b>PERF_MULTI_INSTANCES</b> block.
     */
    dwInstances : UInt32

}

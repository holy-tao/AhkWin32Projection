#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the PERF_MULTI_INSTANCES block that contains the structure.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function gets a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that may
 * contain <b>PERF_MULTI_INSTANCES</b> blocks within the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> block.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_multi_instances
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_MULTI_INSTANCES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The total size of the <b>PERF_MULTI_INSTANCES</b> block, in bytes. This total size is the sum of the sizes of the <b>PERF_MULTI_INSTANCES</b> structure and the instance data blocks.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of instance data blocks in the <b>PERF_MULTI_INSTANCES</b> block.
     * @type {Integer}
     */
    dwInstances {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the PERF_COUNTER_DATA block that contains the structure.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function returns a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that may contain <b>PERF_COUNTER_DATA</b> blocks directly, or indirectly as part of a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_multi_instances">PERF_MULTI_INSTANCES</a> block.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_counter_data
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size of the raw performance counter data that follows the <b>PERF_COUNTER_DATA</b> structure in the <b>PERF_COUNTER_DATA</b> block, in bytes.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The total size of the <b>PERF_COUNTER_DATA</b> block, which is the sum of the sizes opf the following items:
     * 
     * <ul>
     * <li>The <b>PERF_COUNTER_DATA</b> structure</li>
     * <li>The raw performance counter data</li>
     * <li>The padding that ensures that the size of the  <b>PERF_COUNTER_DATA</b> block is a multiple of 8 bytes</li>
     * </ul>
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

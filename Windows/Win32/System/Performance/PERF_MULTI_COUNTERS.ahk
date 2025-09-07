#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the PERF_MULTI_COUNTERS block that contains the structure.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function gets a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that may
  * contain a <b>PERF_MULTI_COUNTERS</b> block within the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_multi_counters
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_MULTI_COUNTERS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The total size of the <b>PERF_MULTI_COUNTERS</b> block, in bytes. This total size is the sum of the sizes of the <b>PERF_MULTI_COUNTERS</b> structure and all of the performance counter identifiers.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of performance counter identifiers that the <b>PERF_MULTI_COUNTERS</b> block contains.
     * @type {Integer}
     */
    dwCounters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

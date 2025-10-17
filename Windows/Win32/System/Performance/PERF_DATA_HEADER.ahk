#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Provides information about the PERF_DATA_HEADER block that contains the structure.
 * @remarks
 * 
  * The ordering of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> blocks is based on the <b>Index</b> member of
  * the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_identifier">PERF_COUNTER_IDENTIFIER</a> blocks that the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterinfo">PerfQueryCounterInfo</a> function gets. Each
  * <b>PERF_COUNTER_HEADER</b> block is 8-byte aligned, so the value of the <b>dwTotalSize</b> is  a multiple
  * of 8 bytes.
  * 
  * 
  * 
  * The timestamp information in the <b>PERF_DATA_HEADER</b> structure is required when
  * you compute the display values of certain performance counters.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_data_header
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_DATA_HEADER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The sum of the size of the <b>PERF_DATA_HEADER</b> structure and the sizes of all of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> blocks in the <b>PERF_DATA_HEADER</b> block.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_header">PERF_COUNTER_HEADER</a> blocks that the <b>PERF_DATA_HEADER</b> block contains.
     * @type {Integer}
     */
    dwNumCounters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The timestamp from a high-resolution clock.
     * @type {Integer}
     */
    PerfTimeStamp {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of 100 nanosecond intervals since January 1, 1601, in Coordinated Universal Time (UTC).
     * @type {Integer}
     */
    PerfTime100NSec {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The frequency of a high-resolution clock.
     * @type {Integer}
     */
    PerfFreq {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The time at which data is collected by the provider.
     * @type {SYSTEMTIME}
     */
    SystemTime{
        get {
            if(!this.HasProp("__SystemTime"))
                this.__SystemTime := SYSTEMTIME(32, this)
            return this.__SystemTime
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the PERF_STRING_BUFFER_HEADER block that contains the structure.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function called with the <i>requestCode</i> parameter set to
  * <b>PERF_REG_COUNTER_NAME_STRINGS</b> or <b>PERF_REG_COUNTER_HELP_STRINGS</b> gets a
  * <b>PERF_STRING_BUFFER_HEADER</b> block.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_string_buffer_header
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_STRING_BUFFER_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The total size of the <b>PERF_STRING_BUFFER_HEADER</b> block, in bytes. This total size is the sum of the sizes of the <b>PERF_STRING_BUFFER_HEADER</b> structure, all of the <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_counter_header">PERF_STRING_COUNTER_HEADER</a> structures, and the block of string data.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_counter_header">PERF_STRING_COUNTER_HEADER</a> structures in the  <b>PERF_STRING_BUFFER_HEADER</b> block.
     * @type {Integer}
     */
    dwCounters {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

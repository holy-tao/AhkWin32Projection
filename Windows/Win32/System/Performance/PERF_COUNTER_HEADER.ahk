#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the PERF_COUNTER_HEADER block that contains the structure.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function returns a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that
  * contains a sequence of <b>PERF_COUNTER_HEADER</b> blocks.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_counter_header
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * An error code that indicates whether the operation to query the performance succeeded or failed.
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of performance counter information that the <b>PERF_COUNTER_HEADER</b> block provides.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_ERROR_RETURN"></a><a id="perf_error_return"></a><dl>
     * <dt><b>PERF_ERROR_RETURN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error that was the result of a performance counter query. The performance library cannot get valid counter data back from provider.
     *   No additional data follows the <b>PERF_COUNTER_HEADER</b> structure. The <b>dwStatus</b> member of the structure
     *   contains the error code.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_SINGLE_COUNTER"></a><a id="perf_single_counter"></a><dl>
     * <dt><b>PERF_SINGLE_COUNTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The result of a  single-counter, single-instance query; for example,
     *   "\Processor(_Total)\% Processor Time". The additional data consists of a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_data">PERF_COUNTER_DATA</a> block.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_MULTIPLE_COUNTERS"></a><a id="perf_multiple_counters"></a><dl>
     * <dt><b>PERF_MULTIPLE_COUNTERS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The result of a  multi-counter, single-instance query; for example, "\Processor(_Total)\*". The additional data consists of a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_multi_counters">PERF_MULTI_COUNTERS</a> block followed by  <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_data">PERF_COUNTER_DATA</a> blocks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_MULTIPLE_INSTANCES"></a><a id="perf_multiple_instances"></a><dl>
     * <dt><b>PERF_MULTIPLE_INSTANCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The result of a single-counter, multi-instance query; for example, "\Processor(*)\% Processor Time". The additional data consists of a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_multi_instances">PERF_MULTI_INSTANCES</a> block.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_COUNTERSET"></a><a id="perf_counterset"></a><dl>
     * <dt><b>PERF_COUNTERSET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The result of a multi-counter, multi-instance query; for example,
     *   "\Processor(*)\*". The additional data consists of a 
     *   <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_multi_counters">PERF_MULTI_COUNTERS</a> block followed by a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_multi_instances">PERF_MULTI_INSTANCES</a> block.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The total size of the <b>PERF_COUNTER_HEADER</b> block, which equals the sum of the size of the <b>PERF_COUNTER_HEADER</b> structure and the size of the  additional data.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

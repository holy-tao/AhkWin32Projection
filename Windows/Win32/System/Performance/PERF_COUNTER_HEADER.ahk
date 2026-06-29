#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PerfCounterDataType.ahk" { PerfCounterDataType }

/**
 * Contains information about the PERF_COUNTER_HEADER block that contains the structure.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterdata">PerfQueryCounterData</a> function returns a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_data_header">PERF_DATA_HEADER</a> block that
 * contains a sequence of <b>PERF_COUNTER_HEADER</b> blocks.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_header
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTER_HEADER {
    #StructPack 4

    /**
     * An error code that indicates whether the operation to query the performance succeeded or failed.
     */
    dwStatus : UInt32

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
     */
    dwType : PerfCounterDataType

    /**
     * The total size of the <b>PERF_COUNTER_HEADER</b> block, which equals the sum of the size of the <b>PERF_COUNTER_HEADER</b> structure and the size of the  additional data.
     */
    dwSize : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

}

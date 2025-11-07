#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the PERF_COUNTERSET_REG_INFO block that contains the structure.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function called with the <i>requestCode</i> parameter set to
 * <b>PERF_REG_COUNTERSET_STRUCT</b> gets a <b>PERF_COUNTERSET_REG_INFO</b> block.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_counterset_reg_info
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTERSET_REG_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The unique identifier for the counter set.
     * @type {Pointer<Guid>}
     */
    CounterSetGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    CounterSetType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The target audience for the counters in the counter set. 
     * 
     * 
     * The possible values are:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_DETAIL_NOVICE"></a><a id="perf_detail_novice"></a><dl>
     * <dt><b>PERF_DETAIL_NOVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can display the counter to any level of user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_DETAIL_ADVANCED"></a><a id="perf_detail_advanced"></a><dl>
     * <dt><b>PERF_DETAIL_ADVANCED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter is complicated and should be displayed only to advanced users.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DetailLevel {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counter_reg_info">PERF_COUNTER_REG_INFO</a> structures in this  <b>PERF_COUNTERSET_REG_INFO</b> block.
     * @type {Integer}
     */
    NumCounters {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies whether the counter set allows multiple instances such as processes and physical disks, or    a single instance such as memory. 
     * 
     * 
     * The following are the possible instance types.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_COUNTERSET_SINGLE_INSTANCE"></a><a id="perf_counterset_single_instance"></a><dl>
     * <dt><b>PERF_COUNTERSET_SINGLE_INSTANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter set contains single instance counters, for example, a counter that measures physical memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_COUNTERSET_MULTI_INSTANCES"></a><a id="perf_counterset_multi_instances"></a><dl>
     * <dt><b>PERF_COUNTERSET_MULTI_INSTANCES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter set contains multiple instance counters, for example, a counter that measures the average disk I/O for a process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_COUNTERSET_SINGLE_AGGREGATE"></a><a id="perf_counterset_single_aggregate"></a><dl>
     * <dt><b>PERF_COUNTERSET_SINGLE_AGGREGATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter set contains single instance counters whose aggregate value is obtained from one or more sources. For example, a counter in this type of counter set might obtain the number of reads from each of the three hard disks on the computer and sum their values. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_COUNTERSET_MULTI_AGGREGATE"></a><a id="perf_counterset_multi_aggregate"></a><dl>
     * <dt><b>PERF_COUNTERSET_MULTI_AGGREGATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter set contains multiple instance counters whose aggregate value is obtained from all instances of the counter. For example, a counter in this type of counter set might obtain the total thread execution time for all threads in a multi-threaded application and sum their values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_COUNTERSET_SINGLE_AGGREGATE_HISTORY"></a><a id="perf_counterset_single_aggregate_history"></a><dl>
     * <dt><b>PERF_COUNTERSET_SINGLE_AGGREGATE_HISTORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The difference between this type and <b>PERF_COUNTERSET_SINGLE_AGGREGATE</b> is that this counter set type stores all counter values for the lifetime of the consumer application (the counter value is cached beyond the lifetime of the counter). For example, if one of the hard disks in the single aggregate example above were to become unavailable, the total bytes read by that disk would still be available and used to calculate the aggregate value. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_COUNTERSET_INSTANCE_AGGREGATE"></a><a id="perf_counterset_instance_aggregate"></a><dl>
     * <dt><b>PERF_COUNTERSET_INSTANCE_AGGREGATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    InstanceType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}

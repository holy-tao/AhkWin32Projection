#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the PERF_COUNTER_IDENTIFIER block that contains the structure.
 * @remarks
 * When you specify a counter set identifier for a single-instance counter set, you must not specify the
 * instance name in the additional data of the <b>PERF_COUNTER_IDENTIFIER</b> block. The size of the <b>PERF_COUNTER_IDENTIFIER</b> block must be the size of the <b>PERF_COUNTER_IDENTIFIER</b> structure.
 * 
 * On the other hand, when you specify a counter set identifier for a multiple-instance counter set, you must specify the instance name in the additional data of the <b>PERF_COUNTER_IDENTIFIER</b> block. The identifier is notconsidered valid unless the size of
 * the <b>PERF_COUNTER_IDENTIFIER</b> block is greater than the  size of the <b>PERF_COUNTER_IDENTIFIER</b> structure. If you do not want
 * to filter the counter sets based on the instance name, use <b>PERF_WILDCARD_INSTANCE</b> as the instance
 * name.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfaddcounters">PerfAddCounters</a> and <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfdeletecounters">PerfDeleteCounters</a> functions accept a sequence of
 * <b>PERF_COUNTER_IDENTIFIER</b> blocks to define the counter specifications that you want to be
 * add or remove from a query.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterinfo">PerfQueryCounterInfo</a> function gets a sequence of <b>PERF_COUNTER_IDENTIFIER</b> blocks to indicate the counter specifications in a query and to indicate in the <b>Index</b> member the
 * order in which the  query gets the results.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_identifier
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_IDENTIFIER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The <b>GUID</b> of the performance counter set.
     * @type {Pointer<Guid>}
     */
    CounterSetGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An error code  that indicates whether the operation to add or delete a performance counter succeeded or failed.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total size of the <b>PERF_COUNTER_IDENTIFIER</b> block, in bytes. The total size of the block is the sum of the sizes of the <b>PERF_COUNTER_IDENTIFIER</b> structure, the string that specifies the instance name, and the padding.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The identifier of the performance counter. <b>PERF_WILDCARD_COUNTER</b> specifies  all counters.
     * @type {Integer}
     */
    CounterId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The instance identifier. Specify 0xFFFFFFFF if you do  not want to filter the results based on the instance identifier.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The position in the sequence of <b>PERF_COUNTER_IDENTIFIER</b> blocks at which the counter data that corresponds to this <b>PERF_COUNTER_IDENTIFIER</b> block is returned. Set by <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycounterinfo">PerfQueryCounterInfo</a>.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}

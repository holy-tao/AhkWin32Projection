#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the content type of a PERF_COUNTER_HEADER block that the PerfQueryCounterData function includes as part of the PERF_DATA_HEADER block that the function produces as output.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ne-perflib-perfcounterdatatype
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PerfCounterDataType{

    /**
     * An error occurred when the performance counter value was queried.
     * @type {Integer (Int32)}
     */
    static PERF_ERROR_RETURN => 0

    /**
     * The query returned a single counter from a single instance.
     * @type {Integer (Int32)}
     */
    static PERF_SINGLE_COUNTER => 1

    /**
     * The query returned multiple counters from a single instance.
     * @type {Integer (Int32)}
     */
    static PERF_MULTIPLE_COUNTERS => 2

    /**
     * The query returned a single counter from each of multiple instances.
     * @type {Integer (Int32)}
     */
    static PERF_MULTIPLE_INSTANCES => 4

    /**
     * The query returned multiple counters from each of multiple instances.
     * @type {Integer (Int32)}
     */
    static PERF_COUNTERSET => 6
}

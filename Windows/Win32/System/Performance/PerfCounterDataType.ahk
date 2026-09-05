#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the content type of a PERF_COUNTER_HEADER block that the PerfQueryCounterData function includes as part of the PERF_DATA_HEADER block that the function produces as output.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ne-perflib-perfcounterdatatype
 * @namespace Windows.Win32.System.Performance
 */
class PerfCounterDataType extends Win32Enum {

    /**
     * An error occurred when the performance counter value was queried.
     * Native name: PERF_ERROR_RETURN
     * @type {Integer (Int32)}
     */
    static ERROR_RETURN => 0

    /**
     * The query returned a single counter from a single instance.
     * Native name: PERF_SINGLE_COUNTER
     * @type {Integer (Int32)}
     */
    static SINGLE_COUNTER => 1

    /**
     * The query returned multiple counters from a single instance.
     * Native name: PERF_MULTIPLE_COUNTERS
     * @type {Integer (Int32)}
     */
    static MULTIPLE_COUNTERS => 2

    /**
     * The query returned a single counter from each of multiple instances.
     * Native name: PERF_MULTIPLE_INSTANCES
     * @type {Integer (Int32)}
     */
    static MULTIPLE_INSTANCES => 4

    /**
     * The query returned multiple counters from each of multiple instances.
     * Native name: PERF_COUNTERSET
     * @type {Integer (Int32)}
     */
    static COUNTERSET => 6
}

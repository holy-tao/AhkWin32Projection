#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class PERF_COUNTER_AGGREGATE_FUNC extends Win32Enum {

    /**
     * Native name: PERF_AGGREGATE_UNDEFINED
     * @type {Integer (UInt32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: PERF_AGGREGATE_TOTAL
     * @type {Integer (UInt32)}
     */
    static TOTAL => 1

    /**
     * Native name: PERF_AGGREGATE_AVG
     * @type {Integer (UInt32)}
     */
    static AVG => 2

    /**
     * Native name: PERF_AGGREGATE_MIN
     * @type {Integer (UInt32)}
     */
    static MIN => 3

    /**
     * Native name: PERF_AGGREGATE_MAX
     * @type {Integer (UInt32)}
     */
    static MAX => 4
}

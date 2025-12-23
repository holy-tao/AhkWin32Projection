#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_AGGREGATE_FUNC extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_AGGREGATE_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_AGGREGATE_TOTAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_AGGREGATE_AVG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_AGGREGATE_MIN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_AGGREGATE_MAX => 4
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTER_AGGREGATE_FUNC {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

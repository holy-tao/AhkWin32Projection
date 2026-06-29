#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct PDH_LOG_TYPE {
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
    static PDH_LOG_TYPE_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_CSV => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_SQL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_TSV => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_BINARY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_TYPE_PERFMON => 6
}

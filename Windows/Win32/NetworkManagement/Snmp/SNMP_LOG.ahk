#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_LOG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_SILENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_FATAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_WARNING => 3

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_TRACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SNMP_LOG_VERBOSE => 5
}

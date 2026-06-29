#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_OUTPUT_LOG_TYPE {
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
    static SNMP_OUTPUT_TO_CONSOLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_OUTPUT_TO_LOGFILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_OUTPUT_TO_DEBUGGER => 8
}

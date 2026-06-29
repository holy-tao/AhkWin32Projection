#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_GENERICTRAP {
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
    static SNMP_GENERICTRAP_COLDSTART => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_WARMSTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_LINKDOWN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_LINKUP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_AUTHFAILURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_EGPNEIGHLOSS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_GENERICTRAP_ENTERSPECIFIC => 6
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_PDU_TYPE {
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
    static SNMP_PDU_GET => 160

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_GETNEXT => 161

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_RESPONSE => 162

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_SET => 163

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_GETBULK => 165

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_PDU_TRAP => 167
}

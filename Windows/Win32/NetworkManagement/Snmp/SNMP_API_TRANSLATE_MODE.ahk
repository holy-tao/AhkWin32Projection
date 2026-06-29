#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_API_TRANSLATE_MODE {
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
    static SNMPAPI_TRANSLATED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_UNTRANSLATED_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SNMPAPI_UNTRANSLATED_V2 => 2
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Snmp
 */
export default struct SNMP_EXTENSION_REQUEST_TYPE {
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
    static SNMP_EXTENSION_GET => 160

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_GET_NEXT => 161

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_TEST => 224

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_COMMIT => 163

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_UNDO => 225

    /**
     * @type {Integer (UInt32)}
     */
    static SNMP_EXTENSION_SET_CLEANUP => 226
}

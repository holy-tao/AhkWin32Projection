#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_STRING_TYPE {
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
    static CERT_SIMPLE_NAME_STR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_OID_NAME_STR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_X500_NAME_STR => 3
}

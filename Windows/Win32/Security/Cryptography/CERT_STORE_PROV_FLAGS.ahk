#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_STORE_PROV_FLAGS {
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
    static CERT_STORE_PROV_EXTERNAL_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_DELETED_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_NO_PERSIST_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_SYSTEM_STORE_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STORE_PROV_LM_SYSTEM_STORE_FLAG => 16
}

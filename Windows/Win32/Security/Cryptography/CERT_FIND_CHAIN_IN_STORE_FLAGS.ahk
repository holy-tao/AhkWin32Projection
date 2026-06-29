#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_FIND_CHAIN_IN_STORE_FLAGS {
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
    static CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG => 16384
}

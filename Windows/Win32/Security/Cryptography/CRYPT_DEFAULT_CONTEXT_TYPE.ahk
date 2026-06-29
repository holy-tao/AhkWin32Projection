#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_DEFAULT_CONTEXT_TYPE {
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
    static CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID => 2
}

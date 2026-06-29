#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_VERIFY_CERT_FLAGS {
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
    static CRYPT_VERIFY_CERT_SIGN_DISABLE_MD2_MD4_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_VERIFY_CERT_SIGN_SET_STRONG_PROPERTIES_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_VERIFY_CERT_SIGN_RETURN_STRONG_PROPERTIES_FLAG => 4
}

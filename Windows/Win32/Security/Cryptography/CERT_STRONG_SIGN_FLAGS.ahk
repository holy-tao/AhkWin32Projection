#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_STRONG_SIGN_FLAGS {
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
    static CERT_STRONG_SIGN_ENABLE_CRL_CHECK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CERT_STRONG_SIGN_ENABLE_OCSP_CHECK => 2
}

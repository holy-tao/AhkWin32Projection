#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct eTlsSignatureAlgorithm {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static TlsSignatureAlgorithm_Anonymous => 0

    /**
     * @type {Integer (Int32)}
     */
    static TlsSignatureAlgorithm_Rsa => 1

    /**
     * @type {Integer (Int32)}
     */
    static TlsSignatureAlgorithm_Dsa => 2

    /**
     * @type {Integer (Int32)}
     */
    static TlsSignatureAlgorithm_Ecdsa => 3
}

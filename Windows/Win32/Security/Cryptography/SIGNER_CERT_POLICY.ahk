#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_CERT_POLICY {
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
    static SIGNER_CERT_POLICY_STORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_CERT_POLICY_CHAIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_CERT_POLICY_SPC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SIGNER_CERT_POLICY_CHAIN_NO_ROOT => 8
}

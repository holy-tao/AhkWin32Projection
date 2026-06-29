#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct X509HardwareKeyUsageFlags {
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
    static XCN_NCRYPT_PCP_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_TPM12_PROVIDER => 65536

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_SIGNATURE_KEY => 1

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_ENCRYPTION_KEY => 2

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_GENERIC_KEY => 3

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_STORAGE_KEY => 4

    /**
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_PCP_IDENTITY_KEY => 8
}

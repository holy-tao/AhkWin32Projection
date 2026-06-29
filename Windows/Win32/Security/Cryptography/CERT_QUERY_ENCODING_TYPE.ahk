#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_QUERY_ENCODING_TYPE {
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
    static X509_ASN_ENCODING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PKCS_7_ASN_ENCODING => 65536
}

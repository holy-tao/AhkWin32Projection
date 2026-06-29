#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERT_CREATE_REQUEST_FLAGS {
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
    static XECR_CMC => 3

    /**
     * @type {Integer (Int32)}
     */
    static XECR_PKCS10_V1_5 => 4

    /**
     * @type {Integer (Int32)}
     */
    static XECR_PKCS10_V2_0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static XECR_PKCS7 => 2
}

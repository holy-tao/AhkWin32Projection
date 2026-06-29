#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERT_ALT_NAME {
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
    static CERT_ALT_NAME_RFC822_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_DNS_NAME => 3

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_URL => 7

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_REGISTERED_ID => 9

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_DIRECTORY_NAME => 5

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_IP_ADDRESS => 8

    /**
     * @type {Integer (Int32)}
     */
    static CERT_ALT_NAME_OTHER_NAME => 1
}

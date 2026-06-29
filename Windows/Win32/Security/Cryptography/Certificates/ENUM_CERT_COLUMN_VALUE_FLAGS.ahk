#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ENUM_CERT_COLUMN_VALUE_FLAGS {
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
    static CV_OUT_BASE64 => 1

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_BASE64HEADER => 0

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_BASE64REQUESTHEADER => 3

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_BASE64X509CRLHEADER => 9

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_BINARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_HEX => 4

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_HEXADDR => 10

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_HEXASCII => 5

    /**
     * @type {Integer (Int32)}
     */
    static CV_OUT_HEXASCIIADDR => 11
}

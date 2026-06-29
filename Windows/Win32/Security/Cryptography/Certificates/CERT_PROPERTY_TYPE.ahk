#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CERT_PROPERTY_TYPE {
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
    static PROPTYPE_BINARY => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROPTYPE_DATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROPTYPE_LONG => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROPTYPE_STRING => 4
}

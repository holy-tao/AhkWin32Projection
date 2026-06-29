#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct SXH_SERVER_CERT_OPTION {
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
    static SXH_SERVER_CERT_IGNORE_UNKNOWN_CA => 256

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_WRONG_USAGE => 512

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_CERT_CN_INVALID => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_CERT_DATE_INVALID => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SXH_SERVER_CERT_IGNORE_ALL_SERVER_ERRORS => 13056
}

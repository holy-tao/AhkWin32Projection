#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct SERVERXMLHTTP_OPTION {
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
    static SXH_OPTION_URL => -1

    /**
     * @type {Integer (Int32)}
     */
    static SXH_OPTION_URL_CODEPAGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SXH_OPTION_ESCAPE_PERCENT_IN_URL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SXH_OPTION_SELECT_CLIENT_SSL_CERT => 3
}

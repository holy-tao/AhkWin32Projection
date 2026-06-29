#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct SXH_PROXY_SETTING {
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
    static SXH_PROXY_SET_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SXH_PROXY_SET_PRECONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static SXH_PROXY_SET_DIRECT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SXH_PROXY_SET_PROXY => 2
}

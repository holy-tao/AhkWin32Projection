#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_ENUM_LOG_CATEGORIES {
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
    static FAXLOG_CATEGORY_INIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_CATEGORY_OUTBOUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_CATEGORY_INBOUND => 3

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_CATEGORY_UNKNOWN => 4
}

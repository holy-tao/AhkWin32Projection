#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_ENUM_LOG_LEVELS {
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
    static FAXLOG_LEVEL_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_LEVEL_MIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_LEVEL_MED => 2

    /**
     * @type {Integer (Int32)}
     */
    static FAXLOG_LEVEL_MAX => 3
}

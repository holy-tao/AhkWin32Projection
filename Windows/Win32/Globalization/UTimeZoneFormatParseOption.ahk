#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTimeZoneFormatParseOption {
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
    static UTZFMT_PARSE_OPTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PARSE_OPTION_ALL_STYLES => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PARSE_OPTION_TZ_DATABASE_ABBREVIATIONS => 2
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateTimePatternMatchOptions {
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
    static UDATPG_MATCH_NO_OPTIONS => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_MATCH_HOUR_FIELD_LENGTH => 2048

    /**
     * @type {Integer (Int32)}
     */
    static UDATPG_MATCH_ALL_FIELDS_LENGTH => 65535
}

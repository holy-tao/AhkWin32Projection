#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UTimeZoneFormatGMTOffsetPatternType {
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
    static UTZFMT_PAT_POSITIVE_HM => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_POSITIVE_HMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_NEGATIVE_HM => 2

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_NEGATIVE_HMS => 3

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_POSITIVE_H => 4

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_NEGATIVE_H => 5

    /**
     * @type {Integer (Int32)}
     */
    static UTZFMT_PAT_COUNT => 6
}

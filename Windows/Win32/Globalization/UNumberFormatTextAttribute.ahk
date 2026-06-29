#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UNumberFormatTextAttribute {
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
    static UNUM_POSITIVE_PREFIX => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_POSITIVE_SUFFIX => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_NEGATIVE_PREFIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_NEGATIVE_SUFFIX => 3

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PADDING_CHARACTER => 4

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_CURRENCY_CODE => 5

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DEFAULT_RULESET => 6

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_PUBLIC_RULESETS => 7
}

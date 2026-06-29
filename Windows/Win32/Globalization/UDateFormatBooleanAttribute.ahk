#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UDateFormatBooleanAttribute {
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
    static UDAT_PARSE_ALLOW_WHITESPACE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PARSE_ALLOW_NUMERIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PARSE_PARTIAL_LITERAL_MATCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_PARSE_MULTIPLE_PATTERNS_FOR_MATCH => 3

    /**
     * @type {Integer (Int32)}
     */
    static UDAT_BOOLEAN_ATTRIBUTE_COUNT => 4
}

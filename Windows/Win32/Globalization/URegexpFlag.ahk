#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct URegexpFlag {
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
    static UREGEX_CASE_INSENSITIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_COMMENTS => 4

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_DOTALL => 32

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_LITERAL => 16

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_MULTILINE => 8

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_UNIX_LINES => 1

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_UWORD => 256

    /**
     * @type {Integer (Int32)}
     */
    static UREGEX_ERROR_ON_UNKNOWN_ESCAPES => 512
}

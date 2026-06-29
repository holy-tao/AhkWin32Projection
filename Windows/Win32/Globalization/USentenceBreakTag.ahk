#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct USentenceBreakTag {
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
    static UBRK_SENTENCE_TERM => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE_TERM_LIMIT => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE_SEP => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_SENTENCE_SEP_LIMIT => 200
}

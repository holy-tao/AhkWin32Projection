#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UWordBreak {
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
    static UBRK_WORD_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_NONE_LIMIT => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_NUMBER => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_NUMBER_LIMIT => 200

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_LETTER => 200

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_LETTER_LIMIT => 300

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_KANA => 300

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_KANA_LIMIT => 400

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_IDEO => 400

    /**
     * @type {Integer (Int32)}
     */
    static UBRK_WORD_IDEO_LIMIT => 500
}

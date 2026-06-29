#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UHangulSyllableType {
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
    static U_HST_NOT_APPLICABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_LEADING_JAMO => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_VOWEL_JAMO => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_TRAILING_JAMO => 3

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_LV_SYLLABLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static U_HST_LVT_SYLLABLE => 5
}

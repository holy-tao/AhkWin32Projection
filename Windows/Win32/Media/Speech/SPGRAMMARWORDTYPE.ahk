#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPGRAMMARWORDTYPE {
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
    static SPWT_DISPLAY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPWT_LEXICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPWT_PRONUNCIATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPWT_LEXICAL_NO_SPECIAL_CHARS => 3
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPCOMMITFLAGS {
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
    static SPCF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPCF_ADD_TO_USER_LEXICON => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPCF_DEFINITE_CORRECTION => 2
}

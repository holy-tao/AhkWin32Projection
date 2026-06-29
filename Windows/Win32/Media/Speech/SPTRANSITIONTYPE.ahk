#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPTRANSITIONTYPE {
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
    static SPTRANSEPSILON => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPTRANSWORD => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPTRANSRULE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPTRANSTEXTBUF => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPTRANSWILDCARD => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPTRANSDICTATION => 5
}

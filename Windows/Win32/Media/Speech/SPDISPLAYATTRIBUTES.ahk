#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPDISPLAYATTRIBUTES {
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
    static SPAF_ONE_TRAILING_SPACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPAF_TWO_TRAILING_SPACES => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPAF_CONSUME_LEADING_SPACES => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPAF_BUFFER_POSITION => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPAF_ALL => 31

    /**
     * @type {Integer (Int32)}
     */
    static SPAF_USER_SPECIFIED => 128
}

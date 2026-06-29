#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechDisplayAttributes {
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
    static SDA_No_Trailing_Space => 0

    /**
     * @type {Integer (Int32)}
     */
    static SDA_One_Trailing_Space => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDA_Two_Trailing_Spaces => 4

    /**
     * @type {Integer (Int32)}
     */
    static SDA_Consume_Leading_Spaces => 8
}

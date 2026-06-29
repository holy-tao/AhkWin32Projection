#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_PROPERTY_AC3 {
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
    static AM_PROPERTY_AC3_ERROR_CONCEALMENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_AC3_ALTERNATE_AUDIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_AC3_DOWNMIX => 3

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_AC3_BIT_STREAM_MODE => 4

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_AC3_DIALOGUE_LEVEL => 5

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_AC3_LANGUAGE_CODE => 6

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_AC3_ROOM_TYPE => 7
}

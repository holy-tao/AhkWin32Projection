#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SPVALUETYPE {
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
    static SPDF_PROPERTY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_REPLACEMENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_RULE => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_DISPLAYTEXT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_LEXICALFORM => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_PRONUNCIATION => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_AUDIO => 64

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_ALTERNATES => 128

    /**
     * @type {Integer (Int32)}
     */
    static SPDF_ALL => 255
}

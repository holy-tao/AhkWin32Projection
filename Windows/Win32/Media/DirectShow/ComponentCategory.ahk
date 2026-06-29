#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ComponentCategory {
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
    static CategoryNotSet => -1

    /**
     * @type {Integer (Int32)}
     */
    static CategoryOther => 0

    /**
     * @type {Integer (Int32)}
     */
    static CategoryVideo => 1

    /**
     * @type {Integer (Int32)}
     */
    static CategoryAudio => 2

    /**
     * @type {Integer (Int32)}
     */
    static CategoryText => 3

    /**
     * @type {Integer (Int32)}
     */
    static CategorySubtitles => 4

    /**
     * @type {Integer (Int32)}
     */
    static CategoryCaptions => 5

    /**
     * @type {Integer (Int32)}
     */
    static CategorySuperimpose => 6

    /**
     * @type {Integer (Int32)}
     */
    static CategoryData => 7

    /**
     * @type {Integer (Int32)}
     */
    static CATEGORY_COUNT => 8
}

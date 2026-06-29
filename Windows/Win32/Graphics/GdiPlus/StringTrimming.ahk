#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct StringTrimming {
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
    static StringTrimmingNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingCharacter => 1

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingWord => 2

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisCharacter => 3

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisWord => 4

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisPath => 5
}

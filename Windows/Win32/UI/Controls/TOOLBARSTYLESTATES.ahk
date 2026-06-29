#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TOOLBARSTYLESTATES {
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
    static TS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TS_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TS_CHECKED => 5

    /**
     * @type {Integer (Int32)}
     */
    static TS_HOTCHECKED => 6

    /**
     * @type {Integer (Int32)}
     */
    static TS_NEARHOT => 7

    /**
     * @type {Integer (Int32)}
     */
    static TS_OTHERSIDEHOT => 8
}

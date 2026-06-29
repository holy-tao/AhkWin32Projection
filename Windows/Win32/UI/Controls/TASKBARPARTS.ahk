#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TASKBARPARTS {
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
    static TBP_BACKGROUNDBOTTOM => 1

    /**
     * @type {Integer (Int32)}
     */
    static TBP_BACKGROUNDRIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TBP_BACKGROUNDTOP => 3

    /**
     * @type {Integer (Int32)}
     */
    static TBP_BACKGROUNDLEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARBOTTOM => 5

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARRIGHT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARTOP => 7

    /**
     * @type {Integer (Int32)}
     */
    static TBP_SIZINGBARLEFT => 8
}

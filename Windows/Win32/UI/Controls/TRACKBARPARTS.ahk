#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TRACKBARPARTS {
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
    static TKP_TRACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static TKP_TRACKVERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TKP_THUMB => 3

    /**
     * @type {Integer (Int32)}
     */
    static TKP_THUMBBOTTOM => 4

    /**
     * @type {Integer (Int32)}
     */
    static TKP_THUMBTOP => 5

    /**
     * @type {Integer (Int32)}
     */
    static TKP_THUMBVERT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TKP_THUMBLEFT => 7

    /**
     * @type {Integer (Int32)}
     */
    static TKP_THUMBRIGHT => 8

    /**
     * @type {Integer (Int32)}
     */
    static TKP_TICS => 9

    /**
     * @type {Integer (Int32)}
     */
    static TKP_TICSVERT => 10
}

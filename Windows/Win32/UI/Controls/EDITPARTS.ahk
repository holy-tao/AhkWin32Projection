#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct EDITPARTS {
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
    static EP_EDITTEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static EP_CARET => 2

    /**
     * @type {Integer (Int32)}
     */
    static EP_BACKGROUND => 3

    /**
     * @type {Integer (Int32)}
     */
    static EP_PASSWORD => 4

    /**
     * @type {Integer (Int32)}
     */
    static EP_BACKGROUNDWITHBORDER => 5

    /**
     * @type {Integer (Int32)}
     */
    static EP_EDITBORDER_NOSCROLL => 6

    /**
     * @type {Integer (Int32)}
     */
    static EP_EDITBORDER_HSCROLL => 7

    /**
     * @type {Integer (Int32)}
     */
    static EP_EDITBORDER_VSCROLL => 8

    /**
     * @type {Integer (Int32)}
     */
    static EP_EDITBORDER_HVSCROLL => 9
}

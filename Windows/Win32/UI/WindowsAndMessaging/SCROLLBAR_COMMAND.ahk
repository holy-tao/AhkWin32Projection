#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SCROLLBAR_COMMAND {
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
    static SB_LINEUP => 0

    /**
     * @type {Integer (Int32)}
     */
    static SB_LINELEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SB_LINEDOWN => 1

    /**
     * @type {Integer (Int32)}
     */
    static SB_LINERIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SB_PAGEUP => 2

    /**
     * @type {Integer (Int32)}
     */
    static SB_PAGELEFT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SB_PAGEDOWN => 3

    /**
     * @type {Integer (Int32)}
     */
    static SB_PAGERIGHT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SB_THUMBPOSITION => 4

    /**
     * @type {Integer (Int32)}
     */
    static SB_THUMBTRACK => 5

    /**
     * @type {Integer (Int32)}
     */
    static SB_TOP => 6

    /**
     * @type {Integer (Int32)}
     */
    static SB_LEFT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SB_RIGHT => 7

    /**
     * @type {Integer (Int32)}
     */
    static SB_BOTTOM => 7

    /**
     * @type {Integer (Int32)}
     */
    static SB_ENDSCROLL => 8
}

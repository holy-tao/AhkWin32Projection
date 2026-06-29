#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct WORD_BREAK_ACTION {
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
    static WB_CLASSIFY => 3

    /**
     * @type {Integer (Int32)}
     */
    static WB_ISDELIMITER => 2

    /**
     * @type {Integer (Int32)}
     */
    static WB_LEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static WB_LEFTBREAK => 6

    /**
     * @type {Integer (Int32)}
     */
    static WB_MOVEWORDLEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static WB_MOVEWORDRIGHT => 5

    /**
     * @type {Integer (Int32)}
     */
    static WB_RIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WB_RIGHTBREAK => 7
}

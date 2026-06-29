#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct GROUPHEADERLINESTATES {
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
    static LVGHL_OPEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_OPENHOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_OPENSELECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_OPENSELECTEDHOT => 4

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_OPENSELECTEDNOTFOCUSED => 5

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_OPENSELECTEDNOTFOCUSEDHOT => 6

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_OPENMIXEDSELECTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_OPENMIXEDSELECTIONHOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSE => 9

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSEHOT => 10

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSESELECTED => 11

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSESELECTEDHOT => 12

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSESELECTEDNOTFOCUSED => 13

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSESELECTEDNOTFOCUSEDHOT => 14

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSEMIXEDSELECTION => 15

    /**
     * @type {Integer (Int32)}
     */
    static LVGHL_CLOSEMIXEDSELECTIONHOT => 16
}

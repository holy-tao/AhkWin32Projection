#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct GROUPHEADERSTATES {
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
    static LVGH_OPEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_OPENHOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_OPENSELECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_OPENSELECTEDHOT => 4

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_OPENSELECTEDNOTFOCUSED => 5

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_OPENSELECTEDNOTFOCUSEDHOT => 6

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_OPENMIXEDSELECTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_OPENMIXEDSELECTIONHOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSE => 9

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSEHOT => 10

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSESELECTED => 11

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSESELECTEDHOT => 12

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSESELECTEDNOTFOCUSED => 13

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSESELECTEDNOTFOCUSEDHOT => 14

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSEMIXEDSELECTION => 15

    /**
     * @type {Integer (Int32)}
     */
    static LVGH_CLOSEMIXEDSELECTIONHOT => 16
}

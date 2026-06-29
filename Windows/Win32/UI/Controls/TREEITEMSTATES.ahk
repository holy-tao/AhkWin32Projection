#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TREEITEMSTATES {
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
    static TREIS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TREIS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TREIS_SELECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TREIS_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TREIS_SELECTEDNOTFOCUS => 5

    /**
     * @type {Integer (Int32)}
     */
    static TREIS_HOTSELECTED => 6
}

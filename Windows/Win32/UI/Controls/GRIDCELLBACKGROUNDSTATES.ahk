#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct GRIDCELLBACKGROUNDSTATES {
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
    static MCGCB_SELECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCGCB_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCGCB_SELECTEDHOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCGCB_SELECTEDNOTFOCUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCGCB_TODAY => 5

    /**
     * @type {Integer (Int32)}
     */
    static MCGCB_TODAYSELECTED => 6
}

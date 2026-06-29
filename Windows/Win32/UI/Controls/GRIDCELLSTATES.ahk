#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct GRIDCELLSTATES {
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
    static MCGC_HOT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCGC_HASSTATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCGC_HASSTATEHOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCGC_TODAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCGC_TODAYSELECTED => 5

    /**
     * @type {Integer (Int32)}
     */
    static MCGC_SELECTED => 6

    /**
     * @type {Integer (Int32)}
     */
    static MCGC_SELECTEDHOT => 7
}

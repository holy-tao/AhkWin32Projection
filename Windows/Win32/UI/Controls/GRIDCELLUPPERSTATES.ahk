#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct GRIDCELLUPPERSTATES {
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
    static MCGCU_HOT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCGCU_HASSTATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCGCU_HASSTATEHOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCGCU_SELECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCGCU_SELECTEDHOT => 5
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TRAILINGGRIDCELLUPPERSTATES {
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
    static MCTGCU_HOT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_HASSTATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_HASSTATEHOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_SELECTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MCTGCU_SELECTEDHOT => 5
}

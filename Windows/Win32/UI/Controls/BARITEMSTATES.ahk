#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct BARITEMSTATES {
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
    static MBI_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MBI_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MBI_PUSHED => 3

    /**
     * @type {Integer (Int32)}
     */
    static MBI_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MBI_DISABLEDHOT => 5

    /**
     * @type {Integer (Int32)}
     */
    static MBI_DISABLEDPUSHED => 6
}

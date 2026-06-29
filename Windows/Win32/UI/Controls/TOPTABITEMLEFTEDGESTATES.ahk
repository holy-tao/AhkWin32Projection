#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TOPTABITEMLEFTEDGESTATES {
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
    static TTILES_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TTILES_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TTILES_SELECTED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TTILES_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TTILES_FOCUSED => 5
}

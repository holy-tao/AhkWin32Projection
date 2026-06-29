#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct CUEBANNERSTATES {
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
    static CBCB_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CBCB_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CBCB_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static CBCB_DISABLED => 4
}

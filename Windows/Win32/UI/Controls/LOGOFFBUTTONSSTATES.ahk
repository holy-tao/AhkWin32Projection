#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LOGOFFBUTTONSSTATES {
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
    static SPLS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPLS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPLS_PRESSED => 3
}

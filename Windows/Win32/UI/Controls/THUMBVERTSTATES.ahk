#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct THUMBVERTSTATES {
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
    static TUVS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_FOCUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_DISABLED => 5
}

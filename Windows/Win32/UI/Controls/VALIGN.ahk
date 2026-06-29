#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct VALIGN {
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
    static VA_TOP => 0

    /**
     * @type {Integer (Int32)}
     */
    static VA_CENTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static VA_BOTTOM => 2
}

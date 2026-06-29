#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TOOLBARPARTS {
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
    static TP_BUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static TP_DROPDOWNBUTTON => 2

    /**
     * @type {Integer (Int32)}
     */
    static TP_SPLITBUTTON => 3

    /**
     * @type {Integer (Int32)}
     */
    static TP_SPLITBUTTONDROPDOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static TP_SEPARATOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static TP_SEPARATORVERT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TP_DROPDOWNBUTTONGLYPH => 7
}

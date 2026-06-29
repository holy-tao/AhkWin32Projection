#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DRAWITEMSTRUCT_CTL_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static ODT_BUTTON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ODT_COMBOBOX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ODT_LISTBOX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ODT_LISTVIEW => 102

    /**
     * @type {Integer (UInt32)}
     */
    static ODT_MENU => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ODT_STATIC => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ODT_TAB => 101
}

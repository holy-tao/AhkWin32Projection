#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COMBOBOXPARTS {
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
    static CP_DROPDOWNBUTTON => 1

    /**
     * @type {Integer (Int32)}
     */
    static CP_BACKGROUND => 2

    /**
     * @type {Integer (Int32)}
     */
    static CP_TRANSPARENTBACKGROUND => 3

    /**
     * @type {Integer (Int32)}
     */
    static CP_BORDER => 4

    /**
     * @type {Integer (Int32)}
     */
    static CP_READONLY => 5

    /**
     * @type {Integer (Int32)}
     */
    static CP_DROPDOWNBUTTONRIGHT => 6

    /**
     * @type {Integer (Int32)}
     */
    static CP_DROPDOWNBUTTONLEFT => 7

    /**
     * @type {Integer (Int32)}
     */
    static CP_CUEBANNER => 8

    /**
     * @type {Integer (Int32)}
     */
    static CP_DROPDOWNITEM => 9
}

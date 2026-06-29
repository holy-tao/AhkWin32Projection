#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct CHANGETYPE {
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
    static CN_GENERIC => 0

    /**
     * @type {Integer (Int32)}
     */
    static CN_TEXTCHANGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CN_NEWUNDO => 2

    /**
     * @type {Integer (Int32)}
     */
    static CN_NEWREDO => 4
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlSelection {
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
    static htmlSelectionNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectionText => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectionControl => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelectionTable => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlSelection_Max => 2147483647
}

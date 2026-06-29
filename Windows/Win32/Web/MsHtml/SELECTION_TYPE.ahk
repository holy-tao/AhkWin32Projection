#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct SELECTION_TYPE {
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
    static SELECTION_TYPE_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Caret => 1

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Text => 2

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Control => 3

    /**
     * @type {Integer (Int32)}
     */
    static SELECTION_TYPE_Max => 2147483647
}

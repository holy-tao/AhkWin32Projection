#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlEditable {
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
    static htmlEditableInherit => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlEditableTrue => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlEditableFalse => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlEditable_Max => 2147483647
}

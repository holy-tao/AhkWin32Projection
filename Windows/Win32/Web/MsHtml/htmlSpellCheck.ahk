#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct htmlSpellCheck {
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
    static htmlSpellCheckNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheckTrue => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheckFalse => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheckDefault => 3

    /**
     * @type {Integer (Int32)}
     */
    static htmlSpellCheck_Max => 2147483647
}

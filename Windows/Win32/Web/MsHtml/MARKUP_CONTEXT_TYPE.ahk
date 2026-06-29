#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct MARKUP_CONTEXT_TYPE {
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
    static CONTEXT_TYPE_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_Text => 1

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_EnterScope => 2

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_ExitScope => 3

    /**
     * @type {Integer (Int32)}
     */
    static CONTEXT_TYPE_NoScope => 4

    /**
     * @type {Integer (Int32)}
     */
    static MARKUP_CONTEXT_TYPE_Max => 2147483647
}

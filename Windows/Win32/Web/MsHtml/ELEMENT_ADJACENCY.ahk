#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ELEMENT_ADJACENCY {
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
    static ELEM_ADJ_BeforeBegin => 0

    /**
     * @type {Integer (Int32)}
     */
    static ELEM_ADJ_AfterBegin => 1

    /**
     * @type {Integer (Int32)}
     */
    static ELEM_ADJ_BeforeEnd => 2

    /**
     * @type {Integer (Int32)}
     */
    static ELEM_ADJ_AfterEnd => 3

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENT_ADJACENCY_Max => 2147483647
}

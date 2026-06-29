#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PARAFORMAT_NUMBERING_STYLE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static PFNS_PAREN => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PFNS_PARENS => 256

    /**
     * @type {Integer (UInt16)}
     */
    static PFNS_PERIOD => 512

    /**
     * @type {Integer (UInt16)}
     */
    static PFNS_PLAIN => 768

    /**
     * @type {Integer (UInt16)}
     */
    static PFNS_NONUMBER => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static PFNS_NEWNUMBER => 32768
}

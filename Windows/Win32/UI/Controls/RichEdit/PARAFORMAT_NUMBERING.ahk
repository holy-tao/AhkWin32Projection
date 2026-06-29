#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PARAFORMAT_NUMBERING {
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
    static PFN_BULLET => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_ARABIC => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_LCLETTER => 3

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_UCLETTER => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_LCROMAN => 5

    /**
     * @type {Integer (UInt16)}
     */
    static PFN_UCROMAN => 6
}

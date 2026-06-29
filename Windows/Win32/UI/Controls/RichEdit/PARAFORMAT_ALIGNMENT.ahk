#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PARAFORMAT_ALIGNMENT {
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
    static PFA_LEFT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_RIGHT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_CENTER => 3

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_JUSTIFY => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_FULL_INTERWORD => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_FULL_NEWSPAPER => 5

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_FULL_INTERLETTER => 6

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_FULL_SCALED => 7

    /**
     * @type {Integer (UInt16)}
     */
    static PFA_FULL_GLYPHS => 8
}

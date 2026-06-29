#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PARAFORMAT_SHADING_STYLE {
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
    static PARAFORMAT_SHADING_STYLE_NONE => 0

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_HORIZ => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_VERT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_DOWN_DIAG => 3

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_UP_DIAG => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_GRID => 5

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_DARK_TRELLIS => 6

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_HORZ => 7

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_VERT => 8

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_DOWN_DIAG => 9

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_UP_DIAG => 10

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_GRID => 11

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_SHADING_STYLE_LIGHT_TRELLIS => 12
}

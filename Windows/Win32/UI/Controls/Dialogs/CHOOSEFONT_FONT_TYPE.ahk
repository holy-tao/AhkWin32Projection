#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 */
export default struct CHOOSEFONT_FONT_TYPE {
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
    static BOLD_FONTTYPE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static ITALIC_FONTTYPE => 512

    /**
     * @type {Integer (UInt16)}
     */
    static PRINTER_FONTTYPE => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static REGULAR_FONTTYPE => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static SCREEN_FONTTYPE => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static SIMULATED_FONTTYPE => 32768
}

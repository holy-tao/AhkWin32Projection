#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the font style of the timed text.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_font_style
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_FONT_STYLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The font style is normal, sometimes referred to as roman.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_FONT_STYLE_NORMAL => 0

    /**
     * The font style is oblique.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_FONT_STYLE_OBLIQUE => 1

    /**
     * The font style is italic.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_FONT_STYLE_ITALIC => 2
}

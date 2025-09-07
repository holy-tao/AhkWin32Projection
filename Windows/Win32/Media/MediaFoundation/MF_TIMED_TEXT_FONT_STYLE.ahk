#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the font style of the timed text.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_font_style
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_FONT_STYLE{

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

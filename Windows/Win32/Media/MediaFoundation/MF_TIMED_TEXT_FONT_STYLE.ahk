#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the font style of the timed text.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_font_style
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_FONT_STYLE extends Win32Enum {

    /**
     * The font style is normal, sometimes referred to as roman.
     * Native name: MF_TIMED_TEXT_FONT_STYLE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 0

    /**
     * The font style is oblique.
     * Native name: MF_TIMED_TEXT_FONT_STYLE_OBLIQUE
     * @type {Integer (Int32)}
     */
    static OBLIQUE => 1

    /**
     * The font style is italic.
     * Native name: MF_TIMED_TEXT_FONT_STYLE_ITALIC
     * @type {Integer (Int32)}
     */
    static ITALIC => 2
}

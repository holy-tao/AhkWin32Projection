#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how text is decorated (underlined and so on).
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_decoration
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_DECORATION extends Win32Enum {

    /**
     * Text isn't decorated.
     * Native name: MF_TIMED_TEXT_DECORATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Text is underlined.
     * Native name: MF_TIMED_TEXT_DECORATION_UNDERLINE
     * @type {Integer (Int32)}
     */
    static UNDERLINE => 1

    /**
     * Text has a line through it.
     * Native name: MF_TIMED_TEXT_DECORATION_LINE_THROUGH
     * @type {Integer (Int32)}
     */
    static LINE_THROUGH => 2

    /**
     * Text has a line over it.
     * Native name: MF_TIMED_TEXT_DECORATION_OVERLINE
     * @type {Integer (Int32)}
     */
    static OVERLINE => 4
}

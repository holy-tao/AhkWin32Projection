#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how text is decorated (underlined and so on).
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_decoration
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_DECORATION extends Win32Enum{

    /**
     * Text isn't decorated.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_DECORATION_NONE => 0

    /**
     * Text is underlined.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_DECORATION_UNDERLINE => 1

    /**
     * Text has a line through it.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_DECORATION_LINE_THROUGH => 2

    /**
     * Text has a line over it.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_DECORATION_OVERLINE => 4
}

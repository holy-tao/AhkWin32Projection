#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how text is aligned with the display.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_timed_text_display_alignment
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_DISPLAY_ALIGNMENT{

    /**
     * Text is aligned before an element.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_DISPLAY_ALIGNMENT_BEFORE => 0

    /**
     * Text is aligned after an element.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_DISPLAY_ALIGNMENT_AFTER => 1

    /**
     * Text is aligned in the center between elements.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_DISPLAY_ALIGNMENT_CENTER => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how text is aligned with the display.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_display_alignment
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_DISPLAY_ALIGNMENT extends Win32Enum {

    /**
     * Text is aligned before an element.
     * Native name: MF_TIMED_TEXT_DISPLAY_ALIGNMENT_BEFORE
     * @type {Integer (Int32)}
     */
    static BEFORE => 0

    /**
     * Text is aligned after an element.
     * Native name: MF_TIMED_TEXT_DISPLAY_ALIGNMENT_AFTER
     * @type {Integer (Int32)}
     */
    static AFTER => 1

    /**
     * Text is aligned in the center between elements.
     * Native name: MF_TIMED_TEXT_DISPLAY_ALIGNMENT_CENTER
     * @type {Integer (Int32)}
     */
    static CENTER => 2
}

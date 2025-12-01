#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how text is aligned in its parent block element.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_alignment
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_ALIGNMENT extends Win32Enum{

    /**
     * Text is aligned at the start of its parent block element.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ALIGNMENT_START => 0

    /**
     * Text is aligned at the end of its parent block element.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ALIGNMENT_END => 1

    /**
     * Text is aligned in the center of its parent block element.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_ALIGNMENT_CENTER => 2
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how text appears when the parent element is scrolled.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_timed_text_scroll_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_SCROLL_MODE extends Win32Enum{

    /**
     * Text pops on when the parent element is scrolled.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_SCROLL_MODE_POP_ON => 0

    /**
     * Text rolls up when the parent element is scrolled.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_SCROLL_MODE_ROLL_UP => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the units in which the timed text is measured.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_TIMED_TEXT_UNIT_TYPE extends Win32Enum {

    /**
     * The timed text is measured in pixels.
     * Native name: MF_TIMED_TEXT_UNIT_TYPE_PIXELS
     * @type {Integer (Int32)}
     */
    static PIXELS => 0

    /**
     * The timed text is measured as a percentage.
     * Native name: MF_TIMED_TEXT_UNIT_TYPE_PERCENTAGE
     * @type {Integer (Int32)}
     */
    static PERCENTAGE => 1
}

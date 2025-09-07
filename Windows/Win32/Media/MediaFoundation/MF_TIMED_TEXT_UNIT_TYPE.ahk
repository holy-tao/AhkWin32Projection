#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the units in which the timed text is measured.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_TIMED_TEXT_UNIT_TYPE{

    /**
     * The timed text is measured in pixels.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_UNIT_TYPE_PIXELS => 0

    /**
     * The timed text is measured as a percentage.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_UNIT_TYPE_PERCENTAGE => 1
}

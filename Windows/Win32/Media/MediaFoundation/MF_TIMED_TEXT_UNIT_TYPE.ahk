#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the units in which the timed text is measured.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_unit_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_UNIT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

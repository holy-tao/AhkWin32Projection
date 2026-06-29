#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how text is aligned in its parent block element.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_alignment
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_ALIGNMENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

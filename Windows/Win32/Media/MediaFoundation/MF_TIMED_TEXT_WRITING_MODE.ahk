#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the sequence in which text is written on its parent element.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_writing_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_WRITING_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Text is written from left to right and top to bottom.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_LRTB => 0

    /**
     * Text is written from right to left and top to bottom.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_RLTB => 1

    /**
     * Text is written from top to bottom and right to left.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_TBRL => 2

    /**
     * Text is written from top to bottom and left to right.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_TBLR => 3

    /**
     * Text is written from left to right.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_LR => 4

    /**
     * Text is written from right to left.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_RL => 5

    /**
     * Text is written from top to bottom.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_WRITING_MODE_TB => 6
}

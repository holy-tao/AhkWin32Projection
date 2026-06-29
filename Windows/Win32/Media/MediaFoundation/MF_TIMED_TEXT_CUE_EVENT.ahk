#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of a timed text cue event.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_cue_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_CUE_EVENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The cue has become active.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_CUE_EVENT_ACTIVE => 0

    /**
     * The cue has become inactive.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_CUE_EVENT_INACTIVE => 1

    /**
     * All cues have been deactivated.
     * @type {Integer (Int32)}
     */
    static MF_TIMED_TEXT_CUE_EVENT_CLEAR => 2
}

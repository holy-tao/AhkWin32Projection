#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how text appears when the parent element is scrolled.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_timed_text_scroll_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_TIMED_TEXT_SCROLL_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

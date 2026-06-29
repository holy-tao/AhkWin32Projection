#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the various modes for video ports.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ne-vptype-amvp_mode
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVP_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Weave.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_WEAVE => 0

    /**
     * Interleaved bob. Bob mode in which resources are allocated to switch to weave mode, for example, on the next frame.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_BOBINTERLEAVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_BOBNONINTERLEAVED => 2

    /**
     * Skip even fields.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_SKIPEVEN => 3

    /**
     * Skip odd fields.
     * @type {Integer (Int32)}
     */
    static AMVP_MODE_SKIPODD => 4
}

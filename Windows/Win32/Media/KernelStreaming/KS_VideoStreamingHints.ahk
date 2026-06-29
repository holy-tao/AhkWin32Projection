#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_VideoStreamingHints {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static KS_StreamingHint_FrameInterval => 256

    /**
     * @type {Integer (Int32)}
     */
    static KS_StreamingHint_KeyFrameRate => 512

    /**
     * @type {Integer (Int32)}
     */
    static KS_StreamingHint_PFrameRate => 1024

    /**
     * @type {Integer (Int32)}
     */
    static KS_StreamingHint_CompQuality => 2048

    /**
     * @type {Integer (Int32)}
     */
    static KS_StreamingHint_CompWindowSize => 4096
}

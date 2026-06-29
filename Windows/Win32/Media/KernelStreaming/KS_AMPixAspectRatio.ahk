#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_AMPixAspectRatio {
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
    static KS_PixAspectRatio_NTSC4x3 => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_PixAspectRatio_NTSC16x9 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_PixAspectRatio_PAL4x3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_PixAspectRatio_PAL16x9 => 3
}

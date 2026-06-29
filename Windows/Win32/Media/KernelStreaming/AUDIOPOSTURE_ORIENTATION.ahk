#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct AUDIOPOSTURE_ORIENTATION {
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
    static AUDIOPOSTURE_ORIENTATION_NOTROTATED => 0

    /**
     * @type {Integer (Int32)}
     */
    static AUDIOPOSTURE_ORIENTATION_ROTATED90DEGREESCOUNTERCLOCKWISE => 1

    /**
     * @type {Integer (Int32)}
     */
    static AUDIOPOSTURE_ORIENTATION_ROTATED180DEGREESCOUNTERCLOCKWISE => 2

    /**
     * @type {Integer (Int32)}
     */
    static AUDIOPOSTURE_ORIENTATION_ROTATED270DEGREESCOUNTERCLOCKWISE => 3
}

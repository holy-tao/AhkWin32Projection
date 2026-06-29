#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct CAPTURE_MEMORY_ALLOCATION_FLAGS {
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
    static KS_CAPTURE_ALLOC_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAPTURE_ALLOC_SYSTEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAPTURE_ALLOC_VRAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAPTURE_ALLOC_SYSTEM_AGP => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAPTURE_ALLOC_VRAM_MAPPED => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_CAPTURE_ALLOC_SECURE_BUFFER => 16
}

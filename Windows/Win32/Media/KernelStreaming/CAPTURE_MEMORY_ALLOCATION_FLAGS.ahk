#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class CAPTURE_MEMORY_ALLOCATION_FLAGS{

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

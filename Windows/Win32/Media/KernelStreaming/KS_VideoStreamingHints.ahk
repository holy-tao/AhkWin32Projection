#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_VideoStreamingHints{

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

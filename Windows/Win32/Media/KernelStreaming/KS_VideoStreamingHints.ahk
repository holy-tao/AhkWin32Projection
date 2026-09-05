#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_VideoStreamingHints extends Win32Enum {

    /**
     * Native name: KS_StreamingHint_FrameInterval
     * @type {Integer (Int32)}
     */
    static Hint_FrameInterval => 256

    /**
     * Native name: KS_StreamingHint_KeyFrameRate
     * @type {Integer (Int32)}
     */
    static Hint_KeyFrameRate => 512

    /**
     * Native name: KS_StreamingHint_PFrameRate
     * @type {Integer (Int32)}
     */
    static Hint_PFrameRate => 1024

    /**
     * Native name: KS_StreamingHint_CompQuality
     * @type {Integer (Int32)}
     */
    static Hint_CompQuality => 2048

    /**
     * Native name: KS_StreamingHint_CompWindowSize
     * @type {Integer (Int32)}
     */
    static Hint_CompWindowSize => 4096
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_VIDEODECODER_FLAGS extends Win32Enum {

    /**
     * Native name: KS_VIDEODECODER_FLAGS_CAN_DISABLE_OUTPUT
     * @type {Integer (Int32)}
     */
    static CAN_DISABLE_OUTPUT => 1

    /**
     * Native name: KS_VIDEODECODER_FLAGS_CAN_USE_VCR_LOCKING
     * @type {Integer (Int32)}
     */
    static CAN_USE_VCR_LOCKING => 2

    /**
     * Native name: KS_VIDEODECODER_FLAGS_CAN_INDICATE_LOCKED
     * @type {Integer (Int32)}
     */
    static CAN_INDICATE_LOCKED => 4
}

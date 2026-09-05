#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_CAPTURE_ENGINE_AUDIO_PROCESSING_MODE extends Win32Enum {

    /**
     * Native name: MF_CAPTURE_ENGINE_AUDIO_PROCESSING_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: MF_CAPTURE_ENGINE_AUDIO_PROCESSING_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAPTURE_ENGINE_AUDIO_PROCESSING_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_AUDIO_PROCESSING_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_CAPTURE_ENGINE_AUDIO_PROCESSING_RAW => 1
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFT_AUDIO_DECODER_DEGRADATION_REASON extends Win32Enum {

    /**
     * Native name: MFT_AUDIO_DECODER_DEGRADATION_REASON_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: MFT_AUDIO_DECODER_DEGRADATION_REASON_LICENSING_REQUIREMENT
     * @type {Integer (Int32)}
     */
    static LICENSING_REQUIREMENT => 1
}

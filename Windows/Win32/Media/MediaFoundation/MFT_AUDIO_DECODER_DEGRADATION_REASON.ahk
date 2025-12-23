#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_AUDIO_DECODER_DEGRADATION_REASON extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_REASON_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFT_AUDIO_DECODER_DEGRADATION_REASON_LICENSING_REQUIREMENT => 1
}

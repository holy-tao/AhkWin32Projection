#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFT_AUDIO_DECODER_DEGRADATION_REASON.ahk
#Include .\MFT_AUDIO_DECODER_DEGRADATION_TYPE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFAudioDecoderDegradationInfo extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {MFT_AUDIO_DECODER_DEGRADATION_REASON}
     */
    eDegradationReason {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MFT_AUDIO_DECODER_DEGRADATION_TYPE}
     */
    eType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}

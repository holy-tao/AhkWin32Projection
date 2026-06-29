#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFT_AUDIO_DECODER_DEGRADATION_TYPE.ahk" { MFT_AUDIO_DECODER_DEGRADATION_TYPE }
#Import ".\MFT_AUDIO_DECODER_DEGRADATION_REASON.ahk" { MFT_AUDIO_DECODER_DEGRADATION_REASON }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFAudioDecoderDegradationInfo {
    #StructPack 4

    eDegradationReason : MFT_AUDIO_DECODER_DEGRADATION_REASON

    eType : MFT_AUDIO_DECODER_DEGRADATION_TYPE

}

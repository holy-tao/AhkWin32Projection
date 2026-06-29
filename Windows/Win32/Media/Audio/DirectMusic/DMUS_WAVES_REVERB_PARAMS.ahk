#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_WAVES_REVERB_PARAMS {
    #StructPack 4

    fInGain : Float32

    fReverbMix : Float32

    fReverbTime : Float32

    fHighFreqRTRatio : Float32

}

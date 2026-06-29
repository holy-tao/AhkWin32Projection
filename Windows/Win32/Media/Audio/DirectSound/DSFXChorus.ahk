#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSFXChorus {
    #StructPack 4

    fWetDryMix : Float32

    fDepth : Float32

    fFeedback : Float32

    fFrequency : Float32

    lWaveform : Int32

    fDelay : Float32

    lPhase : Int32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSFXDistortion {
    #StructPack 4

    fGain : Float32

    fEdge : Float32

    fPostEQCenterFrequency : Float32

    fPostEQBandwidth : Float32

    fPreLowpassCutoff : Float32

}

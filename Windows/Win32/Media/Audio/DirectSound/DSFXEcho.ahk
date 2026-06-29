#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSFXEcho {
    #StructPack 4

    fWetDryMix : Float32

    fFeedback : Float32

    fLeftDelay : Float32

    fRightDelay : Float32

    lPanDelay : Int32

}

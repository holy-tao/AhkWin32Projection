#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSFXCompressor {
    #StructPack 4

    fGain : Float32

    fAttack : Float32

    fRelease : Float32

    fThreshold : Float32

    fRatio : Float32

    fPredelay : Float32

}

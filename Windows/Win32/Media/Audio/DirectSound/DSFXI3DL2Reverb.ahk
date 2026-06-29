#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSFXI3DL2Reverb {
    #StructPack 4

    lRoom : Int32

    lRoomHF : Int32

    flRoomRolloffFactor : Float32

    flDecayTime : Float32

    flDecayHFRatio : Float32

    lReflections : Int32

    flReflectionsDelay : Float32

    lReverb : Int32

    flReverbDelay : Float32

    flDiffusion : Float32

    flDensity : Float32

    flHFReference : Float32

}

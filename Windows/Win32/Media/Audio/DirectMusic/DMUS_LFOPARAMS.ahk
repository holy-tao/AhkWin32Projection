#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_LFOPARAMS {
    #StructPack 4

    pcFrequency : Int32

    tcDelay : Int32

    gcVolumeScale : Int32

    pcPitchScale : Int32

    gcMWToVolume : Int32

    pcMWToPitch : Int32

}

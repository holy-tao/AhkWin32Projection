#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WAVEFILTER.ahk" { WAVEFILTER }

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct VOLUMEWAVEFILTER {
    #StructPack 4

    wfltr : WAVEFILTER

    dwVolume : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIDILOCALE.ahk" { MIDILOCALE }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct INSTHEADER {
    #StructPack 4

    cRegions : UInt32

    Locale : MIDILOCALE

}

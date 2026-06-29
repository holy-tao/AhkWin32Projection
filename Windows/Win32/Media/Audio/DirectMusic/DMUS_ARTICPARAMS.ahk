#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMUS_VEGPARAMS.ahk" { DMUS_VEGPARAMS }
#Import ".\DMUS_PEGPARAMS.ahk" { DMUS_PEGPARAMS }
#Import ".\DMUS_MSCPARAMS.ahk" { DMUS_MSCPARAMS }
#Import ".\DMUS_LFOPARAMS.ahk" { DMUS_LFOPARAMS }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DMUS_ARTICPARAMS {
    #StructPack 4

    LFO : DMUS_LFOPARAMS

    VolEG : DMUS_VEGPARAMS

    PitchEG : DMUS_PEGPARAMS

    Misc : DMUS_MSCPARAMS

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\ADPCMCOEFSET.ahk" { ADPCMCOEFSET }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ADPCMWAVEFORMAT {
    #StructPack 4

    wfx : WAVEFORMATEX

    wSamplesPerBlock : UInt16

    wNumCoef : UInt16

    aCoef : ADPCMCOEFSET[1]

}

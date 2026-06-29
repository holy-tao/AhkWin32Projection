#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct TRUESPEECHWAVEFORMAT {
    #StructPack 4

    wfx : WAVEFORMATEX

    wRevision : UInt16

    nSamplesPerBlock : UInt16

    abReserved : Int8[28]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct WMAUDIO3WAVEFORMAT {
    #StructPack 4

    wfx : WAVEFORMATEX

    wValidBitsPerSample : UInt16

    dwChannelMask : UInt32

    dwReserved1 : UInt32

    dwReserved2 : UInt32

    wEncodeOptions : UInt16

    wReserved3 : UInt16

}

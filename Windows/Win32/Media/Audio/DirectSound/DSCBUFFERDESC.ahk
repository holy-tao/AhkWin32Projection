#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\WAVEFORMATEX.ahk" { WAVEFORMATEX }
#Import ".\DSCEFFECTDESC.ahk" { DSCEFFECTDESC }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSCBUFFERDESC {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dwBufferBytes : UInt32

    dwReserved : UInt32

    lpwfxFormat : WAVEFORMATEX.Ptr

    dwFXCount : UInt32

    lpDSCFXDesc : DSCEFFECTDESC.Ptr

}

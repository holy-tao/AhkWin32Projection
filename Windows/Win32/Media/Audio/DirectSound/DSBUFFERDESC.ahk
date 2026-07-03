#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\WAVEFORMATEX.ahk" { WAVEFORMATEX }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSBUFFERDESC {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    dwBufferBytes : UInt32

    dwReserved : UInt32

    lpwfxFormat : WAVEFORMATEX.Ptr

    guid3DAlgorithm : Guid

}

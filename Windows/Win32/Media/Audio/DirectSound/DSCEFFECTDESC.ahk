#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSCEFFECTDESC {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    guidDSCFXClass : Guid

    guidDSCFXInstance : Guid

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSEFFECTDESC {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    guidDSFXClass : Guid

    dwReserved1 : IntPtr

    dwReserved2 : IntPtr

}

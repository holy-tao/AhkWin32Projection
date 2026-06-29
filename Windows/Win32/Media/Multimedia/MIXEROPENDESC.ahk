#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Audio\HMIXER.ahk" { HMIXER }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct MIXEROPENDESC {
    #StructPack 8

    hmx : HMIXER

    pReserved0 : IntPtr

    dwCallback : IntPtr

    dwInstance : IntPtr

    dnDevNode : IntPtr

}

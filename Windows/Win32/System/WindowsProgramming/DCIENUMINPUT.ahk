#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DCICMD.ahk" { DCICMD }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DCIENUMINPUT {
    #StructPack 8

    cmd : DCICMD

    rSrc : RECT

    rDst : RECT

    EnumCallback : IntPtr

    lpContext : IntPtr

}

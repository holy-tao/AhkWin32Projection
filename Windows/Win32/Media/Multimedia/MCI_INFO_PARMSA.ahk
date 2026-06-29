#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset ANSI
 */
export default struct MCI_INFO_PARMSA {
    #StructPack 8

    dwCallback : IntPtr

    lpstrReturn : PSTR

    dwRetSize : UInt32

}

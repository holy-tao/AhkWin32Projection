#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_VD_ESCAPE_PARMSW {
    #StructPack 8

    dwCallback : IntPtr

    lpstrCommand : PWSTR

}

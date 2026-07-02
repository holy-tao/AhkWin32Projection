#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @charset Unicode
 */
export default struct MCI_OVLY_LOAD_PARMSW {
    #StructPack 8

    dwCallback : IntPtr

    lpfilename : PWSTR

    rc : RECT

}

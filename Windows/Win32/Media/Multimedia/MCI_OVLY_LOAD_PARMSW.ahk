#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\RECT.ahk" { RECT }

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

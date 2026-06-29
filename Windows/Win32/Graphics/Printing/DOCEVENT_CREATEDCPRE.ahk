#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Gdi\DEVMODEW.ahk" { DEVMODEW }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DOCEVENT_CREATEDCPRE {
    #StructPack 8

    pszDriver : PWSTR

    pszDevice : PWSTR

    pdm : DEVMODEW.Ptr

    bIC : BOOL

}

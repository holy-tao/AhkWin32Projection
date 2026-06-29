#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DEVQUERYPRINT_INFO {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Level : UInt16

    hPrinter : HANDLE

    pDevMode : DEVMODEA.Ptr

    pszErrorStr : PWSTR

    cchErrorStr : UInt32

    cchNeeded : UInt32

}

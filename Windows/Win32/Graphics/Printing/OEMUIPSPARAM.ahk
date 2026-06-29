#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OEMUIOBJ.ahk" { OEMUIOBJ }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEMUIPSPARAM {
    #StructPack 8

    cbSize : UInt32 := this.Size

    poemuiobj : OEMUIOBJ.Ptr

    hPrinter : HANDLE

    pPrinterName : PWSTR

    hModule : HANDLE

    hOEMHeap : HANDLE

    pPublicDM : DEVMODEA.Ptr

    pOEMDM : IntPtr

    pOEMUserData : IntPtr

    dwFlags : UInt32

    pOemEntry : IntPtr

}

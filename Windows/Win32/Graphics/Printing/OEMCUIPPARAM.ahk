#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OEMUIOBJ.ahk" { OEMUIOBJ }
#Import ".\OPTITEM.ahk" { OPTITEM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEMCUIPPARAM {
    #StructPack 8

    cbSize : UInt32 := this.Size

    poemuiobj : OEMUIOBJ.Ptr

    hPrinter : HANDLE

    pPrinterName : PWSTR

    hModule : HANDLE

    hOEMHeap : HANDLE

    pPublicDM : DEVMODEA.Ptr

    pOEMDM : IntPtr

    dwFlags : UInt32

    pDrvOptItems : OPTITEM.Ptr

    cDrvOptItems : UInt32

    pOEMOptItems : OPTITEM.Ptr

    cOEMOptItems : UInt32

    pOEMUserData : IntPtr

    OEMCUIPCallback : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Gdi\DEVMODEA.ahk" { DEVMODEA }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DOCUMENTPROPERTYHEADER {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Reserved : UInt16

    hPrinter : HANDLE

    pszPrinterName : IntPtr

    pdmIn : DEVMODEA.Ptr

    pdmOut : DEVMODEA.Ptr

    cbOut : UInt32

    fMode : UInt32

}

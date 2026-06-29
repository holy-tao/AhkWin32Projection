#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DEVICEPROPERTYHEADER {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : UInt16

    hPrinter : HANDLE

    pszPrinterName : IntPtr

}

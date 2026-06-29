#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OEMFONTINSTPARAM {
    #StructPack 8

    cbSize : UInt32 := this.Size

    hPrinter : HANDLE

    hModule : HANDLE

    hHeap : HANDLE

    dwFlags : UInt32

    pFontInstallerName : PWSTR

}

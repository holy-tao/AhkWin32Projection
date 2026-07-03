#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PSPINFO {
    #StructPack 8

    cbSize : UInt16 := this.Size

    wReserved : UInt16

    hComPropSheet : HANDLE

    hCPSUIPage : HANDLE

    pfnComPropSheet : IntPtr

}

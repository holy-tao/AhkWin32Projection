#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PROPSHEETUI_INFO {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Version : UInt16

    Flags : UInt16

    Reason : UInt16

    hComPropSheet : HANDLE

    pfnComPropSheet : IntPtr

    lParamInit : LPARAM

    UserData : IntPtr

    Result : IntPtr

}

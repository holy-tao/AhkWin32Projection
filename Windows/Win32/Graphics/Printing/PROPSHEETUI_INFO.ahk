#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

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

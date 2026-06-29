#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct OPTPARAM {
    #StructPack 8

    cbSize : UInt16 := this.Size

    Flags : Int8

    Style : Int8

    pData : IntPtr

    IconID : IntPtr

    lParam : LPARAM

    dwReserved : IntPtr[2]

}

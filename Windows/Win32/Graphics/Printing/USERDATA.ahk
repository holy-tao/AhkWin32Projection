#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct USERDATA {
    #StructPack 8

    dwSize : UInt32

    dwItemID : IntPtr

    pKeyWordName : PSTR

    dwReserved : UInt32[8]

}

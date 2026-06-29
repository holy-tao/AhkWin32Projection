#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct DELETE_PORT_DATA_1 {
    #StructPack 4

    psztPortName : WCHAR[64]

    Reserved : Int8[98]

    dwVersion : UInt32

    dwReserved : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PORT_DATA_2.ahk" { PORT_DATA_2 }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PORT_DATA_LIST_1 {
    #StructPack 4

    dwVersion : UInt32

    cPortData : UInt32

    pPortData : PORT_DATA_2[1]

}

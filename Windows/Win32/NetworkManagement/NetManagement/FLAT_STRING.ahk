#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct FLAT_STRING {
    #StructPack 2

    MaximumLength : Int16

    Length : Int16

    Buffer : CHAR[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_DEBUG_MISC {
    #StructPack 4

    DataType : UInt32

    Length : UInt32

    Unicode : BOOLEAN

    Reserved : Int8[3]

    Data : Int8[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_RESOURCE_DIRECTORY_STRING {
    #StructPack 2

    Length : UInt16

    NameString : CHAR[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_RESOURCE_DIR_STRING_U {
    #StructPack 2

    Length : UInt16

    NameString : WCHAR[1]

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_REMOVE_HARDLINK_BACKPOINTER {
    #StructPack 8

    ParentDirectory : Int64

    Reserved : Int64

    FileName : WCHAR[1]

}

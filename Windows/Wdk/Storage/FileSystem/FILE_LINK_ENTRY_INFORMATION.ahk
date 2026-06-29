#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_LINK_ENTRY_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    ParentFileId : Int64

    FileNameLength : UInt32

    FileName : WCHAR[1]

}

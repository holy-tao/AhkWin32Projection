#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_NAMES_INFORMATION {
    #StructPack 4

    NextEntryOffset : UInt32

    FileIndex : UInt32

    FileNameLength : UInt32

    FileName : WCHAR[1]

}

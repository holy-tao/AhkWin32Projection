#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_FULL_DIR_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    FileIndex : UInt32

    CreationTime : Int64

    LastAccessTime : Int64

    LastWriteTime : Int64

    ChangeTime : Int64

    EndOfFile : Int64

    AllocationSize : Int64

    FileAttributes : UInt32

    FileNameLength : UInt32

    EaSize : UInt32

    FileName : WCHAR[1]

}

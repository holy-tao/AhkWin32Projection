#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_STREAM_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    StreamNameLength : UInt32

    StreamSize : Int64

    StreamAllocationSize : Int64

    StreamName : WCHAR[1]

}

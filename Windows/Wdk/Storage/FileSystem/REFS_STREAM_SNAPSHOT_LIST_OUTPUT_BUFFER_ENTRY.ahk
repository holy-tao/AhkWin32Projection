#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_STREAM_SNAPSHOT_LIST_OUTPUT_BUFFER_ENTRY {
    #StructPack 8

    NextEntryOffset : UInt32

    SnapshotNameLength : UInt16

    SnapshotCreationTime : Int64

    StreamSize : Int64

    StreamAllocationSize : Int64

    Reserved : Int64[2]

    SnapshotName : WCHAR[1]

}

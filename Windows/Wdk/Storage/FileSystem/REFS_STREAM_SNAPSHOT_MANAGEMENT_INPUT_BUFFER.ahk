#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\REFS_STREAM_SNAPSHOT_OPERATION.ahk" { REFS_STREAM_SNAPSHOT_OPERATION }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_STREAM_SNAPSHOT_MANAGEMENT_INPUT_BUFFER {
    #StructPack 8

    Operation : REFS_STREAM_SNAPSHOT_OPERATION

    SnapshotNameLength : UInt16

    OperationInputBufferLength : UInt16

    Reserved : Int64[2]

    NameAndInputBuffer : UInt16[1]

}

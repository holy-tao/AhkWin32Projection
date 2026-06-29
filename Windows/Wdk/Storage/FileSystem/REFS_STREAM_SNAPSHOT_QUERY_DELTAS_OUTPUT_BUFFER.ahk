#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_STREAM_SNAPSHOT_QUERY_DELTAS_OUTPUT_BUFFER {
    #StructPack 8

    ExtentCount : UInt32

    Reserved : UInt32[2]

    Extents : IntPtr[1]

}

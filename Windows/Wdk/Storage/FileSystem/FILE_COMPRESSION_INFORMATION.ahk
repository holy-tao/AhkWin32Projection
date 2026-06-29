#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_COMPRESSION_INFORMATION {
    #StructPack 8

    CompressedFileSize : Int64

    CompressionFormat : UInt16

    CompressionUnitShift : Int8

    ChunkShift : Int8

    ClusterShift : Int8

    Reserved : Int8[3]

}

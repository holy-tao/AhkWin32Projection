#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct COMPRESSED_DATA_INFO {
    #StructPack 4

    CompressionFormatAndEngine : UInt16

    CompressionUnitShift : Int8

    ChunkShift : Int8

    ClusterShift : Int8

    Reserved : Int8

    NumberOfChunks : UInt16

    CompressedChunkSizes : UInt32[1]

}

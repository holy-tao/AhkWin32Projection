#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DEDUP_CHUNK_INFO_HASH32 {
    #StructPack 8

    ChunkFlags : UInt32

    ChunkOffsetInStream : Int64

    ChunkSize : Int64

    HashVal : Int8[32]

}

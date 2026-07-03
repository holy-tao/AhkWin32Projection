#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DedupChunkFlags.ahk" { DedupChunkFlags }
#Import ".\DedupHash.ahk" { DedupHash }

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DedupChunk {
    #StructPack 4

    Hash : DedupHash

    Flags : DedupChunkFlags

    LogicalSize : UInt32

    DataSize : UInt32

}

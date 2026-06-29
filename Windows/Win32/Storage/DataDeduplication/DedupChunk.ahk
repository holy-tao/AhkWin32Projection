#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DedupHash.ahk" { DedupHash }
#Import ".\DedupChunkFlags.ahk" { DedupChunkFlags }

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

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DedupHash.ahk" { DedupHash }

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DedupStreamEntry {
    #StructPack 8

    Hash : DedupHash

    LogicalSize : UInt32

    Offset : Int64

}

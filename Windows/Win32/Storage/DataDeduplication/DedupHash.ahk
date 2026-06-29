#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 */
export default struct DedupHash {
    #StructPack 1

    Hash : Int8[32]

}

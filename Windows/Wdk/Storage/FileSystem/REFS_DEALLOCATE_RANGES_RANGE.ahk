#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct REFS_DEALLOCATE_RANGES_RANGE {
    #StructPack 8

    StartOfRange : Int64

    CountOfRange : Int64

}

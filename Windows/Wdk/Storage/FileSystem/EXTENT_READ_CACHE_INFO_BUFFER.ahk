#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct EXTENT_READ_CACHE_INFO_BUFFER {
    #StructPack 8

    AllocatedCache : Int64

    PopulatedCache : Int64

    InErrorCache : Int64

}

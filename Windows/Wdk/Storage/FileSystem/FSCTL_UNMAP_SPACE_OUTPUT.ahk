#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSCTL_UNMAP_SPACE_OUTPUT {
    #StructPack 8

    BytesUnmapped : Int64

}

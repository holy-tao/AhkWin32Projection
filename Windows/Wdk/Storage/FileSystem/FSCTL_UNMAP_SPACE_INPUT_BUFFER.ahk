#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FSCTL_UNMAP_SPACE_INPUT_BUFFER {
    #StructPack 8

    BytesToUnmap : Int64

}

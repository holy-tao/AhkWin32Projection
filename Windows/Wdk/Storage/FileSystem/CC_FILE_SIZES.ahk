#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CC_FILE_SIZES {
    #StructPack 8

    AllocationSize : Int64

    FileSize : Int64

    ValidDataLength : Int64

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_REMOTE_INFORMATION {
    #StructPack 8

    CollectDataTime : Int64

    MaximumCollectionCount : UInt32

}

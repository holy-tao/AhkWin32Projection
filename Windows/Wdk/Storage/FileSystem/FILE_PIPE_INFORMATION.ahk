#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_INFORMATION {
    #StructPack 4

    ReadMode : UInt32

    CompletionMode : UInt32

}

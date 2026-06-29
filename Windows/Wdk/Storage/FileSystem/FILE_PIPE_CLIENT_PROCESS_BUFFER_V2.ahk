#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_CLIENT_PROCESS_BUFFER_V2 {
    #StructPack 8

    ClientSession : Int64

    ClientProcess : IntPtr

}

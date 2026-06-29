#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CSV_SET_HANDLE_PROPERTIES_ECP_CONTEXT {
    #StructPack 8

    Size : IntPtr

    PauseTimeoutInSeconds : UInt32

    Flags : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_ALLOCATE_BC_STREAM_OUTPUT {
    #StructPack 8

    RequestSize : Int64

    NumOutStandingRequests : UInt32

}

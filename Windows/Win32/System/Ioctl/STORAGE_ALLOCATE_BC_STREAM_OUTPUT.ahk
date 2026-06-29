#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ALLOCATE_BC_STREAM_OUTPUT {
    #StructPack 8

    RequestSize : Int64

    NumOutStandingRequests : UInt32

}

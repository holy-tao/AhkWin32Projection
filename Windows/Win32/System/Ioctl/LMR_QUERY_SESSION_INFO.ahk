#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct LMR_QUERY_SESSION_INFO {
    #StructPack 8

    SessionId : Int64

}

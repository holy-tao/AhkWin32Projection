#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_CONTEXT {
    #StructPack 8

    cbSize : UInt32 := this.Size

    Revision : UInt32

    ServerContext : IntPtr

    ulReserved : UInt32

    fIsSecurePort : BOOL

    pFilterContext : IntPtr

    GetServerVariable : IntPtr

    AddResponseHeaders : IntPtr

    WriteClient : IntPtr

    AllocMem : IntPtr

    ServerSupportFunction : IntPtr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the maximum number of concurrent connections that the shared resource can accommodate.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1006
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_1006 {
    #StructPack 4

    /**
     * Specifies a DWORD value that indicates the maximum number of concurrent connections that the shared resource can accommodate. The number of connections is unlimited if the value specified in this member is –1.
     */
    shi1006_max_uses : UInt32

}

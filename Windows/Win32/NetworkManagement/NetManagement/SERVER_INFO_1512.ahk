#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1512 structure contains the maximum size of nonpaged memory that the specified server can allocate at a particular time.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1512
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1512 {
    #StructPack 4

    /**
     * Specifies the maximum size of nonpaged memory that the server can allocate at any one time. Adjust this member if you want to administer memory quota control.
     */
    sv1512_maxnonpagedmemoryusage : UInt32

}

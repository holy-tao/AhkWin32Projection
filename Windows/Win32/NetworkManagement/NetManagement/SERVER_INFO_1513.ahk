#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1513 structure contains the maximum size of pageable memory that the specified server can allocate at a particular time.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1513
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1513 {
    #StructPack 4

    /**
     * Specifies the maximum size of pageable memory that the server allocates at any particular time. Adjust this member if you want to administer memory quota control.
     */
    sv1513_maxpagedmemoryusage : UInt32

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1506 structure contains information about the maximum number of work items the specified server can allocate.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1506
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1506 {
    #StructPack 4

    /**
     * Specifies the maximum number of receive buffers, or work items, the server can allocate. If this limit is reached, the transport protocol must initiate flow control at a significant cost to performance.
     */
    sv1506_maxworkitems : UInt32

}

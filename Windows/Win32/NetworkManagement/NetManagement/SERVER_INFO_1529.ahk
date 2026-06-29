#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SERVER_INFO_1529 structure specifies the minimum number of free receive work items the server requires before it begins allocating more items.
 * @see https://learn.microsoft.com/windows/win32/api/lmserver/ns-lmserver-server_info_1529
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct SERVER_INFO_1529 {
    #StructPack 4

    /**
     * Specifies the minimum number of free receive work items the server requires before it begins allocating more. A larger value for this member helps ensure that there will always be work items available, but a value that is too large is inefficient.
     */
    sv1529_minrcvqueue : UInt32

}

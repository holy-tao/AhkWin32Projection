#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MCAST_CLIENT_UID structure describes the unique client identifier for each multicast request.
 * @see https://learn.microsoft.com/windows/win32/api/madcapcl/ns-madcapcl-mcast_client_uid
 * @namespace Windows.Win32.NetworkManagement.Multicast
 */
export default struct MCAST_CLIENT_UID {
    #StructPack 8

    /**
     * Buffer containing the unique client identifier.
     */
    ClientUID : IntPtr

    /**
     * Size of the <b>ClientUID</b> member, in bytes.
     */
    ClientUIDLength : UInt32

}

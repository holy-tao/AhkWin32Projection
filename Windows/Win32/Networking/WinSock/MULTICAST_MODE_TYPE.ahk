#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the filter mode for multicast group addresses.
 * @remarks
 * 
 * This enumeration is supported on Windows Vistaand later.
 * 
 * The <b>MULTICAST_MODE_TYPE</b> enumeration is used in the <b>gf_fmode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-group_source_req">GROUP_SOURCE_REQ</a> structure to determine if a list of IP addresses should included or excluded. The values from this enumeration can also be used in the <b>imsf_fmode</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ws2ipdef/ns-ws2ipdef-ip_msfilter">ip_msfilter</a> structure.
 * 
 * The <b>MULTICAST_MODE_TYPE</b> enumeration is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2ipdef/ne-ws2ipdef-multicast_mode_type
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class MULTICAST_MODE_TYPE{

    /**
     * The filter contains a list of IP addresses to include.
     * @type {Integer (Int32)}
     */
    static MCAST_INCLUDE => 0

    /**
     * The filter contains a list of IP addresses to exclude.
     * @type {Integer (Int32)}
     */
    static MCAST_EXCLUDE => 1
}

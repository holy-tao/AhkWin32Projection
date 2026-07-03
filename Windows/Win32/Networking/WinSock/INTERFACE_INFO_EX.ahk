#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR.ahk" { SOCKADDR }
#Import ".\SOCKET_ADDRESS.ahk" { SOCKET_ADDRESS }

/**
 * The INTERFACE_INFO_EX structure is used in conjunction with the SIO_GET_INTERFACE_LIST IOCTL command to obtain information about an interface IP address.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>INTERFACE_INFO_EX</b> structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-interface_info_ex
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct INTERFACE_INFO_EX {
    #StructPack 8

    /**
     * Bitmask describing the status of the interface. The following flags are possible.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFF_UP"></a><a id="iff_up"></a><dl>
     * <dt><b>IFF_UP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFF_BROADCAST"></a><a id="iff_broadcast"></a><dl>
     * <dt><b>IFF_BROADCAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The broadcast feature is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFF_LOOPBACK"></a><a id="iff_loopback"></a><dl>
     * <dt><b>IFF_LOOPBACK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The loopback interface is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFF_POINTTOPOINT"></a><a id="iff_pointtopoint"></a><dl>
     * <dt><b>IFF_POINTTOPOINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The interface is using point-to-point link.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFF_MULTICAST"></a><a id="iff_multicast"></a><dl>
     * <dt><b>IFF_MULTICAST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The multicast feature is supported.
     * 
     * </td>
     * </tr>
     * </table>
     */
    iiFlags : UInt32

    /**
     * Address of an interface.
     */
    iiAddress : SOCKET_ADDRESS

    /**
     * Broadcast address of the interface or the address of the other side for point-to-point links.
     */
    iiBroadcastAddress : SOCKET_ADDRESS

    /**
     * Netmask used by the interface.
     */
    iiNetmask : SOCKET_ADDRESS

}

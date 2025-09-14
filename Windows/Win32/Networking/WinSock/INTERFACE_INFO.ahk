#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKADDR.ahk
#Include .\IN_ADDR.ahk
#Include .\SOCKADDR_IN.ahk
#Include .\IN6_ADDR.ahk
#Include .\sockaddr_in6_old.ahk
#Include .\sockaddr_gen.ahk

/**
 * The INTERFACE_INFO structure is used in conjunction with the SIO_GET_INTERFACE_LIST ioctl command to obtain information about an interface IP address.
 * @remarks
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>INTERFACE_INFO</b> structure is defined in the <i>Ws2ipdef.h</i> header file which is automatically included in the <i>Ws2tcpip.h</i> header file. The <i>Ws2ipdef.h</i>  header files should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ws2ipdef/ns-ws2ipdef-interface_info
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class INTERFACE_INFO extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * A bitmask describing the status of the interface. The following flags are possible.
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
     * @type {Integer}
     */
    iiFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of an interface.
     * @type {sockaddr_gen}
     */
    iiAddress{
        get {
            if(!this.HasProp("__iiAddress"))
                this.__iiAddress := sockaddr_gen(this.ptr + 8)
            return this.__iiAddress
        }
    }

    /**
     * Broadcast address of the interface or the address of the other side for point-to-point links.
     * @type {sockaddr_gen}
     */
    iiBroadcastAddress{
        get {
            if(!this.HasProp("__iiBroadcastAddress"))
                this.__iiBroadcastAddress := sockaddr_gen(this.ptr + 64)
            return this.__iiBroadcastAddress
        }
    }

    /**
     * Netmask used by the interface.
     * @type {sockaddr_gen}
     */
    iiNetmask{
        get {
            if(!this.HasProp("__iiNetmask"))
                this.__iiNetmask := sockaddr_gen(this.ptr + 120)
            return this.__iiNetmask
        }
    }
}

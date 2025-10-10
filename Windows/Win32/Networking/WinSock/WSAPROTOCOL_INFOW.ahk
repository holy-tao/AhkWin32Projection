#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSAPROTOCOLCHAIN.ahk

/**
 * Used to store or retrieve complete information for a given protocol.
 * @remarks
 * 
  * > [!NOTE]
  * > The winsock2.h header defines WSAPROTOCOL_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-wsaprotocol_infow
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 * @charset Unicode
 */
class WSAPROTOCOL_INFOW extends Win32Struct
{
    static sizeof => 632

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A bitmask that describes the services provided by the protocol. The possible values for this member are defined in the <i>Winsock2.h</i> header file. 
     * 
     * The following values are possible.  
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_CONNECTIONLESS"></a><a id="xp1_connectionless"></a><dl>
     * <dt><b>XP1_CONNECTIONLESS</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Provides connectionless (datagram) service. If not set, the protocol supports connection-oriented data transfer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_GUARANTEED_DELIVERY"></a><a id="xp1_guaranteed_delivery"></a><dl>
     * <dt><b>XP1_GUARANTEED_DELIVERY</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Guarantees that all data sent will reach the intended destination.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_GUARANTEED_ORDER"></a><a id="xp1_guaranteed_order"></a><dl>
     * <dt><b>XP1_GUARANTEED_ORDER</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Guarantees that data only arrives in the order in which it was sent and that it is not duplicated. This characteristic does not necessarily mean that the data is always delivered, but that any data that is delivered is delivered in the order in which it was sent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_MESSAGE_ORIENTED"></a><a id="xp1_message_oriented"></a><dl>
     * <dt><b>XP1_MESSAGE_ORIENTED</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Honors message boundaries—as opposed to a stream-oriented protocol where there is no concept of message boundaries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_PSEUDO_STREAM"></a><a id="xp1_pseudo_stream"></a><dl>
     * <dt><b>XP1_PSEUDO_STREAM</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A message-oriented protocol, but message boundaries are ignored for all receipts. This is convenient when an application does not desire message framing to be done by the protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_GRACEFUL_CLOSE"></a><a id="xp1_graceful_close"></a><dl>
     * <dt><b>XP1_GRACEFUL_CLOSE</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports two-phase (graceful) close. If not set, only abortive closes are performed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_EXPEDITED_DATA"></a><a id="xp1_expedited_data"></a><dl>
     * <dt><b>XP1_EXPEDITED_DATA</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports expedited (urgent) data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_CONNECT_DATA"></a><a id="xp1_connect_data"></a><dl>
     * <dt><b>XP1_CONNECT_DATA</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports connect data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_DISCONNECT_DATA"></a><a id="xp1_disconnect_data"></a><dl>
     * <dt><b>XP1_DISCONNECT_DATA</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports disconnect data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_SUPPORT_BROADCAST"></a><a id="xp1_support_broadcast"></a><dl>
     * <dt><b>XP1_SUPPORT_BROADCAST</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports a broadcast mechanism.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_SUPPORT_MULTIPOINT"></a><a id="xp1_support_multipoint"></a><dl>
     * <dt><b>XP1_SUPPORT_MULTIPOINT</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports a multipoint or multicast mechanism. Control and data plane attributes are indicated below.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_MULTIPOINT_CONTROL_PLANE"></a><a id="xp1_multipoint_control_plane"></a><dl>
     * <dt><b>XP1_MULTIPOINT_CONTROL_PLANE</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates whether the control plane is rooted (value = 1) or nonrooted (value = 0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_MULTIPOINT_DATA_PLANE"></a><a id="xp1_multipoint_data_plane"></a><dl>
     * <dt><b>XP1_MULTIPOINT_DATA_PLANE</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates whether the data plane is rooted (value = 1) or nonrooted (value = 0).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_QOS_SUPPORTED"></a><a id="xp1_qos_supported"></a><dl>
     * <dt><b>XP1_QOS_SUPPORTED</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports quality of service requests.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_INTERRUPT"></a><a id="xp1_interrupt"></a><dl>
     * <dt><b>XP1_INTERRUPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bit is reserved.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_UNI_SEND"></a><a id="xp1_uni_send"></a><dl>
     * <dt><b>XP1_UNI_SEND</b></dt>
     * <dt>0x00008000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol is unidirectional in the send direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_UNI_RECV"></a><a id="xp1_uni_recv"></a><dl>
     * <dt><b>XP1_UNI_RECV</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protocol is unidirectional in the recv direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_IFS_HANDLES"></a><a id="xp1_ifs_handles"></a><dl>
     * <dt><b>XP1_IFS_HANDLES</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Socket descriptors returned by the provider are operating system Installable File System (IFS) handles.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_PARTIAL_MESSAGE"></a><a id="xp1_partial_message"></a><dl>
     * <dt><b>XP1_PARTIAL_MESSAGE</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MSG_PARTIAL flag is supported in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasend">WSASend</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasendto">WSASendTo</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="XP1_SAN_SUPPORT_SDP"></a><a id="xp1_san_support_sdp"></a><dl>
     * <dt><b>XP1_SAN_SUPPORT_SDP</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol provides support for SAN.
     * 
     * This value is supported on Windows 7 and Windows Server 2008 R2.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <div class="alert"><b>Note</b>  Only one of XP1_UNI_SEND or XP1_UNI_RECV values may be set. If a protocol can be unidirectional in either direction, two <b>WSAPROTOCOL_INFOW</b> structures should be used. When neither bit is set, the protocol is considered to be bidirectional.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwServiceFlags1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved for additional protocol-attribute definitions.
     * @type {Integer}
     */
    dwServiceFlags2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved for additional protocol-attribute definitions.
     * @type {Integer}
     */
    dwServiceFlags3 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved for additional protocol-attribute definitions.
     * @type {Integer}
     */
    dwServiceFlags4 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A set of flags that provides information on how this protocol is represented in the Winsock catalog. The possible values for this member are defined in the <i>Winsock2.h</i> header file. 
     * 
     * The following values are possible.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PFL_MULTIPLE_PROTO_ENTRIES"></a><a id="pfl_multiple_proto_entries"></a><dl>
     * <dt><b>PFL_MULTIPLE_PROTO_ENTRIES</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that this is one of two or more entries for a single protocol (from a given provider) which is capable of implementing multiple behaviors. An example of this is SPX which, on the receiving side, can behave either as a message-oriented or a stream-oriented protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PFL_RECOMMENDED_PROTO_ENTRY"></a><a id="pfl_recommended_proto_entry"></a><dl>
     * <dt><b>PFL_RECOMMENDED_PROTO_ENTRY</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that this is the recommended or most frequently used entry for a protocol that is capable of implementing multiple behaviors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PFL_HIDDEN"></a><a id="pfl_hidden"></a><dl>
     * <dt><b>PFL_HIDDEN</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by a provider to indicate to the Ws2_32.dll that this protocol should not be returned in the result buffer generated by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaenumprotocolsa">WSAEnumProtocols</a>. Obviously, a Windows Sockets 2 application should never see an entry with this bit set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PFL_MATCHES_PROTOCOL_ZERO"></a><a id="pfl_matches_protocol_zero"></a><dl>
     * <dt><b>PFL_MATCHES_PROTOCOL_ZERO</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a value of zero in the <i>protocol</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-socket">socket</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasocketa">WSASocket</a> matches this protocol entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PFL_NETWORKDIRECT_PROVIDER"></a><a id="pfl_networkdirect_provider"></a><dl>
     * <dt><b>PFL_NETWORKDIRECT_PROVIDER</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by a provider to indicate support for network direct access.
     * 
     * This value is supported on Windows 7 and Windows Server 2008 R2.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwProviderFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>GUID</b>
     * 
     * A globally unique identifier (GUID) assigned to the provider by the service provider vendor. This value is useful for instances where more than one service provider is able to implement a particular protocol. An application can use the <b>ProviderId</b> member to distinguish between providers that might otherwise be indistinguishable.
     * @type {Pointer<Guid>}
     */
    ProviderId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A unique identifier assigned by the WS2_32.DLL for each <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAPROTOCOL_INFO</a> structure.
     * @type {Integer}
     */
    dwCatalogEntryId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>WSAPROTOCOLCHAIN</b>
     * 
     * The 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaprotocolchain">WSAPROTOCOLCHAIN</a> structure associated with the protocol. If the length of the chain is 0, this <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/ns-winsock2-wsaprotocol_infoa">WSAPROTOCOL_INFO</a> entry represents a layered protocol which has Windows Sockets 2 SPI as both its top and bottom edges. If the length of the chain equals 1, this entry represents a base protocol whose Catalog Entry identifier is in the <b>dwCatalogEntryId</b> member of the <b>WSAPROTOCOL_INFO</b> structure. If the length of the chain is larger than 1, this entry represents a protocol chain which consists of one or more layered protocols on top of a base protocol. The corresponding Catalog Entry identifiers are in the ProtocolChain.ChainEntries array starting with the layered protocol at the top (the zero element in the ProtocolChain.ChainEntries array) and ending with the base protocol. Refer to the Windows Sockets 2 Service Provider Interface specification for more information on protocol chains.
     * @type {WSAPROTOCOLCHAIN}
     */
    ProtocolChain{
        get {
            if(!this.HasProp("__ProtocolChain"))
                this.__ProtocolChain := WSAPROTOCOLCHAIN(this.ptr + 40)
            return this.__ProtocolChain
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * The protocol version identifier.
     * @type {Integer}
     */
    iVersion {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * Type: <b>int</b>
     * 
     * A value to pass as the address family parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-socket">socket</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasocketa">WSASocket</a> function in order to open a socket for this protocol. This value also uniquely defines the structure of a protocol address for a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> used by the protocol.
     * 
     * On the Windows SDK released for Windows Vista and later, the possible values for the address family are defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * On versions of the Platform SDK for Windows Server 2003 and older, the possible values for the address family are defined in the <i>Winsock2.h</i> header file.
     * 
     * The values currently supported are AF_INET or AF_INET6, which are the Internet
     *                      address family formats for IPv4 and IPv6. Other options for address family (AF_NETBIOS for use with NetBIOS, for example) are supported if a Windows Sockets service provider for the address family is installed. Note that the values for the AF_ address family and PF_ protocol family constants  are identical (for example, <b>AF_INET</b> and <b>PF_INET</b>), so either constant can be used.
     * 
     * The table below lists common values for address family although many other values are possible. 
     * 
     * <table>
     * <tr>
     * <th>iAddressFamily</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET"></a><a id="af_inet"></a><dl>
     * <dt><b>AF_INET</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 4 (IPv4) address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_IPX"></a><a id="af_ipx"></a><dl>
     * <dt><b>AF_IPX</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPX/SPX address family. This address family is only supported if the NWLink IPX/SPX NetBIOS Compatible Transport protocol is installed. 
     * 
     * This address family is not supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_APPLETALK"></a><a id="af_appletalk"></a><dl>
     * <dt><b>AF_APPLETALK</b></dt>
     * <dt>16</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The AppleTalk address family. This address family is only supported if the AppleTalk protocol is installed. 
     * 
     * This address family is not supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_NETBIOS"></a><a id="af_netbios"></a><dl>
     * <dt><b>AF_NETBIOS</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NetBIOS address family. This address family is only supported if the Windows Sockets provider for NetBIOS is installed. 
     * 
     * The Windows Sockets provider for NetBIOS  is supported on 32-bit versions of Windows. This provider is installed by default on 32-bit versions of Windows. 
     * 
     * The Windows Sockets provider for NetBIOS is not supported on 64-bit versions of windows including Windows 7,  Windows Server 2008, Windows Vista, Windows Server 2003, or Windows XP.  
     * 
     * The Windows Sockets provider for NetBIOS  only supports sockets where the <i>type</i> parameter is set to <b>SOCK_DGRAM</b>.
     * 
     * The Windows Sockets provider for NetBIOS  is not directly related to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/netbios/portal">NetBIOS</a> programming interface. The NetBIOS programming interface is not supported on Windows Vista, Windows Server 2008, and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_INET6"></a><a id="af_inet6"></a><dl>
     * <dt><b>AF_INET6</b></dt>
     * <dt>23</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Protocol version 6 (IPv6) address family.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_IRDA"></a><a id="af_irda"></a><dl>
     * <dt><b>AF_IRDA</b></dt>
     * <dt>26</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Infrared Data Association (IrDA) address family. 
     * 
     * This address family is only supported if the computer has an infrared port and driver installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AF_BTH"></a><a id="af_bth"></a><dl>
     * <dt><b>AF_BTH</b></dt>
     * <dt>32</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Bluetooth address family. 
     * 
     * This address family is supported on Windows XP with SP2 or later if the computer has a Bluetooth adapter and driver installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    iAddressFamily {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * Type: <b>int</b>
     * 
     * The maximum address length, in bytes.
     * @type {Integer}
     */
    iMaxSockAddr {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * Type: <b>int</b>
     * 
     * The minimum address length, in bytes.
     * @type {Integer}
     */
    iMinSockAddr {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }

    /**
     * Type: <b>int</b>
     * 
     * A value to pass as the socket type parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-socket">socket</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasocketa">WSASocket</a> function in order to open a socket for this protocol. Possible values for the socket type are defined in the <i>Winsock2.h</i> header file.
     * 
     * The following table lists the possible values for the <b>iSocketType</b> member supported for Windows Sockets 2:
     * 
     * <table>
     * <tr>
     * <th>iSocketType</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_STREAM"></a><a id="sock_stream"></a><dl>
     * <dt><b>SOCK_STREAM</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A socket type that provides sequenced, reliable, two-way, connection-based byte streams with an OOB data transmission mechanism. This socket type uses the Transmission Control Protocol (TCP) for the Internet address family (AF_INET or AF_INET6).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_DGRAM"></a><a id="sock_dgram"></a><dl>
     * <dt><b>SOCK_DGRAM</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A socket type that supports datagrams, which are connectionless, unreliable buffers of a fixed (typically small) maximum length. This socket type uses the User Datagram Protocol (UDP) for the Internet address family (AF_INET or AF_INET6).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_RAW"></a><a id="sock_raw"></a><dl>
     * <dt><b>SOCK_RAW</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A socket type that provides a raw socket that allows an application to manipulate the next upper-layer protocol header. To manipulate the IPv4 header, the <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipproto-ip-socket-options">IP_HDRINCL</a> socket option must be set on the socket.  To manipulate the IPv6 header, the <a href="https://docs.microsoft.com/windows/desktop/WinSock/ipproto-ipv6-socket-options">IPV6_HDRINCL</a> socket option must be set on the socket.  
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_RDM"></a><a id="sock_rdm"></a><dl>
     * <dt><b>SOCK_RDM</b></dt>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A socket type that provides a reliable message datagram. An example of this type is the Pragmatic General Multicast (PGM) multicast protocol implementation in Windows, often referred to as <a href="https://docs.microsoft.com/windows/desktop/WinSock/reliable-multicast-programming--pgm-">reliable multicast programming</a>. 
     * 
     * This value is only supported if the Reliable Multicast Protocol is installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SOCK_SEQPACKET"></a><a id="sock_seqpacket"></a><dl>
     * <dt><b>SOCK_SEQPACKET</b></dt>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A socket type that provides a pseudo-stream packet based on datagrams. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    iSocketType {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Type: <b>int</b>
     * 
     * A value to pass as the <i>protocol</i> parameter to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-socket">socket</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasocketa">WSASocket</a> function in order to open a socket for this protocol. The possible options for the <b>iProtocol</b> member are specific to the address family and socket type specified. 
     * 
     * On the Windows SDK released for Windows Vista and later, this member can be one of the values from the <b>IPPROTO</b> enumeration type defined in the <i>Ws2def.h</i> header file. Note that the <i>Ws2def.h</i> header file is automatically included in <i>Winsock2.h</i>, and should never be used directly.
     * 
     * On versions of the Platform SDK for Windows Server 2003 and earlier, the possible values for the <b>iProtocol</b> member are defined in the <i>Winsock2.h</i> and <i>Wsrm.h</i> header files.
     * 
     * The table below lists common values for the <b>iProtocol</b> although many other values are possible. 
     * 
     * <table>
     * <tr>
     * <th>iProtocol</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_ICMP"></a><a id="ipproto_icmp"></a><dl>
     * <dt><b>IPPROTO_ICMP</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Control Message Protocol (ICMP). 
     * 
     * This value is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_IGMP"></a><a id="ipproto_igmp"></a><dl>
     * <dt><b>IPPROTO_IGMP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Group Management Protocol (IGMP). 
     * 
     * This  value is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BTHPROTO_RFCOMM"></a><a id="bthproto_rfcomm"></a><dl>
     * <dt><b>BTHPROTO_RFCOMM</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Bluetooth Radio Frequency Communications (Bluetooth RFCOMM) protocol.  
     * 
     * This value is supported on Windows XP with SP2 or later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_TCP"></a><a id="ipproto_tcp"></a><dl>
     * <dt><b>IPPROTO_TCP</b></dt>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Transmission Control Protocol (TCP). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_UDP"></a><a id="ipproto_udp"></a><dl>
     * <dt><b>IPPROTO_UDP</b></dt>
     * <dt>17</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The User Datagram Protocol (UDP). 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_ICMPV6"></a><a id="ipproto_icmpv6"></a><dl>
     * <dt><b>IPPROTO_ICMPV6</b></dt>
     * <dt>58</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet Control Message Protocol  Version 6 (ICMPv6). 
     * 
     * This  value is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPPROTO_RM"></a><a id="ipproto_rm"></a><dl>
     * <dt><b>IPPROTO_RM</b></dt>
     * <dt>113</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PGM protocol for reliable multicast. On the Windows SDK released for Windows Vista and later,  this protocol is also called <b>IPPROTO_PGM</b>. 
     * 
     * This value is only supported if the Reliable Multicast Protocol is installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    iProtocol {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * Type: <b>int</b>
     * 
     * The maximum value that may be added to <b>iProtocol</b> member when supplying a value for the <i>protocol</i> parameter to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-socket">socket</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsasocketa">WSASocket</a>. Not all protocols allow a range of values. When this is the case <b>iProtocolMaxOffset</b> is zero.
     * @type {Integer}
     */
    iProtocolMaxOffset {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * Type: <b>int</b>
     * 
     * Currently these values are manifest constants (BIGENDIAN and LITTLEENDIAN) that indicate either big-endian or little-endian with the values 0 and 1 respectively.
     * @type {Integer}
     */
    iNetworkByteOrder {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * Type: <b>int</b>
     * 
     * The type of security scheme employed (if any). A value of SECURITY_PROTOCOL_NONE (0) is used for protocols that do not incorporate security provisions.
     * @type {Integer}
     */
    iSecurityScheme {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The maximum message size, in bytes, supported by the protocol. This is the maximum size that can be sent from any of the host's local interfaces. For protocols that do not support message framing, the actual maximum that can be sent to a given address may be less. There is no standard provision to determine the maximum inbound message size. The following special values are defined. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol is stream-oriented and hence the concept of message size is not relevant.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The maximum outbound (send) message size is dependent on the underlying network MTU (maximum sized transmission unit) and hence cannot be known until after a socket is bound. Applications should use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> to retrieve the value of SO_MAX_MSG_SIZE after the socket has been bound to a local address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The protocol is message-oriented, but there is no maximum limit to the size of messages that may be transmitted.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwMessageSize {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Reserved for use by service providers.
     * @type {Integer}
     */
    dwProviderReserved {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Type: <b>WCHAR[WSAPROTOCOL_LEN+1]</b>
     * 
     * An array of Unicode characters that contains a human-readable name identifying the protocol, for example "MSAFD Tcpip [UDP/IP]". The maximum number of characters allowed is WSAPROTOCOL_LEN, which is defined to be 255.
     * @type {String}
     */
    szProtocol {
        get => StrGet(this.ptr + 116, 255, "UTF-16")
        set => StrPut(value, this.ptr + 116, 255, "UTF-16")
    }
}

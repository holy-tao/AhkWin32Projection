#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk

/**
 * Contains data for a router demand-dial interface.
 * @remarks
 * 
  * The 
  * <b>MPR_INTERFACE_3</b> structure has a number of members that are similar to members of the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure. 
  * 
  * The following members from the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure have no counterpart in 
  * <b>MPR_INTERFACE_3</b>:
  * 
  * <ul>
  * <li><b>dwCountryID</b></li>
  * <li><b>dwCountryCode</b></li>
  * <li><b>szAreaCode</b></li>
  * <li><b>dwFramingProtocol</b></li>
  * </ul>
  * <b>64-bit Windows:  </b>Does not support the IPX protocol.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_interface_3
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_INTERFACE_3 extends Win32Struct
{
    static sizeof => 2528

    static packingSize => 8

    /**
     * A pointer to a Unicode string that contains the name of the interface.
     * @type {String}
     */
    wszInterfaceName {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * A handle to the interface.
     * @type {HANDLE}
     */
    hInterface{
        get {
            if(!this.HasProp("__hInterface"))
                this.__hInterface := HANDLE(520, this)
            return this.__hInterface
        }
    }

    /**
     * A value that specifies whether the interface is enabled. This value is <b>TRUE</b> if the interface is enabled, <b>FALSE</b> if the interface is administratively disabled.
     * @type {BOOL}
     */
    fEnabled {
        get => NumGet(this, 528, "int")
        set => NumPut("int", value, this, 528)
    }

    /**
     * A value that identifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">interface type</a>.
     * @type {Integer}
     */
    dwIfType {
        get => NumGet(this, 532, "int")
        set => NumPut("int", value, this, 532)
    }

    /**
     * A value that describes the current state of the interface, for example, connected, disconnected, or unreachable. For more information and a list of possible states, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a>.
     * @type {Integer}
     */
    dwConnectionState {
        get => NumGet(this, 536, "int")
        set => NumPut("int", value, this, 536)
    }

    /**
     * A value that describes the reason why  the interface is unreachable. For more information and a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/RRAS/unreachability-reasons">Unreachability Reasons</a>.
     * @type {Integer}
     */
    fUnReachabilityReasons {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * A value that contains a nonzero value if the interface fails to connect.
     * @type {Integer}
     */
    dwLastError {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * A value that specifies bit flags that are used to set connection options. You can set one of the flags listed in the following table.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_SpecificIpAddr"></a><a id="mprio_specificipaddr"></a><a id="MPRIO_SPECIFICIPADDR"></a><dl>
     * <dt><b>MPRIO_SpecificIpAddr</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, RRAS attempts to use the IP address specified by <b>ipaddr</b> as the IP address for the dial-up connection. If this flag is not set, the value of the <b>ipaddr</b> member is ignored.
     * 
     * Setting the <b>MPRIO_SpecificIpAddr</b> flag corresponds to selecting the <b>Specify an IP Address</b> setting in the TCP/IP settings dialog box. Clearing the <b>MPRIO_SpecificIpAddr</b> flag corresponds to selecting the <b>Server Assigned IP Address</b> setting in the <b>TCP/IP Settings</b> dialog box.
     * 
     * Currently, an IP address set in the phone-book entry properties or retrieved from a server overrides the IP address set in the network control panel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_SpecificNameServers"></a><a id="mprio_specificnameservers"></a><a id="MPRIO_SPECIFICNAMESERVERS"></a><dl>
     * <dt><b>MPRIO_SpecificNameServers</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, RRAS uses the <b>ipaddrDns</b>, <b>ipaddrDnsAlt</b>, <b>ipaddrWins</b>, and <b>ipaddrWinsAlt</b> members to specify the name server addresses for the dial-up connection. If this flag is not set, RRAS ignores these members.
     * 
     * Setting the MPRIO_SpecificNameServers flag corresponds to selecting the <b>Specify Name Server Addresses</b> setting in the TCP/IP Settings dialog box. Clearing the <b>MPRIO_SpecificNameServers</b> flag corresponds to selecting the <b>Server Assigned Name Server Addresses</b> setting in the <b>TCP/IP Settings</b> dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_IpHeaderCompression"></a><a id="mprio_ipheadercompression"></a><a id="MPRIO_IPHEADERCOMPRESSION"></a><dl>
     * <dt><b>MPRIO_IpHeaderCompression</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, RRAS negotiates to use IP header compression on PPP connections. IP header compression can significantly improve performance.
     * 
     * If this flag is not set, IP header compression is not negotiated.
     * 
     * This flag corresponds to the <b>Use IP Header Compression</b> check box in the <b>TCP/IP Settings</b> dialog box. The flag should be cleared only when connecting to a server that does not correctly negotiate IP header compression.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RemoteDefaultGateway"></a><a id="mprio_remotedefaultgateway"></a><a id="MPRIO_REMOTEDEFAULTGATEWAY"></a><dl>
     * <dt><b>MPRIO_RemoteDefaultGateway</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the default route for IP packets is through the dial-up adapter when the connection is active. If this flag is cleared, the default route is not modified.
     * 
     * This flag corresponds to the <b>Use Default Gateway on Remote Network</b> check box in the <b>TCP/IP Settings</b> dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_DisableLcpExtensions"></a><a id="mprio_disablelcpextensions"></a><a id="MPRIO_DISABLELCPEXTENSIONS"></a><dl>
     * <dt><b>MPRIO_DisableLcpExtensions</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, RRAS disables the PPP LCP extensions defined in <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-request-for-comments">RFC 1570</a>. Disabling the PPP LCP extensions may be necessary to connect to certain older PPP implementations, but it interferes with features such as server callback. Do not set this flag unless it is specifically required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_SwCompression"></a><a id="mprio_swcompression"></a><a id="MPRIO_SWCOMPRESSION"></a><dl>
     * <dt><b>MPRIO_SwCompression</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, software compression is negotiated on the link. Setting this flag causes the PPP driver to attempt to negotiate Compression Control Protocol (CCP) with the server. This flag should be set by default, but clearing it can reduce the negotiation period if the server does not support a compatible compression protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireEncryptedPw"></a><a id="mprio_requireencryptedpw"></a><a id="MPRIO_REQUIREENCRYPTEDPW"></a><dl>
     * <dt><b>MPRIO_RequireEncryptedPw</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, only secure password schemes can be used to authenticate the client with the server. This prevents the PPP driver from using the PAP plain-text authentication protocol to authenticate the client. However, the MS-CHAP, MD5-CHAP, and SPAP authentication protocols are supported. For increased security, set this flag. For increased interoperability, clear this flag. 
     * 
     * This flag corresponds to the <b>Require Encrypted Password</b> check box in the <b>Security</b> dialog box. For more information, see <b>MPRIO_RequireMsEncryptedPw</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireMsEncryptedPw"></a><a id="mprio_requiremsencryptedpw"></a><a id="MPRIO_REQUIREMSENCRYPTEDPW"></a><dl>
     * <dt><b>MPRIO_RequireMsEncryptedPw</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, only the Microsoft secure password schemes can be used to authenticate the client with the server. This prevents the PPP driver from using the PAP plain-text authentication protocol, MD5-CHAP, or SPAP. For increased security, set this flag. For increased interoperability, clear this flag. This flag takes precedence over 
     * <b>MPRIO_RequireEncryptedPw</b>.
     * 
     * This flag corresponds to the <b>Require Microsoft Encrypted Password</b> check box in the <b>Security</b> dialog box. For more information, see <b>MPRIO_RequireDataEncryption</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireDataEncryption"></a><a id="mprio_requiredataencryption"></a><a id="MPRIO_REQUIREDATAENCRYPTION"></a><dl>
     * <dt><b>MPRIO_RequireDataEncryption</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, data encryption must be negotiated successfully or the connection should be dropped. This flag is ignored unless 
     * <b>MPRIO_RequireMsEncryptedPw</b> is also set.
     * 
     * This flag corresponds to the <b>Require Data Encryption</b> check box in the <b>Security</b> dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_NetworkLogon"></a><a id="mprio_networklogon"></a><a id="MPRIO_NETWORKLOGON"></a><dl>
     * <dt><b>MPRIO_NetworkLogon</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag is reserved for future use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_UseLogonCredentials"></a><a id="mprio_uselogoncredentials"></a><a id="MPRIO_USELOGONCREDENTIALS"></a><dl>
     * <dt><b>MPRIO_UseLogonCredentials</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, RRAS uses the user name, password, and domain of the currently logged-on user when dialing this entry. This flag is ignored unless 
     * <b>MPRIO_RequireMsEncryptedPw</b> is also set.
     * 
     * This setting is ignored by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function where specifying empty strings for the <b>szUserName</b> and <b>szPassword</b> members of the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377238(v=vs.85)">RASDIALPARAMS</a> structure provides the same result.
     * 
     * This flag corresponds to the <b>Use Current Username and Password</b> check box in the <b>Security</b> dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_PromoteAlternates"></a><a id="mprio_promotealternates"></a><a id="MPRIO_PROMOTEALTERNATES"></a><dl>
     * <dt><b>MPRIO_PromoteAlternates</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag has an effect when alternate phone numbers are defined by the <b>szAlternates</b> member. If this flag is set, an alternate phone number that connects successfully becomes the primary phone number, and the current primary phone number is moved to the alternate list.
     * 
     * This flag corresponds to the check box in the <b>Alternate Numbers</b> dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_SecureLocalFiles"></a><a id="mprio_securelocalfiles"></a><a id="MPRIO_SECURELOCALFILES"></a><dl>
     * <dt><b>MPRIO_SecureLocalFiles</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, RRAS checks for existing remote file system and remote printer bindings before making a connection with this entry. Typically, you set this flag on phone-book entries for public networks to remind users to break connections to their private network before connecting to a public network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireEAP"></a><a id="mprio_requireeap"></a><a id="MPRIO_REQUIREEAP"></a><dl>
     * <dt><b>MPRIO_RequireEAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, Extensible Authentication Protocol (EAP) must be supported for authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequirePAP"></a><a id="mprio_requirepap"></a><a id="MPRIO_REQUIREPAP"></a><dl>
     * <dt><b>MPRIO_RequirePAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, Password Authentication Protocol must be supported for authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireSPAP"></a><a id="mprio_requirespap"></a><a id="MPRIO_REQUIRESPAP"></a><dl>
     * <dt><b>MPRIO_RequireSPAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, Shiva's Password Authentication Protocol (SPAP) must be supported for authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_SharedPhoneNumbers"></a><a id="mprio_sharedphonenumbers"></a><a id="MPRIO_SHAREDPHONENUMBERS"></a><dl>
     * <dt><b>MPRIO_SharedPhoneNumbers</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, phone numbers are shared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireCHAP"></a><a id="mprio_requirechap"></a><a id="MPRIO_REQUIRECHAP"></a><dl>
     * <dt><b>MPRIO_RequireCHAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the Challenge Handshake Authentication Protocol must be supported for authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireMsCHAP"></a><a id="mprio_requiremschap"></a><a id="MPRIO_REQUIREMSCHAP"></a><dl>
     * <dt><b>MPRIO_RequireMsCHAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the Microsoft Challenge Handshake Authentication Protocol must be supported for authentication.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRIO_RequireMsCHAP2"></a><a id="mprio_requiremschap2"></a><a id="MPRIO_REQUIREMSCHAP2"></a><dl>
     * <dt><b>MPRIO_RequireMsCHAP2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, version 2 of the Microsoft Challenge Handshake Authentication Protocol must be supported for authentication.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwfOptions {
        get => NumGet(this, 548, "uint")
        set => NumPut("uint", value, this, 548)
    }

    /**
     * A value that specifies a null-terminated string that contains a telephone number or an IPv6 address.
     * @type {String}
     */
    szLocalPhoneNumber {
        get => StrGet(this.ptr + 552, 128, "UTF-16")
        set => StrPut(value, this.ptr + 552, 128, "UTF-16")
    }

    /**
     * A pointer to a list of consecutive null-terminated Unicode strings. The last string is terminated by two consecutive null characters. The strings are alternate phone numbers that the router dials, in the order listed, if the primary number fails to connect. For more information, see <b>szLocalPhoneNumber</b>.
     * @type {PWSTR}
     */
    szAlternates {
        get => NumGet(this, 816, "ptr")
        set => NumPut("ptr", value, this, 816)
    }

    /**
     * A value that specifies the IP address to be used while this connection is active. This member is ignored unless <b>dwfOptions</b> specifies the 
     * <b>MPRIO_SpecificIpAddr</b> flag.
     * @type {Integer}
     */
    ipaddr {
        get => NumGet(this, 824, "uint")
        set => NumPut("uint", value, this, 824)
    }

    /**
     * A value that specifies the IP address of the DNS server to be used while this connection is active. This member is ignored unless <b>dwfOptions</b> specifies the 
     * <b>MPRIO_SpecificNameServers</b> flag.
     * @type {Integer}
     */
    ipaddrDns {
        get => NumGet(this, 828, "uint")
        set => NumPut("uint", value, this, 828)
    }

    /**
     * A value that specifies the IP address of a secondary or backup DNS server to be used while this connection is active. This member is ignored unless <b>dwfOptions</b> specifies the 
     * <b>MPRIO_SpecificNameServers</b> flag.
     * @type {Integer}
     */
    ipaddrDnsAlt {
        get => NumGet(this, 832, "uint")
        set => NumPut("uint", value, this, 832)
    }

    /**
     * A value that specifies the IP address of the WINS server to be used while this connection is active. This member is ignored unless <b>dwfOptions</b> specifies the 
     * <b>MPRIO_SpecificNameServers</b> flag.
     * @type {Integer}
     */
    ipaddrWins {
        get => NumGet(this, 836, "uint")
        set => NumPut("uint", value, this, 836)
    }

    /**
     * A value that specifies the IP address of a secondary WINS server to be used while this connection is active. This member is ignored unless <b>dwfOptions</b> specifies the 
     * <b>MPRIO_SpecificNameServers</b> flag.
     * @type {Integer}
     */
    ipaddrWinsAlt {
        get => NumGet(this, 840, "uint")
        set => NumPut("uint", value, this, 840)
    }

    /**
     * A value that specifies the network protocols to negotiate. This member can be a combination of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRNP_Ipx"></a><a id="mprnp_ipx"></a><a id="MPRNP_IPX"></a><dl>
     * <dt><b>MPRNP_Ipx</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiate the IPX protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRNP_Ip"></a><a id="mprnp_ip"></a><a id="MPRNP_IP"></a><dl>
     * <dt><b>MPRNP_Ip</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Negotiate the TCP/IP protocol.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>64-bit Windows:  </b>The <b>MPRNP_Ipx</b> flag is not supported
     * @type {Integer}
     */
    dwfNetProtocols {
        get => NumGet(this, 844, "uint")
        set => NumPut("uint", value, this, 844)
    }

    /**
     * A value that specifies a null-terminated string that indicates the RRAS device type that is referenced by <b>szDeviceName</b>. This member can be one of the following string constants.
     * 
     * <table>
     * <tr>
     * <th>String</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Modem"></a><a id="mprdt_modem"></a><a id="MPRDT_MODEM"></a><dl>
     * <dt><b>MPRDT_Modem</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A modem that is accessed through a COM port.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Isdn"></a><a id="mprdt_isdn"></a><a id="MPRDT_ISDN"></a><dl>
     * <dt><b>MPRDT_Isdn</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An ISDN adapter with the corresponding NDISWAN driver installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_X25"></a><a id="mprdt_x25"></a><dl>
     * <dt><b>MPRDT_X25</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An X.25 adapter with the corresponding NDISWAN driver installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Vpn"></a><a id="mprdt_vpn"></a><a id="MPRDT_VPN"></a><dl>
     * <dt><b>MPRDT_Vpn</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A virtual private network (VPN) connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Pad"></a><a id="mprdt_pad"></a><a id="MPRDT_PAD"></a><dl>
     * <dt><b>MPRDT_Pad</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A packet assembler/disassembler.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Generic"></a><a id="mprdt_generic"></a><a id="MPRDT_GENERIC"></a><dl>
     * <dt><b>MPRDT_Generic</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Generic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Serial"></a><a id="mprdt_serial"></a><a id="MPRDT_SERIAL"></a><dl>
     * <dt><b>MPRDT_Serial</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Direct serial connection through a serial port.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_FrameRelay"></a><a id="mprdt_framerelay"></a><a id="MPRDT_FRAMERELAY"></a><dl>
     * <dt><b>MPRDT_FrameRelay</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Frame Relay.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Atm"></a><a id="mprdt_atm"></a><a id="MPRDT_ATM"></a><dl>
     * <dt><b>MPRDT_Atm</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Asynchronous Transfer Mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Sonet"></a><a id="mprdt_sonet"></a><a id="MPRDT_SONET"></a><dl>
     * <dt><b>MPRDT_Sonet</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sonet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_SW56"></a><a id="mprdt_sw56"></a><dl>
     * <dt><b>MPRDT_SW56</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Switched 56K Access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Irda"></a><a id="mprdt_irda"></a><a id="MPRDT_IRDA"></a><dl>
     * <dt><b>MPRDT_Irda</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An Infrared Data Association (IrDA)-compliant device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRDT_Parallel"></a><a id="mprdt_parallel"></a><a id="MPRDT_PARALLEL"></a><dl>
     * <dt><b>MPRDT_Parallel</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Direct parallel connection through a parallel port.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {String}
     */
    szDeviceType {
        get => StrGet(this.ptr + 848, 16, "UTF-16")
        set => StrPut(value, this.ptr + 848, 16, "UTF-16")
    }

    /**
     * Contains a null-terminated string that contains the name of a TAPI device to use with this phone-book entry, for example, "Fabrikam Inc 28800 External". To enumerate all available RAS-capable devices, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumdevicesa">RasEnumDevices</a> function.
     * @type {String}
     */
    szDeviceName {
        get => StrGet(this.ptr + 882, 128, "UTF-16")
        set => StrPut(value, this.ptr + 882, 128, "UTF-16")
    }

    /**
     * A data type that contains a null-terminated string that identifies the X.25 PAD type. Set this member to an empty string ("") unless the entry should dial using an X.25 PAD.
     * 
     * <b>Windows 2000 and Windows NT:  </b>The <b>szX25PadType</b> string maps to a section name in PAD.INF.
     * @type {String}
     */
    szX25PadType {
        get => StrGet(this.ptr + 1140, 32, "UTF-16")
        set => StrPut(value, this.ptr + 1140, 32, "UTF-16")
    }

    /**
     * Contains a null-terminated string that identifies the X.25 address to connect to. Set this member to an empty string ("") unless the entry should dial using an X.25 PAD or native X.25 device.
     * @type {String}
     */
    szX25Address {
        get => StrGet(this.ptr + 1206, 200, "UTF-16")
        set => StrPut(value, this.ptr + 1206, 200, "UTF-16")
    }

    /**
     * Contains a null-terminated string that specifies the facilities to request from the X.25 host at connection time. This member is ignored if <b>szX25Address</b> is an empty string ("").
     * @type {String}
     */
    szX25Facilities {
        get => StrGet(this.ptr + 1608, 200, "UTF-16")
        set => StrPut(value, this.ptr + 1608, 200, "UTF-16")
    }

    /**
     * Contains a null-terminated string that specifies additional connection data supplied to the X.25 host at connection time. This member is ignored if <b>szX25Address</b> is an empty string ("").
     * @type {String}
     */
    szX25UserData {
        get => StrGet(this.ptr + 2010, 200, "UTF-16")
        set => StrPut(value, this.ptr + 2010, 200, "UTF-16")
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwChannels {
        get => NumGet(this, 2412, "uint")
        set => NumPut("uint", value, this, 2412)
    }

    /**
     * A value that specifies the number of multilink subentries associated with this entry. When calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a>, set this member to zero. To add subentries to a phone-book entry, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetsubentrypropertiesa">RasSetSubEntryProperties</a> function.
     * @type {Integer}
     */
    dwSubEntries {
        get => NumGet(this, 2416, "uint")
        set => NumPut("uint", value, this, 2416)
    }

    /**
     * 
     * @type {Integer}
     */
    dwDialMode {
        get => NumGet(this, 2420, "uint")
        set => NumPut("uint", value, this, 2420)
    }

    /**
     * A value that specifies the percentage of the total bandwidth that is available from the currently connected subentries. RRAS dials an additional subentry when the total bandwidth that is used exceeds <b>dwDialExtraPercent</b> percent of the available bandwidth for at least <b>dwDialExtraSampleSeconds</b> seconds.
     * 
     * This member is ignored unless the <b>dwDialMode</b> member specifies the <b>MPRDM_DialAsNeeded</b> flag.
     * @type {Integer}
     */
    dwDialExtraPercent {
        get => NumGet(this, 2424, "uint")
        set => NumPut("uint", value, this, 2424)
    }

    /**
     * A value that specifies the time, in seconds, for which current bandwidth usage must exceed the threshold that is specified by <b>dwDialExtraPercent</b> before RRAS dials an additional subentry.
     * 
     * This member is ignored unless the <b>dwDialMode</b> member specifies the <b>MPRDM_DialAsNeeded</b> flag.
     * @type {Integer}
     */
    dwDialExtraSampleSeconds {
        get => NumGet(this, 2428, "uint")
        set => NumPut("uint", value, this, 2428)
    }

    /**
     * A value that specifies the percentage of the total bandwidth that is available from the currently connected subentries. RRAS terminates (hangs up) an existing subentry connection when the total bandwidth used is less than <b>dwHangUpExtraPercent</b> percent of the available bandwidth for at least <b>dwHangUpExtraSampleSeconds</b> seconds.
     * 
     * This member is ignored unless the <b>dwDialMode</b> member specifies the <b>MPRDM_DialAsNeeded</b> flag.
     * @type {Integer}
     */
    dwHangUpExtraPercent {
        get => NumGet(this, 2432, "uint")
        set => NumPut("uint", value, this, 2432)
    }

    /**
     * A value that specifies the time, in seconds, for which current bandwidth usage must be less than the threshold that is specified by <b>dwHangUpExtraPercent</b> before RRAS terminates an existing subentry connection.
     * 
     * This member is ignored unless the <b>dwDialMode</b> member specifies the <b>MPRDM_DialAsNeeded</b> flag.
     * @type {Integer}
     */
    dwHangUpExtraSampleSeconds {
        get => NumGet(this, 2436, "uint")
        set => NumPut("uint", value, this, 2436)
    }

    /**
     * 
     * @type {Integer}
     */
    dwIdleDisconnectSeconds {
        get => NumGet(this, 2440, "uint")
        set => NumPut("uint", value, this, 2440)
    }

    /**
     * A value that specifies the type of phone-book entry. This member can be one of the following types.
     * 
     * <table>
     * <tr>
     * <th>Type</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRET_Phone"></a><a id="mpret_phone"></a><a id="MPRET_PHONE"></a><dl>
     * <dt><b>MPRET_Phone</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Phone line, for example, modem, ISDN, or X.25.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRET_Vpn"></a><a id="mpret_vpn"></a><a id="MPRET_VPN"></a><dl>
     * <dt><b>MPRET_Vpn</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Virtual Private Network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRET_Direct"></a><a id="mpret_direct"></a><a id="MPRET_DIRECT"></a><dl>
     * <dt><b>MPRET_Direct</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Direct serial or parallel connection.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 2444, "uint")
        set => NumPut("uint", value, this, 2444)
    }

    /**
     * 
     * @type {Integer}
     */
    dwEncryptionType {
        get => NumGet(this, 2448, "uint")
        set => NumPut("uint", value, this, 2448)
    }

    /**
     * A value that specifies the authentication key to be provided to an Extensible Authentication Protocol (EAP) vendor.
     * @type {Integer}
     */
    dwCustomAuthKey {
        get => NumGet(this, 2452, "uint")
        set => NumPut("uint", value, this, 2452)
    }

    /**
     * A value that specifies the size of the data pointed to by the <b>lpbCustomAuthData</b> member.
     * @type {Integer}
     */
    dwCustomAuthDataSize {
        get => NumGet(this, 2456, "uint")
        set => NumPut("uint", value, this, 2456)
    }

    /**
     * A pointer to authentication data to use with EAP.
     * @type {Pointer<Integer>}
     */
    lpbCustomAuthData {
        get => NumGet(this, 2464, "ptr")
        set => NumPut("ptr", value, this, 2464)
    }

    /**
     * The globally unique identifier (GUID) that represents this phone-book entry. This member is read-only.
     * @type {Pointer<Guid>}
     */
    guidId {
        get => NumGet(this, 2472, "ptr")
        set => NumPut("ptr", value, this, 2472)
    }

    /**
     * 
     * @type {Integer}
     */
    dwVpnStrategy {
        get => NumGet(this, 2480, "uint")
        set => NumPut("uint", value, this, 2480)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    AddressCount {
        get => NumGet(this, 2484, "uint")
        set => NumPut("uint", value, this, 2484)
    }

    /**
     * A value that specifies the IP address of the DNS server to be used while this connection is active.
     * @type {IN6_ADDR}
     */
    ipv6addrDns{
        get {
            if(!this.HasProp("__ipv6addrDns"))
                this.__ipv6addrDns := IN6_ADDR(2488, this)
            return this.__ipv6addrDns
        }
    }

    /**
     * A value that specifies the IP address of a secondary or backup DNS server to be used while this connection is active.
     * @type {IN6_ADDR}
     */
    ipv6addrDnsAlt{
        get {
            if(!this.HasProp("__ipv6addrDnsAlt"))
                this.__ipv6addrDnsAlt := IN6_ADDR(2504, this)
            return this.__ipv6addrDnsAlt
        }
    }

    /**
     * Not used.
     * @type {Pointer<IN6_ADDR>}
     */
    ipv6addr {
        get => NumGet(this, 2520, "ptr")
        set => NumPut("ptr", value, this, 2520)
    }
}

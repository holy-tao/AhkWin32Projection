#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Networking\WinSock\IN_ADDR.ahk" { IN_ADDR }
#Import ".\RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL.ahk" { RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL }
#Import ".\RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA.ahk" { RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information obtained during Point-to-Point (PPP) negotiation of Internet Protocol version 4 (IPv4) and IPv6 projection operations, and PPP Link Control Protocol (LCP)/multilink, and Compression Control Protocol (CCP) negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ns-ras-rasppp_projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPPP_PROJECTION_INFO {
    #StructPack 4

    /**
     * A value that specifies the result of PPP IPv4  network control protocol negotiation. A value of zero indicates Ipv4 has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during the control protocol negotiation.
     */
    dwIPv4NegotiationError : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV4ADDR</a> that contains a null-terminated Unicode string that specifies the IPv4 address of the local client. This string has the form "a.b.c.d". <b>ipv4Address</b> is valid only if <b>dwIPv4NegotiationError</b> is zero.
     */
    ipv4Address : IN_ADDR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV4ADDR</a> structure that contains a Unicode string that specifies the IPv4 address of the remote server. This string has the form "a.b.c.d". <b>ipv4ServerAddress</b> is valid only if <b>dwIPv4NegotiationError</b> is zero. If the address is not available, this member is an empty string.
     */
    ipv4ServerAddress : IN_ADDR

    /**
     * A value that specifies Internet Protocol Control Protocol (IPCP) options for the local client.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASIPO_VJ"></a><a id="rasipo_vj"></a><dl>
     * <dt><b>RASIPO_VJ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that IP datagrams sent by the local client are compressed using Van Jacobson compression.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwIPv4Options : UInt32

    /**
     * A value that specifies IPCP options for the remote server.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASIPO_VJ"></a><a id="rasipo_vj"></a><dl>
     * <dt><b>RASIPO_VJ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that IP datagrams sent by the remote server (that is, received by the local computer) are compressed using Van Jacobson compression.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwIPv4ServerOptions : UInt32

    /**
     * A value that specifies the result of PPP IPv6  network control protocol negotiation. A value of zero indicates Ipv6 has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during the control protocol negotiation.
     */
    dwIPv6NegotiationError : UInt32

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the client. The last 64 bits of a 128-bit IPv6 internet address are considered the "interface identifier," which provides a strong level of uniqueness for the preceding 64-bits. <b>bInterfaceIdentifier</b> must not be zero and is valid only if <b>dwIPv6NegotiationError</b> is zero.
     */
    bInterfaceIdentifier : Int8[8]

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the server. The last 64 bits of a 128-bit IPv6 internet address are considered the "interface identifier," which provides a strong level of uniqueness for the preceding 64-bits. <b>bServerInterfaceIdentifier</b> must not be zero and is valid only if <b>dwIPv6NegotiationError</b> is zero.
     */
    bServerInterfaceIdentifier : Int8[8]

    /**
     * A <b>BOOL</b> that is <b>TRUE</b> if the connection is composed of multiple links and <b>FALSE</b> otherwise.
     */
    fBundled : BOOL

    /**
     * A <b>BOOL</b> that is <b>TRUE</b> if the connection supports multiple links and <b>FALSE</b> otherwise.
     */
    fMultilink : BOOL

    dwAuthenticationProtocol : RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL

    dwAuthenticationData : RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA

    dwServerAuthenticationProtocol : RASPPP_PROJECTION_INFO_SERVER_AUTH_PROTOCOL

    dwServerAuthenticationData : RASPPP_PROJECTION_INFO_SERVER_AUTH_DATA

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if <b>dwAuthenticationProtocol</b> is <b>RASLCPAPP_EAP.</b>.
     */
    dwEapTypeId : UInt32

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the remote server. The value of this member is valid only if <b>dwRemoteAuthenticationProtocol</b> is <b>RASLCPAPP_EAP.</b>.
     */
    dwServerEapTypeId : UInt32

    /**
     * A value that specifies information about LCP options in use by the local client. This member is a combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_PFC"></a><a id="raslcpo_pfc"></a><dl>
     * <dt><b>RASLCPO_PFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Protocol Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_ACFC"></a><a id="raslcpo_acfc"></a><dl>
     * <dt><b>RASLCPO_ACFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Address and Control Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_SSHF"></a><a id="raslcpo_sshf"></a><dl>
     * <dt><b>RASLCPO_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Short Sequence Number Header Format (see RFC 1990).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_DES_56"></a><a id="raslcpo_des_56"></a><dl>
     * <dt><b>RASLCPO_DES_56</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using DES 56-bit encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_3_DES"></a><a id="raslcpo_3_des"></a><dl>
     * <dt><b>RASLCPO_3_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Triple DES Encryption.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwLcpOptions : UInt32

    /**
     * A value that specifies information about LCP options in use by the remote server. This member is a combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_PFC"></a><a id="raslcpo_pfc"></a><dl>
     * <dt><b>RASLCPO_PFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Protocol Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_ACFC"></a><a id="raslcpo_acfc"></a><dl>
     * <dt><b>RASLCPO_ACFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Address and Control Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_SSHF"></a><a id="raslcpo_sshf"></a><dl>
     * <dt><b>RASLCPO_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Short Sequence Number Header Format (see RFC 1990).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_DES_56"></a><a id="raslcpo_des_56"></a><dl>
     * <dt><b>RASLCPO_DES_56</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using DES 56-bit encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASLCPO_3_DES"></a><a id="raslcpo_3_des"></a><dl>
     * <dt><b>RASLCPO_3_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Triple DES Encryption.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwLcpServerOptions : UInt32

    dwCcpError : UInt32

    /**
     * A value that specifies the compression algorithm used by the local client. The following table shows the possible values for this member.  
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_MPPC"></a><a id="rasccpca_mppc"></a><dl>
     * <dt><b>RASCCPCA_MPPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Compression (MPPC) Protocol (<a href="https://www.ietf.org/rfc/rfc2118.txt">RFC 2118</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_STAC"></a><a id="rasccpca_stac"></a><dl>
     * <dt><b>RASCCPCA_STAC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * STAC option 4 (<a href="https://www.ietf.org/rfc/rfc1974.txt">RFC 1974</a>).
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCcpCompressionAlgorithm : UInt32

    /**
     * A value that specifies the compression algorithm used by the remote server. The following algorithms are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_MPPC"></a><a id="rasccpca_mppc"></a><dl>
     * <dt><b>RASCCPCA_MPPC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Compression (MPPC) Protocol (
     * <a href="https://www.ietf.org/rfc/rfc2118.txt">RFC 2118</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_STAC"></a><a id="rasccpca_stac"></a><dl>
     * <dt><b>RASCCPCA_STAC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * STAC option 4 (
     * <a href="https://www.ietf.org/rfc/rfc1974.txt">RFC 1974</a>).
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCcpServerCompressionAlgorithm : UInt32

    /**
     * A value that specifies the compression types available on the local client. The following types are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_COMPRESSION"></a><a id="rasccpo_compression"></a><dl>
     * <dt><b>RASCCPO_COMPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compression without encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_HISTORYLESS"></a><a id="rasccpo_historyless"></a><dl>
     * <dt><b>RASCCPO_HISTORYLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Encryption (MPPE) in stateless mode. The session key is changed after every packet. This mode improves performance on high latency networks, or networks that experience significant packet loss.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION40BITOLD"></a><a id="rasccpo_encryption40bitold"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION40BITOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION40BIT"></a><a id="rasccpo_encryption40bit"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION40BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION56BIT"></a><a id="rasccpo_encryption56bit"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION56BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 56-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION128BIT"></a><a id="rasccpo_encryption128bit"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION128BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 128-bit keys.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCcpOptions : UInt32

    /**
     * A value that specifies the compression types available on the remote server. The following types are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_COMPRESSION"></a><a id="rasccpo_compression"></a><dl>
     * <dt><b>RASCCPO_COMPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compression without encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_HISTORYLESS"></a><a id="rasccpo_historyless"></a><dl>
     * <dt><b>RASCCPO_HISTORYLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Encryption (MPPE) in stateless mode. The session key is changed after every packet. This mode improves performance on high latency networks, or networks that experience significant packet loss.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION40BITOLD"></a><a id="rasccpo_encryption40bitold"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION40BITOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION40BIT"></a><a id="rasccpo_encryption40bit"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION40BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION56BIT"></a><a id="rasccpo_encryption56bit"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION56BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 56-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPO_ENCRYPTION128BIT"></a><a id="rasccpo_encryption128bit"></a><dl>
     * <dt><b>RASCCPO_ENCRYPTION128BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 128-bit keys.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCcpServerOptions : UInt32

}

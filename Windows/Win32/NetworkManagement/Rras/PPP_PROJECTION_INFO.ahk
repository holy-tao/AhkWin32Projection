#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPP_LCP.ahk" { PPP_LCP }
#Import ".\PPP_LCP_INFO_AUTH_DATA.ahk" { PPP_LCP_INFO_AUTH_DATA }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information obtained during Point-to-Point (PPP) negotiation for Secure Socket Tunneling Protocol (SSTP), Point-to-Point Tunneling Protocol (PPTP), and Layer 2 Tunneling Protocol (L2TP). (PPP_PROJECTION_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ppp_projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct PPP_PROJECTION_INFO {
    #StructPack 8

    /**
     * A value that specifies the result of PPP IPv4  Network control protocol negotiation. A value of zero indicates Ipv4 has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during the control protocol negotiation.
     */
    dwIPv4NegotiationError : UInt32

    /**
     * An array that contains a Unicode string that specifies the IPv4 address of the local client. This string has the form "a.b.c.d". <b>wszAddress</b> is valid only if <b>dwIPv4NegotiationError</b> is zero.
     */
    wszAddress : WCHAR[16]

    /**
     * An array that contains a Unicode string that specifies the IPv4 address of the remote server. This string has the form "a.b.c.d". <b>wszRemoteAddress</b> is valid only if <b>dwIPv4NegotiationError</b> is zero. If the address is not available, this member is an empty string.
     */
    wszRemoteAddress : WCHAR[16]

    /**
     * A value that specifies IPCP options for the local client.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_IPCP_VJ"></a><a id="ppp_ipcp_vj"></a><dl>
     * <dt><b>PPP_IPCP_VJ</b></dt>
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
     * <td width="40%"><a id="PPP_IPCP_VJ"></a><a id="ppp_ipcp_vj"></a><dl>
     * <dt><b>PPP_IPCP_VJ</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that IP datagrams sent by the remote server (that is, received by the local computer) are compressed using Van Jacobson compression.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwIPv4RemoteOptions : UInt32

    /**
     * A value that specifies the IPv4 subinterface   index corresponding to the connection on the server.
     */
    IPv4SubInterfaceIndex : Int64

    /**
     * A value that specifies the result of PPP IPv6  Network control protocol negotiation. A value of zero indicates Ipv6 has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during the control protocol negotiation.
     */
    dwIPv6NegotiationError : UInt32

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the client. The last 64 bits of a 128-bit IPv6 internet address are considered the "interface identifier," which provides a strong level of uniqueness for the preceding 64-bits. <b>bInterfaceIdentifier</b> is valid only if <b>dwIPv6NegotiationError</b> is zero and must not be zero.
     */
    bInterfaceIdentifier : Int8[8]

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the server. The last 64 bits of a 128-bit IPv6 internet address are considered the "interface identifier," which provides a strong level of uniqueness for the preceding 64-bits. <b>bInterfaceIdentifier</b> is valid only if <b>dwIPv6NegotiationError</b> is zero and must not be zero.
     */
    bRemoteInterfaceIdentifier : Int8[8]

    /**
     * A value that specifies the client interface IPv6  address prefix.
     */
    bPrefix : Int8[8]

    /**
     * A value that specifies the length, in bits, of <b>bPrefix</b>.
     */
    dwPrefixLength : UInt32

    /**
     * A value that specifies the IPv6 subinterface   index corresponding to the connection on the server.
     */
    IPv6SubInterfaceIndex : Int64

    /**
     * A value that specifies the result of PPP LCP negotiation. A value of zero indicates LCP has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during the control protocol negotiation.
     */
    dwLcpError : UInt32

    dwAuthenticationProtocol : PPP_LCP

    dwAuthenticationData : PPP_LCP_INFO_AUTH_DATA

    dwRemoteAuthenticationProtocol : PPP_LCP

    dwRemoteAuthenticationData : PPP_LCP_INFO_AUTH_DATA

    /**
     * Reserved for future use. Must be zero.
     */
    dwLcpTerminateReason : UInt32

    /**
     * Reserved for future use. Must be zero.
     */
    dwLcpRemoteTerminateReason : UInt32

    /**
     * A value that specifies information about LCP options in use by the local client. This member is a combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_MULTILINK_FRAMING"></a><a id="ppp_lcp_multilink_framing"></a><dl>
     * <dt><b>PPP_LCP_MULTILINK_FRAMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using multilink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_PFC"></a><a id="ppp_lcp_pfc"></a><dl>
     * <dt><b>PPP_LCP_PFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Protocol Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_ACFC_"></a><a id="ppp_lcp_acfc_"></a><dl>
     * <dt><b>PPP_LCP_ACFC </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Address and Control Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_SSHF"></a><a id="ppp_lcp_sshf"></a><dl>
     * <dt><b>PPP_LCP_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Short Sequence Number Header Format (see RFC 1990).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_DES_56"></a><a id="ppp_lcp_des_56"></a><dl>
     * <dt><b>PPP_LCP_DES_56</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using DES 56-bit encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_3_DES"></a><a id="ppp_lcp_3_des"></a><dl>
     * <dt><b>PPP_LCP_3_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Triple DES Encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_AES_128"></a><a id="ppp_lcp_aes_128"></a><dl>
     * <dt><b>PPP_LCP_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using 128-bit AES Encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_AES_256"></a><a id="ppp_lcp_aes_256"></a><dl>
     * <dt><b>PPP_LCP_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using 256-bit AES Encryption. 
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
     * <td width="40%"><a id="PPP_LCP_MULTILINK_FRAMING"></a><a id="ppp_lcp_multilink_framing"></a><dl>
     * <dt><b>PPP_LCP_MULTILINK_FRAMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using multilink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_PFC"></a><a id="ppp_lcp_pfc"></a><dl>
     * <dt><b>PPP_LCP_PFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Protocol Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_ACFC_"></a><a id="ppp_lcp_acfc_"></a><dl>
     * <dt><b>PPP_LCP_ACFC </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Address and Control Field Compression (<a href="https://www.ietf.org/rfc/rfc1172.txt">RFC 1172</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_SSHF"></a><a id="ppp_lcp_sshf"></a><dl>
     * <dt><b>PPP_LCP_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Short Sequence Number Header Format (see RFC 1990).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_DES_56"></a><a id="ppp_lcp_des_56"></a><dl>
     * <dt><b>PPP_LCP_DES_56</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using DES 56-bit encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_3_DES"></a><a id="ppp_lcp_3_des"></a><dl>
     * <dt><b>PPP_LCP_3_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Triple DES Encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_AES_128"></a><a id="ppp_lcp_aes_128"></a><dl>
     * <dt><b>PPP_LCP_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using 128-bit AES Encryption
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_AES_256"></a><a id="ppp_lcp_aes_256"></a><dl>
     * <dt><b>PPP_LCP_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using 256-bit AES Encryption. 
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwLcpRemoteOptions : UInt32

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if <b>dwAuthenticationProtocol</b> is <b>PPP_LCP_EAP</b>.
     */
    dwEapTypeId : UInt32

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the remote server. The value of this member is valid only if <b>dwRemoteAuthenticationProtocol</b> is <b>PPP_LCP_EAP</b>.
     */
    dwRemoteEapTypeId : UInt32

    /**
     * A value that specifies the result of PPP CCP negotiation. A value of zero indicates CCP has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during the control protocol negotiation.
     */
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
    dwCompressionAlgorithm : UInt32

    /**
     * A value that specifies the compression types available on the local client. The following types are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_COMPRESSION"></a><a id="ppp_ccp_compression"></a><dl>
     * <dt><b>PPP_CCP_COMPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compression without encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_HISTORYLESS"></a><a id="ppp_ccp_historyless"></a><dl>
     * <dt><b>PPP_CCP_HISTORYLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Encryption (MPPE) in stateless mode. The session key is changed after every packet. This mode improves performance on high latency networks, or networks that experience significant packet loss.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BITOLD"></a><a id="ppp_ccp_encryption40bitold"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BITOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BIT"></a><a id="ppp_ccp_encryption40bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION56BIT"></a><a id="ppp_ccp_encryption56bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION56BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 56-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION128BIT"></a><a id="ppp_ccp_encryption128bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION128BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 128-bit keys.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The last three options are used when a connection is made over Layer 2 Tunneling Protocol (L2TP), and the connection uses IPSec encryption.
     */
    dwCcpOptions : UInt32

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
    dwRemoteCompressionAlgorithm : UInt32

    /**
     * A value that specifies the compression types available on the remote server. The following types are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_COMPRESSION"></a><a id="ppp_ccp_compression"></a><dl>
     * <dt><b>PPP_CCP_COMPRESSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Compression without encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_HISTORYLESS"></a><a id="ppp_ccp_historyless"></a><dl>
     * <dt><b>PPP_CCP_HISTORYLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Microsoft Point-to-Point Encryption (MPPE) in stateless mode. The session key is changed after every packet. This mode improves performance on high latency networks, or networks that experience significant packet loss.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BITOLD"></a><a id="ppp_ccp_encryption40bitold"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BITOLD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION40BIT"></a><a id="ppp_ccp_encryption40bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION40BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 40-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION56BIT"></a><a id="ppp_ccp_encryption56bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION56BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 56-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_CCP_ENCRYPTION128BIT"></a><a id="ppp_ccp_encryption128bit"></a><dl>
     * <dt><b>PPP_CCP_ENCRYPTION128BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MPPE compression using 128-bit keys.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ERROR_PPP_NOT_CONVERGING"></a><a id="error_ppp_not_converging"></a><dl>
     * <dt><b>ERROR_PPP_NOT_CONVERGING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote computer and RRAS could not converge on address negotiation.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The last three options are used when a connection is made over Layer 2 Tunneling Protocol (L2TP), and the connection uses IPSec encryption.
     */
    dwCcpRemoteOptions : UInt32

}

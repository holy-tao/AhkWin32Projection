#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information obtained during Point-to-Point (PPP) negotiation for Secure Socket Tunneling Protocol (SSTP), Point-to-Point Tunneling Protocol (PPTP), and Layer 2 Tunneling Protocol (L2TP).
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ppp_projection_info2
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PPP_PROJECTION_INFO2 extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * A value that specifies the result of PPP IPv4 Network control protocol negotiation. A value of 0 indicates IPv4 has been negotiated successfully. A nonzero value indicates failure, and also represents the fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwIPv4NegotiationError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A null-terminated Unicode string that specifies the IPv4 address of the local client. This string has the form "a.b.c.d". The <b>wszAddress</b> member is valid only if dwIPv4NegotiationError is 0.
     * @type {String}
     */
    wszAddress {
        get => StrGet(this.ptr + 4, 15, "UTF-16")
        set => StrPut(value, this.ptr + 4, 15, "UTF-16")
    }

    /**
     * An array that contains a Unicode string that specifies the IPv4 address of the remote server. This string has the form "a.b.c.d". The <b>wszRemoteAddress</b> member is valid only if the <b>dwIPv4NegotiationError</b> member is zero. If the address is not available, this member is an empty string.
     * @type {String}
     */
    wszRemoteAddress {
        get => StrGet(this.ptr + 36, 15, "UTF-16")
        set => StrPut(value, this.ptr + 36, 15, "UTF-16")
    }

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
     * @type {Integer}
     */
    dwIPv4Options {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

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
     * @type {Integer}
     */
    dwIPv4RemoteOptions {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A value that specifies the IPv4 subinterface index corresponding to the connection on the server.
     * @type {Integer}
     */
    IPv4SubInterfaceIndex {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A value that specifies the result of PPP IPv6 Network control protocol negotiation. A value of zero indicates Ipv6 has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwIPv6NegotiationError {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the client. The last 64 bits of a 128-bit IPv6 internet address are considered the interface identifier, which provides a strong level of uniqueness for the preceding 64 bits. The <b>bInterfaceIdentifier</b> member must not be 0 and is valid only if the <b>dwIPv6NegotiationError</b> member is 0.
     * @type {Array<Byte>}
     */
    bInterfaceIdentifier{
        get {
            if(!this.HasProp("__bInterfaceIdentifierProxyArray"))
                this.__bInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 92, 8, Primitive, "char")
            return this.__bInterfaceIdentifierProxyArray
        }
    }

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the server. The last 64 bits of a 128-bit IPv6 internet address are considered the interface identifier, which provides a strong level of uniqueness for the preceding 64 bits. The <b>bInterfaceIdentifier</b> member must not be 0 and is valid only if the <b>dwIPv6NegotiationError</b> member is 0.
     * @type {Array<Byte>}
     */
    bRemoteInterfaceIdentifier{
        get {
            if(!this.HasProp("__bRemoteInterfaceIdentifierProxyArray"))
                this.__bRemoteInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 100, 8, Primitive, "char")
            return this.__bRemoteInterfaceIdentifierProxyArray
        }
    }

    /**
     * A value that specifies the client interface IPv6 address prefix.
     * @type {Array<Byte>}
     */
    bPrefix{
        get {
            if(!this.HasProp("__bPrefixProxyArray"))
                this.__bPrefixProxyArray := Win32FixedArray(this.ptr + 108, 8, Primitive, "char")
            return this.__bPrefixProxyArray
        }
    }

    /**
     * A value that specifies the length, in bits, of the <b>bPrefix</b> member.
     * @type {Integer}
     */
    dwPrefixLength {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * A value that specifies the IPv6 subinterface index corresponding to the connection on the server.
     * @type {Integer}
     */
    IPv6SubInterfaceIndex {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * A value that specifies the result of PPP LCP negotiation. A value of zero indicates LCP has been negotiated successfully. A nonzero value indicates failure and represents the fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwLcpError {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAuthenticationProtocol {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * 
     * @type {Integer}
     */
    dwAuthenticationData {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * 
     * @type {Integer}
     */
    dwRemoteAuthenticationProtocol {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * 
     * @type {Integer}
     */
    dwRemoteAuthenticationData {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Not Implemented. Must be 0.
     * @type {Integer}
     */
    dwLcpTerminateReason {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Not Implemented. Must be 0.
     * @type {Integer}
     */
    dwLcpRemoteTerminateReason {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * A value that specifies information about LCP options in use by the local client. This member is a combination of the following flags.
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
     * The connection is using Protocol Field Compression.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_ACFC"></a><a id="ppp_lcp_acfc"></a><dl>
     * <dt><b>PPP_LCP_ACFC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Address and Control Field Compression.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_SSHF"></a><a id="ppp_lcp_sshf"></a><dl>
     * <dt><b>PPP_LCP_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Short Sequence Number Header Format.
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
     * @type {Integer}
     */
    dwLcpOptions {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * A value that specifies information about LCP options in use by the remote server. This member is a combination of the following flags.
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
     * The connection is using Protocol Field Compression.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_ACFC_"></a><a id="ppp_lcp_acfc_"></a><dl>
     * <dt><b>PPP_LCP_ACFC </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Address and Control Field Compression.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PPP_LCP_SSHF"></a><a id="ppp_lcp_sshf"></a><dl>
     * <dt><b>PPP_LCP_SSHF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The connection is using Short Sequence Number Header Format.
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
     * @type {Integer}
     */
    dwLcpRemoteOptions {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if the <b>dwAuthenticationProtocol</b> member is <b>PPP_LCP_EAP</b>.
     * @type {Integer}
     */
    dwEapTypeId {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * A value that specifies the type identifier of the inner EAP method used in the EAP authentication. The value of this member is valid only if the <b>dwEapTypeId</b> member is set to PEAP defined in IANA-EAP.
     * @type {Integer}
     */
    dwEmbeddedEAPTypeId {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the remote server. The value of this member is valid only if the <b>dwRemoteAuthenticationProtocol</b> member is <b>PPP_LCP_EAP</b>.
     * @type {Integer}
     */
    dwRemoteEapTypeId {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * A value that specifies the result of PPP CCP negotiation. A value of 0 indicates CCP has been negotiated successfully. A nonzero value indicates failure, and represents the fatal error that occurred during the control protocol negotiation.
     * @type {Integer}
     */
    dwCcpError {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

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
     * Microsoft Point-to-Point Compression (MPPC) Protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_STAC"></a><a id="rasccpca_stac"></a><dl>
     * <dt><b>RASCCPCA_STAC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * STAC option 4.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCompressionAlgorithm {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * A value that specifies the compression types available on the local client. The following types are supported.
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
     * @type {Integer}
     */
    dwCcpOptions {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * A value that specifies the compression algorithm used by the remote server. The following algorithms are supported.
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
     * Microsoft Point-to-Point Compression (MPPC) Protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASCCPCA_STAC"></a><a id="rasccpca_stac"></a><dl>
     * <dt><b>RASCCPCA_STAC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * STAC option 4.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwRemoteCompressionAlgorithm {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * A value that specifies the compression types available on the remote server. The following types are supported.
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
     * @type {Integer}
     */
    dwCcpRemoteOptions {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }
}

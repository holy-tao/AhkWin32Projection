#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information obtained during Internet Key Exchange (IKE) negotiation. (IKEV2_PROJECTION_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ikev2_projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct IKEV2_PROJECTION_INFO {
    #StructPack 8

    /**
     * A value that specifies the result of IPv4 negotiation. A value of zero indicates an IPv4 address has been assigned successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
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
     * A value that specifies the IPv4 subinterface   index corresponding to the connection on the server.
     */
    IPv4SubInterfaceIndex : Int64

    /**
     * A value that specifies the result of IPv6 negotiation. A value of zero indicates an IPv6 address has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
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
     * Not used.
     */
    dwOptions : UInt32

    /**
     * A value that specifies the authentication protocol used to authenticate the remote server. The following authentication protocols are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_IKEV2_AUTH_USING_CERT"></a><a id="mprapi_ikev2_auth_using_cert"></a><dl>
     * <dt><b>MPRAPI_IKEV2_AUTH_USING_CERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * X.509 Public Key Infrastructure
     *                       Certificate (<a href="https://www.ietf.org/rfc/rfc2459.txt">RFC 2459</a>)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_IKEV2_AUTH_USING_EAP"></a><a id="mprapi_ikev2_auth_using_eap"></a><dl>
     * <dt><b>MPRAPI_IKEV2_AUTH_USING_EAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extensible Authentication Protocol
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwAuthenticationProtocol : UInt32

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if <b>dwAuthenticationProtocol</b> is <b>MPRAPI_IKEV2_AUTH_USING_EAP</b>.
     */
    dwEapTypeId : UInt32

    /**
     * Not used.
     */
    dwCompressionAlgorithm : UInt32

    /**
     * A value that specifies the encryption method used in the connection. The following encryption methods are supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TYPE_3DES"></a><a id="ipsec_cipher_type_3des"></a><dl>
     * <dt><b>IPSEC_CIPHER_TYPE_3DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 3DES encryption
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TYPE_AES_128"></a><a id="ipsec_cipher_type_aes_128"></a><dl>
     * <dt><b>IPSEC_CIPHER_TYPE_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-128 encryption
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TYPE_AES_192"></a><a id="ipsec_cipher_type_aes_192"></a><dl>
     * <dt><b>IPSEC_CIPHER_TYPE_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-192 encryption
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TYPE_AES_256"></a><a id="ipsec_cipher_type_aes_256"></a><dl>
     * <dt><b>IPSEC_CIPHER_TYPE_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-256 encryption
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwEncryptionMethod : UInt32

}

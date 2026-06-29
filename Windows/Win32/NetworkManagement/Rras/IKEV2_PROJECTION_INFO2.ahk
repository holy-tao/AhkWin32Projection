#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information obtained during Internet Key Exchange (IKE) negotiation. (IKEV2_PROJECTION_INFO2)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ikev2_projection_info2
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct IKEV2_PROJECTION_INFO2 {
    #StructPack 8

    /**
     * A value that specifies the result of IPv4 negotiation. A value of zero indicates an IPv4 address has been assigned successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
     */
    dwIPv4NegotiationError : UInt32

    /**
     * An null-terminated Unicode string that specifies the IPv4 address of the local client. The string has the form "a.b.c.d". The <b>wszAddress</b> member is valid only if the <b>dwIPv4NegotiationError</b> member is 0.
     */
    wszAddress : WCHAR[16]

    /**
     * A null-terminated Unicode string that specifies the IPv4 address of the remote server. This string has the form "a.b.c.d". The <b>wszRemoteAddress</b> member is valid only if the <b>dwIPv4NegotiationError</b> member is zero. If the address is not available, this member is an empty string.
     */
    wszRemoteAddress : WCHAR[16]

    /**
     * A value that specifies the IPv4 subinterface index corresponding to the connection on the server.
     */
    IPv4SubInterfaceIndex : Int64

    /**
     * A value that specifies the result of IPv6 negotiation. A value of 0 indicates an IPv6 address has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
     */
    dwIPv6NegotiationError : UInt32

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the client. The last 64-bits of a 128-bit IPv6 internet address are considered the interface identifier, which provides a strong level of uniqueness for the preceding 64-bits. The <b>bInterfaceIdentifier</b> member is valid only if the <b>dwIPv6NegotiationError</b> member is 0. The <i>bInterfaceIdentifier</i> member must not be 0.
     */
    bInterfaceIdentifier : Int8[8]

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the server. The last 64 bits of a 128-bit IPv6 internet address are considered the interface identifier, which provides a strong level of uniqueness for the preceding 64 bits. The <b>bInterfaceIdentifier</b> member must not be 0 and is valid only if the <b>dwIPv6NegotiationError</b> member  is zero.
     */
    bRemoteInterfaceIdentifier : Int8[8]

    /**
     * A value that specifies the client interface IPv6 address prefix.
     */
    bPrefix : Int8[8]

    /**
     * A value that specifies the length, in bits, of the <b>bPrefix</b> member.
     */
    dwPrefixLength : UInt32

    /**
     * A value that specifies the IPv6 subinterface index corresponding to the connection on the server.
     */
    IPv6SubInterfaceIndex : Int64

    /**
     * Not implemented.
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
     * X.509 Public Key Infrastructure Certificate (described in RFC 2459)
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
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if the <b>dwAuthenticationProtocol</b> member is <b>MPRAPI_IKEV2_AUTH_USING_EAP</b>.
     */
    dwEapTypeId : UInt32

    /**
     * A value that specifies the type identifier of the inner EAP method used in the EAP authentication. The value of this member is valid only if the <b>dwEapTypeId</b> member is set to <b>PEAP</b> defined in IANA-EAP.
     */
    dwEmbeddedEAPTypeId : UInt32

    /**
     * Not implemented.
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

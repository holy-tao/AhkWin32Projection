#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information obtained during Internet Key Exchange (IKE) negotiation.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ikev2_projection_info2
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class IKEV2_PROJECTION_INFO2 extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * A value that specifies the result of IPv4 negotiation. A value of zero indicates an IPv4 address has been assigned successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
     * @type {Integer}
     */
    dwIPv4NegotiationError {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An null-terminated Unicode string that specifies the IPv4 address of the local client. The string has the form "a.b.c.d". The <b>wszAddress</b> member is valid only if the <b>dwIPv4NegotiationError</b> member is 0.
     * @type {String}
     */
    wszAddress {
        get => StrGet(this.ptr + 4, 15, "UTF-16")
        set => StrPut(value, this.ptr + 4, 15, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that specifies the IPv4 address of the remote server. This string has the form "a.b.c.d". The <b>wszRemoteAddress</b> member is valid only if the <b>dwIPv4NegotiationError</b> member is zero. If the address is not available, this member is an empty string.
     * @type {String}
     */
    wszRemoteAddress {
        get => StrGet(this.ptr + 36, 15, "UTF-16")
        set => StrPut(value, this.ptr + 36, 15, "UTF-16")
    }

    /**
     * A value that specifies the IPv4 subinterface index corresponding to the connection on the server.
     * @type {Integer}
     */
    IPv4SubInterfaceIndex {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A value that specifies the result of IPv6 negotiation. A value of 0 indicates an IPv6 address has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
     * @type {Integer}
     */
    dwIPv6NegotiationError {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the client. The last 64-bits of a 128-bit IPv6 internet address are considered the interface identifier, which provides a strong level of uniqueness for the preceding 64-bits. The <b>bInterfaceIdentifier</b> member is valid only if the <b>dwIPv6NegotiationError</b> member is 0. The <i>bInterfaceIdentifier</i> member must not be 0.
     * @type {Array<Byte>}
     */
    bInterfaceIdentifier{
        get {
            if(!this.HasProp("__bInterfaceIdentifierProxyArray"))
                this.__bInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 84, 8, Primitive, "char")
            return this.__bInterfaceIdentifierProxyArray
        }
    }

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the server. The last 64 bits of a 128-bit IPv6 internet address are considered the interface identifier, which provides a strong level of uniqueness for the preceding 64 bits. The <b>bInterfaceIdentifier</b> member must not be 0 and is valid only if the <b>dwIPv6NegotiationError</b> member  is zero.
     * @type {Array<Byte>}
     */
    bRemoteInterfaceIdentifier{
        get {
            if(!this.HasProp("__bRemoteInterfaceIdentifierProxyArray"))
                this.__bRemoteInterfaceIdentifierProxyArray := Win32FixedArray(this.ptr + 92, 8, Primitive, "char")
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
                this.__bPrefixProxyArray := Win32FixedArray(this.ptr + 100, 8, Primitive, "char")
            return this.__bPrefixProxyArray
        }
    }

    /**
     * A value that specifies the length, in bits, of the <b>bPrefix</b> member.
     * @type {Integer}
     */
    dwPrefixLength {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * A value that specifies the IPv6 subinterface index corresponding to the connection on the server.
     * @type {Integer}
     */
    IPv6SubInterfaceIndex {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Not implemented.
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

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
     * @type {Integer}
     */
    dwAuthenticationProtocol {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if the <b>dwAuthenticationProtocol</b> member is <b>MPRAPI_IKEV2_AUTH_USING_EAP</b>.
     * @type {Integer}
     */
    dwEapTypeId {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * A value that specifies the type identifier of the inner EAP method used in the EAP authentication. The value of this member is valid only if the <b>dwEapTypeId</b> member is set to <b>PEAP</b> defined in IANA-EAP.
     * @type {Integer}
     */
    dwEmbeddedEAPTypeId {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * Not implemented.
     * @type {Integer}
     */
    dwCompressionAlgorithm {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

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
     * @type {Integer}
     */
    dwEncryptionMethod {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }
}

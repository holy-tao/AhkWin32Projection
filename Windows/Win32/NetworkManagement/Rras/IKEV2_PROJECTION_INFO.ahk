#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information obtained during Internet Key Exchange (IKE) negotiation. (IKEV2_PROJECTION_INFO)
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ikev2_projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class IKEV2_PROJECTION_INFO extends Win32Struct
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
     * An array that contains a Unicode string that specifies the IPv4 address of the local client. This string has the form "a.b.c.d". <b>wszAddress</b> is valid only if <b>dwIPv4NegotiationError</b> is zero.
     * @type {String}
     */
    wszAddress {
        get => StrGet(this.ptr + 4, 15, "UTF-16")
        set => StrPut(value, this.ptr + 4, 15, "UTF-16")
    }

    /**
     * An array that contains a Unicode string that specifies the IPv4 address of the remote server. This string has the form "a.b.c.d". <b>wszRemoteAddress</b> is valid only if <b>dwIPv4NegotiationError</b> is zero. If the address is not available, this member is an empty string.
     * @type {String}
     */
    wszRemoteAddress {
        get => StrGet(this.ptr + 36, 15, "UTF-16")
        set => StrPut(value, this.ptr + 36, 15, "UTF-16")
    }

    /**
     * A value that specifies the IPv4 subinterface   index corresponding to the connection on the server.
     * @type {Integer}
     */
    IPv4SubInterfaceIndex {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * A value that specifies the result of IPv6 negotiation. A value of zero indicates an IPv6 address has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
     * @type {Integer}
     */
    dwIPv6NegotiationError {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * An array that specifies the 64-bit IPv6 interface identifier of the client. The last 64 bits of a 128-bit IPv6 internet address are considered the "interface identifier," which provides a strong level of uniqueness for the preceding 64-bits. <b>bInterfaceIdentifier</b> is valid only if <b>dwIPv6NegotiationError</b> is zero and must not be zero.
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
     * An array that specifies the 64-bit IPv6 interface identifier of the server. The last 64 bits of a 128-bit IPv6 internet address are considered the "interface identifier," which provides a strong level of uniqueness for the preceding 64-bits. <b>bInterfaceIdentifier</b> is valid only if <b>dwIPv6NegotiationError</b> is zero and must not be zero.
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
     * A value that specifies the client interface IPv6  address prefix.
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
     * A value that specifies the length, in bits, of <b>bPrefix</b>.
     * @type {Integer}
     */
    dwPrefixLength {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * A value that specifies the IPv6 subinterface   index corresponding to the connection on the server.
     * @type {Integer}
     */
    IPv6SubInterfaceIndex {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Not used.
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
     * @type {Integer}
     */
    dwAuthenticationProtocol {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if <b>dwAuthenticationProtocol</b> is <b>MPRAPI_IKEV2_AUTH_USING_EAP</b>.
     * @type {Integer}
     */
    dwEapTypeId {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    dwCompressionAlgorithm {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
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
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}

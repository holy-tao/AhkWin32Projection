#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk

/**
 * Contains projection information obtained during Internet Key Exchange (IKE) negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ns-ras-rasikev2_projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASIKEV2_PROJECTION_INFO extends Win32Struct
{
    static sizeof => 96

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
     * A <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV4ADDR</a>  structure  that contains a null-terminated Unicode string that specifies the IPv4 address of the local client. This string has the form "a.b.c.d". <b>ipv4Address</b> is valid only if <b>dwIPv4NegotiationError</b> is zero.
     * @type {IN_ADDR}
     */
    ipv4Address{
        get {
            if(!this.HasProp("__ipv4Address"))
                this.__ipv4Address := IN_ADDR(this.ptr + 4)
            return this.__ipv4Address
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV4ADDR</a> structure  that contains a null-terminated Unicode string that specifies the IPv4 address of the remote server. This string has the form "a.b.c.d". <b>ipv4ServerAddress</b> is valid only if <b>dwIPv4NegotiationError</b> is zero. If the address is not available, this member is an empty string.
     * @type {IN_ADDR}
     */
    ipv4ServerAddress{
        get {
            if(!this.HasProp("__ipv4ServerAddress"))
                this.__ipv4ServerAddress := IN_ADDR(this.ptr + 8)
            return this.__ipv4ServerAddress
        }
    }

    /**
     * A value that specifies the result of IPv6 negotiation. A value of zero indicates an IPv6 address has been negotiated successfully. A nonzero value indicates failure, and is the fatal error that occurred during negotiation.
     * @type {Integer}
     */
    dwIPv6NegotiationError {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV6ADDR</a>  structure  that contains a null-terminated Unicode string that specifies the IPv6 address of the local client. <b>ipv6Address</b> is valid only if <b>dwIPv6NegotiationError</b> is zero.
     * @type {IN6_ADDR}
     */
    ipv6Address{
        get {
            if(!this.HasProp("__ipv6Address"))
                this.__ipv6Address := IN6_ADDR(this.ptr + 16)
            return this.__ipv6Address
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV6ADDR</a> structure  that contains a null-terminated Unicode string that specifies the IPv6 address of the remote server. <b>ipv6ServerAddress</b> is valid only if <b>dwIPv6NegotiationError</b> is zero. If the address is not available, this member is an empty string.
     * @type {IN6_ADDR}
     */
    ipv6ServerAddress{
        get {
            if(!this.HasProp("__ipv6ServerAddress"))
                this.__ipv6ServerAddress := IN6_ADDR(this.ptr + 32)
            return this.__ipv6ServerAddress
        }
    }

    /**
     * A value that specifies the length, in bits, of the IPv6 address prefix.
     * @type {Integer}
     */
    dwPrefixLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
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
     * <td width="40%"><a id="RASIKEv2_AUTH_MACHINECERTIFICATES"></a><a id="rasikev2_auth_machinecertificates"></a><a id="RASIKEV2_AUTH_MACHINECERTIFICATES"></a><dl>
     * <dt><b>RASIKEv2_AUTH_MACHINECERTIFICATES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * X.509 Public Key Infrastructure
     *                       Certificate (<a href="https://www.ietf.org/rfc/rfc2459.txt">RFC 2459</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RASIKEv2_AUTH_EAP"></a><a id="rasikev2_auth_eap"></a><a id="RASIKEV2_AUTH_EAP"></a><dl>
     * <dt><b>RASIKEv2_AUTH_EAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Extensible Authentication Protocol.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwAuthenticationProtocol {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * A value that specifies the type identifier of the Extensible Authentication Protocol (EAP) used to authenticate the local client. The value of this member is valid only if <b>dwAuthenticationProtocol</b> is <b>RASIKEv2_AUTH_EAP</b>.
     * @type {Integer}
     */
    dwEapTypeId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
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
     * 3DES encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TYPE_AES_128"></a><a id="ipsec_cipher_type_aes_128"></a><dl>
     * <dt><b>IPSEC_CIPHER_TYPE_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-128 encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TYPE_AES_192"></a><a id="ipsec_cipher_type_aes_192"></a><dl>
     * <dt><b>IPSEC_CIPHER_TYPE_AES_192</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-192 encryption.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IPSEC_CIPHER_TYPE_AES_256"></a><a id="ipsec_cipher_type_aes_256"></a><dl>
     * <dt><b>IPSEC_CIPHER_TYPE_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES-256 encryption.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwEncryptionMethod {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of available IPv4 addresses the server can switch to on the IKEv2 connection.
     * @type {Integer}
     */
    numIPv4ServerAddresses {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV4ADDR</a> structure that contains the available IPv4 addresses the server can switch to on the IKEv2 connection.
     * @type {Pointer<IN_ADDR>}
     */
    ipv4ServerAddresses {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The number of available IPv6 addresses the server can switch to on the IKEv2 connection.
     * @type {Integer}
     */
    numIPv6ServerAddresses {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/RRAS/remote-access-service-data-types">RASIPV6ADDR</a> structure that contains the available IPv6 addresses the server can switch to on the IKEv2 connection.
     * @type {Pointer<IN6_ADDR>}
     */
    ipv6ServerAddresses {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}

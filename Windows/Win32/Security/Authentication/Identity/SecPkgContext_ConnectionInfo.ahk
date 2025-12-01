#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecPkgContext_ConnectionInfo structure contains protocol and cipher information. This structure is used by the InitializeSecurityContext (Schannel) function.This attribute is supported only by the Schannel security support provider (SSP).
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_connectioninfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_ConnectionInfo extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Protocol used to establish this connection. The following table describes the constants valid for this member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL2_CLIENT"></a><a id="sp_prot_ssl2_client"></a><dl>
     * <dt><b>SP_PROT_SSL2_CLIENT</b></dt>
     * <dt>8 (0x8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 2.0 client-side. Superseded by SP_PROT_TLS1_CLIENT.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL2_SERVER"></a><a id="sp_prot_ssl2_server"></a><dl>
     * <dt><b>SP_PROT_SSL2_SERVER</b></dt>
     * <dt>4 (0x4)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 2.0 server-side. Superseded by SP_PROT_TLS1_SERVER.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL3_CLIENT"></a><a id="sp_prot_ssl3_client"></a><dl>
     * <dt><b>SP_PROT_SSL3_CLIENT</b></dt>
     * <dt>32 (0x20)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 3.0 client-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL3_SERVER"></a><a id="sp_prot_ssl3_server"></a><dl>
     * <dt><b>SP_PROT_SSL3_SERVER</b></dt>
     * <dt>16 (0x10)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 3.0 server-side.
     * </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_0_CLIENT"></a><a id="sp_prot_tls1_0_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_0_CLIENT</b></dt>
     * <dt>128 (0x80)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/t-gly">Transport Layer Security</a> 1.0 client-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_0_SERVER"></a><a id="sp_prot_tls1_0_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_0_SERVER</b></dt>
     * <dt>64 (0x40)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.0 server-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_1_CLIENT"></a><a id="sp_prot_tls1_1_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_1_CLIENT</b></dt>
     * <dt>512 (0x200)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.1 client-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_1_SERVER"></a><a id="sp_prot_tls1_1_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_1_SERVER</b></dt>
     * <dt>256 (0x100)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.1 server-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_2_CLIENT"></a><a id="sp_prot_tls1_2_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_2_CLIENT</b></dt>
     * <dt>2048 (0x800)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.2 client-side.
     * </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_2_SERVER"></a><a id="sp_prot_tls1_2_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_2_SERVER</b></dt>
     * <dt>1024 (0x400)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.2 server-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_3_CLIENT"></a><a id="sp_prot_tls1_3_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_3_CLIENT</b></dt>
     * <dt>2048 (0x2000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.3 client-side.
     * </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_3_SERVER"></a><a id="sp_prot_tls1_3_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_3_SERVER</b></dt>
     * <dt>1024 (0x1000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.3 server-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_0_CLIENT"></a><a id="sp_prot_dtls1_0_client"></a><dl>
     * <dt><b>SP_PROT_DTLS1_0_CLIENT</b></dt>
     * <dt>1024 (0x00020000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.0 client-side.
     * </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_0_SERVER"></a><a id="sp_prot_dtls1_0_server"></a><dl>
     * <dt><b>SP_PROT_DTLS1_0_SERVER</b></dt>
     * <dt>1024 (0x00010000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.0 server-side.
     * </td>
     * </tr>
     * 
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_2_CLIENT"></a><a id="sp_prot_dtls1_2_client"></a><dl>
     * <dt><b>SP_PROT_DTLS1_2_CLIENT</b></dt>
     * <dt>1024 (0x00080000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.2 client-side.
     * </td>
     * </tr>
     *  
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_2_SERVER"></a><a id="sp_prot_dtls1_2_server"></a><dl>
     * <dt><b>SP_PROT_DTLS1_2_SERVER</b></dt>
     * <dt>1024 (0x00040000)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.2 server-side.
     * </td>
     * </tr>
     * 
     * </table>
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Algorithm identifier (<a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a>) for the bulk encryption cipher used by this connection. The following table describes the constants valid for this member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_3DES"></a><a id="calg_3des"></a><dl>
     * <dt><b>CALG_3DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 3DES block encryption algorithm
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_AES_128"></a><a id="calg_aes_128"></a><dl>
     * <dt><b>CALG_AES_128</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES 128-bit encryption algorithm
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_AES_256"></a><a id="calg_aes_256"></a><dl>
     * <dt><b>CALG_AES_256</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * AES 256-bit encryption algorithm
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_DES"></a><a id="calg_des"></a><dl>
     * <dt><b>CALG_DES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DES encryption algorithm
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_RC2"></a><a id="calg_rc2"></a><dl>
     * <dt><b>CALG_RC2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RC2 block encryption algorithm
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_RC4"></a><a id="calg_rc4"></a><dl>
     * <dt><b>CALG_RC4</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RC4 stream encryption algorithm
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0__Zero_"></a><a id="0__zero_"></a><a id="0__ZERO_"></a><dl>
     * <dt><b>0 (Zero)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No encryption
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    aiCipher {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwCipherStrength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <b>ALG_ID</b> indicating the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/h-gly">hash</a> used for generating <a href="https://docs.microsoft.com/windows/desktop/SecGloss/m-gly">Message Authentication Codes</a> (MACs). The following table describes the constants valid for this member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_MD5"></a><a id="calg_md5"></a><dl>
     * <dt><b>CALG_MD5</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * MD5 hashing algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_SHA"></a><a id="calg_sha"></a><dl>
     * <dt><b>CALG_SHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * SHA hashing algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    aiHash {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Strength of the hash, in bits: 128 or 160.
     * @type {Integer}
     */
    dwHashStrength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>ALG_ID</b> indicating the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key exchange algorithm</a> used to generate the shared master secret. The following table describes the constants valid for this member.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_RSA_KEYX"></a><a id="calg_rsa_keyx"></a><dl>
     * <dt><b>CALG_RSA_KEYX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * RSA key exchange.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CALG_DH_EPHEM"></a><a id="calg_dh_ephem"></a><dl>
     * <dt><b>CALG_DH_EPHEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Diffie-Hellman key exchange.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    aiExch {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    dwExchStrength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the data for an Schannel credential. (SCHANNEL_CRED)
 * @remarks
 * The following certificate revocation flags are mutually exclusive.
  * 
  * 
  * 
  * 
  * <ul>
  * <li>SCH_CRED_REVOCATION_CHECK_CHAIN</li>
  * <li>SCH_CRED_REVOCATION_CHECK_END_CERT</li>
  * <li>SCH_CRED_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT</li>
  * </ul>
  * 
  * 
  * 
  * To customize certificate revocation error reporting for Schannel, use the following flags:
  * 
  * <ul>
  * <li>SCH_CRED_IGNORE_NO_REVOCATION_CHECK</li>
  * <li>SCH_CRED_IGNORE_REVOCATION_OFFLINE</li>
  * </ul>
  * 
  * 
  * When Schannel checks the revocation status of a certificate chain, these flags instruct it to ignore any CRYPT_E_NO_REVOCATION_CHECK and CRYPT_E_REVOCATION_OFFLINE errors, respectively. These flags are ignored if no certificate revocation flag is set.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_cred
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCHANNEL_CRED extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Set to SCHANNEL_CRED_VERSION.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of structures in the <b>paCred</b> array.
     * @type {Integer}
     */
    cCreds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structures. Each pointer specifies a certificate that contains a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> to be used in authenticating the application. Typically, this array contains one structure for each key exchange method supported by the application.
     * 
     * Client applications often pass in an empty list and either depend on Schannel to find an appropriate certificate or create a certificate later if needed.
     * @type {Pointer<CERT_CONTEXT>}
     */
    paCred {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional. Valid for server applications only. Handle to a certificate store that contains self-signed <a href="https://docs.microsoft.com/windows/desktop/SecGloss/r-gly">root certificates</a> for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authorities</a> (CAs) trusted by the application. This member is used only by server-side applications that require client authentication.
     * @type {Pointer<Void>}
     */
    hRootStore {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    cMappers {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved.
     * @type {Pointer<IntPtr>}
     */
    aphMappers {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Number of algorithms in the <b>palgSupportedAlgs</b> array.
     * @type {Integer}
     */
    cSupportedAlgs {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Optional. A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> algorithm identifiers that represent the algorithms supported by connections made with credentials acquired using this structure. If <b>cSupportedAlgs</b> is zero or <b>palgSupportedAlgs</b> is <b>NULL</b>, Schannel uses the system defaults.
     * 
     * Currently, the algorithm identifiers <b>CALG_AES</b>,
     * <b>CALG_AES_128</b>, and
     * <b>CALG_AES_256</b> are not supported.
     * @type {Pointer<UInt32>}
     */
    palgSupportedAlgs {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Optional. A <b>DWORD</b> that contains a bit string that represents the protocols supported by connections made with credentials acquired by using this structure. If this member is zero, Schannel selects the protocol. For new development, applications should set <b>grbitEnabledProtocols</b> to zero and use the protocol versions enabled on the system by default.
     * 
     * This member is used only by the Microsoft Unified Security Protocol Provider <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security package</a>.
     * 
     * The global system registry settings take precedence over this value. For example, if SSL3 is disabled in the registry, it cannot be enabled using this member.
     * 
     * This member can contain any of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_PCT1_SERVER"></a><a id="sp_prot_pct1_server"></a><dl>
     * <dt><b>SP_PROT_PCT1_SERVER</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Private Communications Technology 1.0 server side.
     * 
     * <div class="alert"><b>Note</b> Obsolete.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_PCT1_CLIENT"></a><a id="sp_prot_pct1_client"></a><dl>
     * <dt><b>SP_PROT_PCT1_CLIENT</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Private Communications Technology 1.0 client side. 
     * 
     * <div class="alert"><b>Note</b> Obsolete.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL2_SERVER"></a><a id="sp_prot_ssl2_server"></a><dl>
     * <dt><b>SP_PROT_SSL2_SERVER</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 2.0 server side. Superseded by SP_PROT_TLS1_SERVER.
     * 
     * <div class="alert"><b>Important</b>  Secure Sockets Layer 2.0 and Transport Layer Security 1.2 flags are mutually exclusive.</div>
     * <div> </div>
     * <b>Windows 10, version 1607 and Windows Server 2016.:  </b>Support ends.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL2_CLIENT"></a><a id="sp_prot_ssl2_client"></a><dl>
     * <dt><b>SP_PROT_SSL2_CLIENT</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 2.0 client side. Superseded by SP_PROT_TLS1_CLIENT.
     * 
     * <div class="alert"><b>Important</b>  Secure Sockets Layer 2.0 and Transport Layer Security 1.2 flags are mutually exclusive.</div>
     * <div> </div>
     * <b>Windows 10, version 1607 and Windows Server 2016.:  </b>Support ends.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL3_SERVER"></a><a id="sp_prot_ssl3_server"></a><dl>
     * <dt><b>SP_PROT_SSL3_SERVER</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 3.0 server side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_SSL3_CLIENT"></a><a id="sp_prot_ssl3_client"></a><dl>
     * <dt><b>SP_PROT_SSL3_CLIENT</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Secure Sockets Layer 3.0 client side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_SERVER"></a><a id="sp_prot_tls1_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_SERVER</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.0 server side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_CLIENT"></a><a id="sp_prot_tls1_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_CLIENT</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.0 client side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_0_SERVER"></a><a id="sp_prot_tls1_0_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_0_SERVER</b></dt>
     * <dt>SP_PROT_TLS1_SERVER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.0 server side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_0_CLIENT"></a><a id="sp_prot_tls1_0_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_0_CLIENT</b></dt>
     * <dt>SP_PROT_TLS1_CLIENT</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.0 client side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_1_SERVER"></a><a id="sp_prot_tls1_1_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_1_SERVER</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.1 server side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_1_CLIENT"></a><a id="sp_prot_tls1_1_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_1_CLIENT</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.1 client side.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_2_SERVER"></a><a id="sp_prot_tls1_2_server"></a><dl>
     * <dt><b>SP_PROT_TLS1_2_SERVER</b></dt>
     * <dt>0x00000400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.2 server side.
     * 
     * <div class="alert"><b>Important</b>  Secure Sockets Layer 2.0 and Transport Layer Security 1.2 flags are mutually exclusive.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_TLS1_2_CLIENT"></a><a id="sp_prot_tls1_2_client"></a><dl>
     * <dt><b>SP_PROT_TLS1_2_CLIENT</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Transport Layer Security 1.2 client side.
     * 
     * <div class="alert"><b>Important</b>  Secure Sockets Layer 2.0 and Transport Layer Security 1.2 flags are mutually exclusive.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS_SERVER"></a><a id="sp_prot_dtls_server"></a><dl>
     * <dt><b>SP_PROT_DTLS_SERVER</b></dt>
     * <dt>0x00010000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security server side.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS_CLIENT"></a><a id="sp_prot_dtls_client"></a><dl>
     * <dt><b>SP_PROT_DTLS_CLIENT</b></dt>
     * <dt>0x00020000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security client side.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_0_SERVER"></a><a id="sp_prot_dtls1_0_server"></a><dl>
     * <dt><b>SP_PROT_DTLS1_0_SERVER</b></dt>
     * <dt>SP_PROT_DTLS1_SERVER</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.0 server side.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_0_CLIENT"></a><a id="sp_prot_dtls1_0_client"></a><dl>
     * <dt><b>SP_PROT_DTLS1_0_CLIENT</b></dt>
     * <dt>SP_PROT_DTLS1_CLIENT</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.0 client side.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_2_SERVER"></a><a id="sp_prot_dtls1_2_server"></a><dl>
     * <dt><b>SP_PROT_DTLS1_2_SERVER</b></dt>
     * <dt>0x00040000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.2 server side.
     * 
     * <b>Windows 10, version 1607 and Windows Server 2016.:  </b>Support added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_2_CLIENT"></a><a id="sp_prot_dtls1_2_client"></a><dl>
     * <dt><b>SP_PROT_DTLS1_2_CLIENT</b></dt>
     * <dt>0x00080000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security 1.2 client side.
     * 
     * <b>Windows 10, version 1607 and Windows Server 2016.:  </b>Support added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_X_SERVER"></a><a id="sp_prot_dtls1_x_server"></a><dl>
     * <dt><b>SP_PROT_DTLS1_X_SERVER</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security all supported versions server side.
     * 
     * <b>Windows 10, version 1607 and Windows Server 2016.:  </b>Support added.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SP_PROT_DTLS1_X_CLIENT"></a><a id="sp_prot_dtls1_x_client"></a><dl>
     * <dt><b>SP_PROT_DTLS1_X_CLIENT</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Datagram Transport Layer Security all supported versions client side.
     * 
     * <b>Windows 10, version 1607 and Windows Server 2016.:  </b>Support added.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    grbitEnabledProtocols {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Minimum bulk encryption cipher strength, in bits, allowed for connections.
     * 
     * If this member is zero, Schannel uses the system default. If this member is –1, only the SSL3/TLS MAC–only cipher suites (also known as <b>NULL</b> cipher) are enabled.
     * @type {Integer}
     */
    dwMinimumCipherStrength {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Maximum bulk encryption cipher strength, in bits, allowed for connections.
     * 
     * If this member is zero, Schannel uses the system default.
     * 
     * If this member is –1, only the SSL3/TLS MAC–only cipher suites (also known as <b>NULL</b> cipher) are enabled. In this case, <i>dwMinimumCipherStrength</i> must be set to –1.
     * @type {Integer}
     */
    dwMaximumCipherStrength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of milliseconds that Schannel keeps the session in its session cache. After this time has passed, any new connections between the client and the server require a new Schannel  session. Set the value of this member to zero to use the default value of 36000000 milliseconds (ten hours).
     * @type {Integer}
     */
    dwSessionLifespan {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Kernel-mode Schannel supports the following values.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003, Windows XP and Windows XP/2000:  </b>This flag is not supported and must be zero.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCH_CRED_FORMAT_CERT_HASH"></a><a id="sch_cred_format_cert_hash"></a><dl>
     * <dt><b>SCH_CRED_FORMAT_CERT_HASH</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>paCred</b> member  of the <b>SCHANNEL_CRED</b> structure passed in must be a pointer to a byte array of length 20 that contains the certificate thumbprint. The certificate is assumed to be in the "MY" store of the local computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCH_CRED_FORMAT_CERT_HASH_STORE"></a><a id="sch_cred_format_cert_hash_store"></a><dl>
     * <dt><b>SCH_CRED_FORMAT_CERT_HASH_STORE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>paCred</b> member  of the <b>SCHANNEL_CRED</b> structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_cert_hash_store">SCHANNEL_CERT_HASH_STORE</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCredFormat {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}

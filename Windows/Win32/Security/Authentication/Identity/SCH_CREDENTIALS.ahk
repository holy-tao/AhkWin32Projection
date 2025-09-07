#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\Cryptography\HCERTSTORE.ahk

/**
 * Contains the data for an Schannel credential. (SCH_CREDENTIALS)
 * @remarks
 * To use the SCH_CREDENTIALS structure, define SCHANNEL_USE_BLACKLISTS along with UNICODE_STRING and PUNICODE_STRING. Alternatively, include Ntdef.h, SubAuth.h or Winternl.h.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-sch_credentials
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SCH_CREDENTIALS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Set to SCH_CREDENTIALS_VERSION.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
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
     * The <b>paCred</b> member  of the <b>SCH_CREDENTIALS</b> structure passed in must be a pointer to a byte array of length 20 that contains the certificate thumbprint. The certificate is assumed to be in the "MY" store of the local computer.
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
     * The <b>paCred</b> member  of the <b>SCH_CREDENTIALS</b> structure points to a <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_cert_hash_store">SCHANNEL_CERT_HASH_STORE</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCredFormat {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of structures in the paCred array.
     * @type {Integer}
     */
    cCreds {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of pointers to CERT_CONTEXT structures. Each pointer specifies a certificate that contains a private key to be used in authenticating the application. 
     * 
     * Client applications often pass in an empty list and either depend on Schannel to find an appropriate certificate or create a certificate later if needed.
     * @type {Pointer<CERT_CONTEXT>}
     */
    paCred {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * *Optional.* Valid for server applications only. Handle to a certificate store that contains self-signed root certificates for certification authorities (CAs) trusted by the application. This member is used only by server-side applications that require client authentication.
     * @type {HCERTSTORE}
     */
    hRootStore{
        get {
            if(!this.HasProp("__hRootStore"))
                this.__hRootStore := HCERTSTORE(this.ptr + 24)
            return this.__hRootStore
        }
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    cMappers {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved.
     * @type {Pointer<IntPtr>}
     */
    aphMappers {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The number of milliseconds that Schannel keeps the session in its session cache. After this time has passed, any new connections between the client and the server require a new Schannel session. Set the value of this member to zero to use the default value of 36000000 milliseconds (ten hours).
     * @type {Integer}
     */
    dwSessionLifespan {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The count of entries in the pTlsParameters array.
     * 
     * It is an error to specify more than SCH_CRED_MAX_SUPPORTED_PARAMETERS.
     * @type {Integer}
     */
    cTlsParameters {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Array of pointers to the [TLS_PARAMETERS](/windows/win32/api/schannel/ns-schannel-tls_parameters) structures that indicate TLS parameter restrictions, if any. If no restrictions are specified, the system defaults are used. It is recommended that applications rely on the system defaults.
     * 
     * It is an error to include more than one [TLS_PARAMETERS](/windows/win32/api/schannel/ns-schannel-tls_parameters) structure with cAlpnIds == 0 and rgstrAlpnIds == NULL.
     * @type {Pointer<TLS_PARAMETERS>}
     */
    pTlsParameters {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}

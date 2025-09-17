#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CRYPT_ALGORITHM_IDENTIFIER.ahk
#Include .\OCSP_CERT_ID.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains the current certificate status for a single certificate.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ocsp_basic_response_entry
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_BASIC_RESPONSE_ENTRY extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_cert_id">OCSP_CERT_ID</a> structure that specifies the target certificate of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">online certificate status protocol</a> (OCSP) response.
     * @type {OCSP_CERT_ID}
     */
    CertId{
        get {
            if(!this.HasProp("__CertId"))
                this.__CertId := OCSP_CERT_ID(this.ptr + 0)
            return this.__CertId
        }
    }

    /**
     * A value that indicates the target certificate revocation status.
     * 
     * 
     * <a href="https://www.ietf.org/rfc/rfc2560.txt">RFC 2560</a> defines the following possible values for certificate status.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_BASIC_GOOD_CERT_STATUS"></a><a id="ocsp_basic_good_cert_status"></a><dl>
     * <dt><b>OCSP_BASIC_GOOD_CERT_STATUS</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is not revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_BASIC_REVOKED_CERT_STATUS"></a><a id="ocsp_basic_revoked_cert_status"></a><dl>
     * <dt><b>OCSP_BASIC_REVOKED_CERT_STATUS</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate is revoked either permanently or temporarily.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OCSP_BASIC_UNKNOWN_CERT_STATUS"></a><a id="ocsp_basic_unknown_cert_status"></a><dl>
     * <dt><b>OCSP_BASIC_UNKNOWN_CERT_STATUS</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The responder has no information for the target certificate.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCertStatus {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer<TypeHandle>}
     */
    Anonymous {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The date and time at which the response indicated by <i>dwCertStatus</i> is known to be correct.
     * @type {FILETIME}
     */
    ThisUpdate{
        get {
            if(!this.HasProp("__ThisUpdate"))
                this.__ThisUpdate := FILETIME(this.ptr + 88)
            return this.__ThisUpdate
        }
    }

    /**
     * The date and time on or before which newer information will be available for the certificate status. A value of zero indicates that the certificate status never expires.
     * @type {FILETIME}
     */
    NextUpdate{
        get {
            if(!this.HasProp("__NextUpdate"))
                this.__NextUpdate := FILETIME(this.ptr + 96)
            return this.__NextUpdate
        }
    }

    /**
     * The number of elements in the <b>rgExtension</b> array.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * An array of pointers to  <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains additional information about the response.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}

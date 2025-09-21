#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk
#Include .\CERT_ALT_NAME_ENTRY.ahk

/**
 * The CERT_ACCESS_DESCRIPTION structure is a member of a CERT_AUTHORITY_INFO_ACCESS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_access_description
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_ACCESS_DESCRIPTION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) for the method of access.
     * 
     * The following are currently defined PKIX Access Method OIDs:
     * 
     * <ul>
     * <li>szOID_PKIX_CA_ISSUERS</li>
     * <li>szOID_PKIX_CA_REPOSITORY</li>
     * <li>szOID_PKIX_OCSP</li>
     * <li>szOID_PKIX_TIME_STAMPING</li>
     * </ul>
     * The default provider does not support the szOID_PKIX_TIME_STAMPING method.
     * @type {Pointer<Byte>}
     */
    pszAccessMethod {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> structure that describes the online status server and the access protocol to obtain current certificate status information for the certificate containing the extension. 
     * 
     * 
     * 
     * 
     * For the szOID_PKIX_OCSP access method, <b>AccessLocation</b> describes the online status server and the access protocol needed to obtain status information about the certificate containing this extension.
     * 
     * For the szOID_PKIX_CA_ISSUERS access method, <b>AccessLocation</b> obtains information on the CAs that issued certificates superior to the CA that issued the certificate containing this extension. The CA issuer's description is intended to aid certificate users in the selection of a certification path that terminates at a point trusted by the certificate user.
     * 
     * For the szOID_PKIX_CA_REPOSITORY method, <b>AccessLocation</b> specifies either the URI, directory name, or email address of the certificate and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL) repository for a  subject that is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA).
     * @type {CERT_ALT_NAME_ENTRY}
     */
    AccessLocation{
        get {
            if(!this.HasProp("__AccessLocation"))
                this.__AccessLocation := CERT_ALT_NAME_ENTRY(this.ptr + 8)
            return this.__AccessLocation
        }
    }
}

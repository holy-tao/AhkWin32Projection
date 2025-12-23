#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_ALT_NAME_INFO.ahk
#Include .\CRL_DIST_POINT_NAME.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * Identifies a single certificate revocation list (CRL) distribution point that a certificate user can reference to determine whether certificates have been revoked.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_dist_point
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRL_DIST_POINT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_dist_point_name">CRL_DIST_POINT_NAME</a> structure that identifies the location of a CRL source. If <b>NULL</b>, the distribution point name defaults to the <b>CRLIssuer</b> name.
     * @type {CRL_DIST_POINT_NAME}
     */
    DistPointName{
        get {
            if(!this.HasProp("__DistPointName"))
                this.__DistPointName := CRL_DIST_POINT_NAME(0, this)
            return this.__DistPointName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> that contains a byte that indicates the revocation reasons covered by the CRL. 
     * 
     * 
     * 
     * 
     * If <b>NULL</b>, the indicated CRL distribution point distributes a CRL that will contain an entry for this certificate if this certificate has been revoked, regardless of the revocation reason.
     * 
     * The following are currently defined <b>ReasonFlags</b> values. For revocations of several reasons, combine these <b>ReasonFlags</b> by using a bitwise-<b>OR</b> operation.
     * 
     * 
     * <ul>
     * <li>CRL_REASON_UNUSED_FLAG</li>
     * <li>CRL_REASON_KEY_COMPROMISE_FLAG</li>
     * <li>CRL_REASON_CA_COMPROMISE_FLAG</li>
     * <li>CRL_REASON_AFFILIATION_CHANGED_FLAG</li>
     * <li>CRL_REASON_SUPERSEDED_FLAG</li>
     * <li>CRL_REASON_CESSATION_OF_OPERATION_FLAG</li>
     * <li>CRL_REASON_CERTIFICATE_HOLD_FLAG</li>
     * </ul>
     * @type {CRYPT_BIT_BLOB}
     */
    ReasonFlags{
        get {
            if(!this.HasProp("__ReasonFlags"))
                this.__ReasonFlags := CRYPT_BIT_BLOB(24, this)
            return this.__ReasonFlags
        }
    }

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_info">CERT_ALT_NAME_INFO</a> that identifies the authority that issued and signed the CRL. If <b>NULL</b>, the issuer name defaults to the issuer name of the certificate.
     * @type {CERT_ALT_NAME_INFO}
     */
    CRLIssuer{
        get {
            if(!this.HasProp("__CRLIssuer"))
                this.__CRLIssuer := CERT_ALT_NAME_INFO(48, this)
            return this.__CRLIssuer
        }
    }
}

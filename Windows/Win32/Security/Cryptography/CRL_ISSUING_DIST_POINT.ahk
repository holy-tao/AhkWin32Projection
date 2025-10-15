#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_ALT_NAME_INFO.ahk
#Include .\CRL_DIST_POINT_NAME.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\CRYPT_BIT_BLOB.ahk

/**
 * Contains information about the kinds of certificates listed in a certificate revocation list (CRL).
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crl_issuing_dist_point
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRL_ISSUING_DIST_POINT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Optional 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crl_dist_point_name">CRL_DIST_POINT_NAME</a> member.
     * @type {CRL_DIST_POINT_NAME}
     */
    DistPointName{
        get {
            if(!this.HasProp("__DistPointName"))
                this.__DistPointName := CRL_DIST_POINT_NAME(this.ptr + 0)
            return this.__DistPointName
        }
    }

    /**
     * <b>BOOL</b> flag. <b>TRUE</b> if only user certificates are contained in the CRL.
     * @type {BOOL}
     */
    fOnlyContainsUserCerts{
        get {
            if(!this.HasProp("__fOnlyContainsUserCerts"))
                this.__fOnlyContainsUserCerts := BOOL(this.ptr + 24)
            return this.__fOnlyContainsUserCerts
        }
    }

    /**
     * <b>BOOL</b> flag. <b>TRUE</b> if only CA certificates are contained in the CRL.
     * @type {BOOL}
     */
    fOnlyContainsCACerts{
        get {
            if(!this.HasProp("__fOnlyContainsCACerts"))
                this.__fOnlyContainsCACerts := BOOL(this.ptr + 28)
            return this.__fOnlyContainsCACerts
        }
    }

    /**
     * Optional 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_bit_blob">CRYPT_BIT_BLOB</a> with bits indicating some reasons for certificate revocation.
     * @type {CRYPT_BIT_BLOB}
     */
    OnlySomeReasonFlags{
        get {
            if(!this.HasProp("__OnlySomeReasonFlags"))
                this.__OnlySomeReasonFlags := CRYPT_BIT_BLOB(this.ptr + 32)
            return this.__OnlySomeReasonFlags
        }
    }

    /**
     * <b>BOOL</b> flag. <b>TRUE</b> if this is an indirect CRL.
     * @type {BOOL}
     */
    fIndirectCRL{
        get {
            if(!this.HasProp("__fIndirectCRL"))
                this.__fIndirectCRL := BOOL(this.ptr + 56)
            return this.__fIndirectCRL
        }
    }
}

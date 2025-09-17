#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is passed in calls to the CertVerifyRevocation function to assist in finding the issuer of the context to be verified.
 * @remarks
 * The <b>CERT_REVOCATION_PARA</b> structure provides additional information that the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a> function can use to determine the context issuer.
  * 
  *  If your application must check the freshness of the CRL or resynchronize the CRL cache, you can provide extra structure members to assist  the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a> function with this.  To include the additional structure members, define the constant <b>CERT_REVOCATION_PARA_HAS_EXTRA_FIELDS</b> in your application before including Wincrypt.h
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_revocation_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REVOCATION_PARA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate of the issuer of a certificate specified in the <i>rgpvContext</i> array in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a> parameter list.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pIssuerCert {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * When set, contains the number of elements in the <b>rgCertStore</b> array. Set to zero if you are not supplying  a list of store handles in the <i>rgCertStore</i> parameter.
     * @type {Integer}
     */
    cCertStore {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> handles. Specifies a set of stores that are searched for issuer certificates.  If <i>rgCertStore</i> is not set, the default stores are searched.
     * @type {Pointer<Void>}
     */
    rgCertStore {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional store handle. When specified, a handler that uses <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation lists</a> (CRLs) can search this store for CRLs.
     * @type {Pointer<Void>}
     */
    hCrlStore {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a <b>FILETIME</b> version of UTC time. When specified, the handler must, if possible, determine revocation status relative to the time given. If <b>NULL</b> or the handler cannot determine the status relative to the <b>pftTimeToUse</b> value, revocation status can be determined independent of time or relative to current time.
     * @type {Pointer<FILETIME>}
     */
    pftTimeToUse {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 48
    }
}

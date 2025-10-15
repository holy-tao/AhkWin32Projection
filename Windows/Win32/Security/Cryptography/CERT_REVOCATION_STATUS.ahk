#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains information on the revocation status of the certificate.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_revocation_status
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REVOCATION_STATUS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Size of this structure in bytes. 
     * 
     * 
     * 
     * 
     * Upon input to 
     * <b>CERT_REVOCATION_STATUS</b>, <b>cbSize</b> must be set to a size greater than or equal to the size of a <b>CERT_REVOCATION_STATUS</b> structure. Otherwise, <b>CERT_REVOCATION_STATUS</b> returns <b>FALSE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns E_INVALIDARG.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies an index value for the <i>rgpvContext</i> array passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a>. It is the index of the first <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a> in that array that was revoked or that could not be checked for revocation. For information about the contexts that were not checked, <b>CertVerifyRevocation</b> is called again, specifying a <i>rgpvContext</i> array that contains the unchecked contexts from the original list.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the returned error status. This value matches the return value of <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> on return from the call to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certverifyrevocation">CertVerifyRevocation</a>. For the list of these error values, see the table in the Return Values section of 
     * <b>CertVerifyRevocation</b>.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwReason {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Depending on <b>cbSize</b>, this structure can contain this member. If this member is <b>TRUE</b>, the revocation freshness time returned by <b>dwFreshnessTime</b> is valid.
     * @type {BOOL}
     */
    fHasFreshnessTime{
        get {
            if(!this.HasProp("__fHasFreshnessTime"))
                this.__fHasFreshnessTime := BOOL(this.ptr + 16)
            return this.__fHasFreshnessTime
        }
    }

    /**
     * Depending on <b>cbSize</b>, this structure can contain this member. If present, this member gives the time in seconds between the current time and when the CRL was published.
     * @type {Integer}
     */
    dwFreshnessTime {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}

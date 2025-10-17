#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the revocation status of a certificate in a CERT_CHAIN_ELEMENT.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_revocation_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REVOCATION_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Currently defined values are:
     * 
     * <ul>
     * <li>CERT_TRUST_IS_REVOKED</li>
     * <li>CERT_TRUST_REVOCATION_STATUS_IS_UNKNOWN</li>
     * </ul>
     * @type {Integer}
     */
    dwRevocationResult {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Not currently used and is set to <b>NULL</b>.
     * @type {PSTR}
     */
    pszRevocationOid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Not currently used and is set to <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvOidSpecificInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * BOOL set to <b>TRUE</b> if dwFreshnessTime has been updated.
     * @type {BOOL}
     */
    fHasFreshnessTime {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * If <b>fHasFreshnessTime</b> is <b>TRUE</b>, holds the CurrentTime minus the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list's</a> (CRL's). This time is in seconds.
     * @type {Integer}
     */
    dwFreshnessTime {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * For CRL base revocation checking, a non-<b>NULL</b> pointer to a CERT_REVOCATION_CRL_INFO structure.
     * @type {Pointer<CERT_REVOCATION_CRL_INFO>}
     */
    pCrlInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}

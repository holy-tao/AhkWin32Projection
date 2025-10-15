#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CERT_TRUST_STATUS.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The CERT_CHAIN_ELEMENT structure is a single element in a simple certificate chain.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_chain_element
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN_ELEMENT extends Win32Struct
{
    static sizeof => 56

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
     * A pointer to a certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">context</a>.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Structure indicating the status of the certificate. The structure includes an error status code and an information status code. For information about status code values, see CERT_TRUST_STATUS.
     * @type {CERT_TRUST_STATUS}
     */
    TrustStatus{
        get {
            if(!this.HasProp("__TrustStatus"))
                this.__TrustStatus := CERT_TRUST_STATUS(this.ptr + 16)
            return this.__TrustStatus
        }
    }

    /**
     * A pointer to a CERT_REVOCATION_INFO structure with information on the revocation status of the certificate. If revocation checking was not enabled, <b>pRevocationInfo</b> is <b>NULL</b>.
     * @type {Pointer<CERT_REVOCATION_INFO>}
     */
    pRevocationInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a CERT_ENHKEY_USAGE structure. If <b>NULL</b>, any issuance policy is acceptable.
     * @type {Pointer<CTL_USAGE>}
     */
    pIssuanceUsage {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a CERT_ENHKEY_USAGE structure. If <b>NULL</b>, any enhanced key usage is acceptable.
     * @type {Pointer<CTL_USAGE>}
     */
    pApplicationUsage {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a <b>null</b>-terminated wide character string that contains extended error information. If <b>NULL</b>, there is no extended error information.
     * @type {PWSTR}
     */
    pwszExtendedErrorInfo{
        get {
            if(!this.HasProp("__pwszExtendedErrorInfo"))
                this.__pwszExtendedErrorInfo := PWSTR(this.ptr + 48)
            return this.__pwszExtendedErrorInfo
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 56
    }
}

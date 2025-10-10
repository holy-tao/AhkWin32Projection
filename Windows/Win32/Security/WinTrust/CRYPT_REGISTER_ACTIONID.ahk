#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_TRUST_REG_ENTRY.ahk

/**
 * Provides information about the functions of a provider.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-crypt_register_actionid
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class CRYPT_REGISTER_ACTIONID extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the function that initializes the provider.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sInitProvider{
        get {
            if(!this.HasProp("__sInitProvider"))
                this.__sInitProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 8)
            return this.__sInitProvider
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the object provider function.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sObjectProvider{
        get {
            if(!this.HasProp("__sObjectProvider"))
                this.__sObjectProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 32)
            return this.__sObjectProvider
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the signature provider function.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sSignatureProvider{
        get {
            if(!this.HasProp("__sSignatureProvider"))
                this.__sSignatureProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 56)
            return this.__sSignatureProvider
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the certificate provider function.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sCertificateProvider{
        get {
            if(!this.HasProp("__sCertificateProvider"))
                this.__sCertificateProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 80)
            return this.__sCertificateProvider
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the certificate policy provider function.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sCertificatePolicyProvider{
        get {
            if(!this.HasProp("__sCertificatePolicyProvider"))
                this.__sCertificatePolicyProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 104)
            return this.__sCertificatePolicyProvider
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the final policy provider function.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sFinalPolicyProvider{
        get {
            if(!this.HasProp("__sFinalPolicyProvider"))
                this.__sFinalPolicyProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 128)
            return this.__sFinalPolicyProvider
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the test policy provider function.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sTestPolicyProvider{
        get {
            if(!this.HasProp("__sTestPolicyProvider"))
                this.__sTestPolicyProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 152)
            return this.__sTestPolicyProvider
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the cleanup provider function.
     * @type {CRYPT_TRUST_REG_ENTRY}
     */
    sCleanupProvider{
        get {
            if(!this.HasProp("__sCleanupProvider"))
                this.__sCleanupProvider := CRYPT_TRUST_REG_ENTRY(this.ptr + 176)
            return this.__sCleanupProvider
        }
    }
}

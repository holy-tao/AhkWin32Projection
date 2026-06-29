#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_TRUST_REG_ENTRY.ahk" { CRYPT_TRUST_REG_ENTRY }

/**
 * Provides information about the functions of a provider.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_register_actionid
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_REGISTER_ACTIONID {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the function that initializes the provider.
     */
    sInitProvider : CRYPT_TRUST_REG_ENTRY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the object provider function.
     */
    sObjectProvider : CRYPT_TRUST_REG_ENTRY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the signature provider function.
     */
    sSignatureProvider : CRYPT_TRUST_REG_ENTRY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the certificate provider function.
     */
    sCertificateProvider : CRYPT_TRUST_REG_ENTRY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the certificate policy provider function.
     */
    sCertificatePolicyProvider : CRYPT_TRUST_REG_ENTRY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the final policy provider function.
     */
    sFinalPolicyProvider : CRYPT_TRUST_REG_ENTRY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the test policy provider function.
     */
    sTestPolicyProvider : CRYPT_TRUST_REG_ENTRY

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-crypt_trust_reg_entry">CRYPT_TRUST_REG_ENTRY</a> structure that identifies the cleanup provider function.
     */
    sCleanupProvider : CRYPT_TRUST_REG_ENTRY

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_CHAIN_POLICY_FLAGS.ahk" { CERT_CHAIN_POLICY_FLAGS }

/**
 * Contains information used in CertVerifyCertificateChainPolicy to establish policy criteria for the verification of certificate chains.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_chain_policy_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_CHAIN_POLICY_PARA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A set of flags that indicate conditions that could potentially be not valid and that are to be ignored in building certificate chains.
     */
    dwFlags : CERT_CHAIN_POLICY_FLAGS

    /**
     * The address of a pszPolicyOID-specific structure that provides additional validity policy conditions.
     */
    pvExtraPolicyPara : IntPtr

}

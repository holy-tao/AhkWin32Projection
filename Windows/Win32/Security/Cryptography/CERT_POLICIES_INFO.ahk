#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_POLICY_INFO.ahk" { CERT_POLICY_INFO }

/**
 * The CERT_POLICIES_INFO structure contains an array of CERT_POLICY_INFO.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policies_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICIES_INFO {
    #StructPack 8

    /**
     * Number of elements in the <b>rgPolicyInfo</b> array.
     */
    cPolicyInfo : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_info">CERT_POLICY_INFO</a> structures.
     */
    rgPolicyInfo : CERT_POLICY_INFO.Ptr

}

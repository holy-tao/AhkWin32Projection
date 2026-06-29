#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_POLICY_QUALIFIER_INFO.ahk" { CERT_POLICY_QUALIFIER_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_POLICY_INFO structure contains an object identifier (OID) specifying a policy and an optional array of policy qualifiers.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_INFO {
    #StructPack 8

    /**
     * Object identifier (OID) string specifying the policy.
     */
    pszPolicyIdentifier : PSTR

    /**
     * Number of elements in the <b>rgPolicyQualifier</b> array.
     */
    cPolicyQualifier : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_policy_qualifier_info">CERT_POLICY_QUALIFIER_INFO</a> structures.
     */
    rgPolicyQualifier : CERT_POLICY_QUALIFIER_INFO.Ptr

}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CERT_POLICY_ID structure contains a list of certificate policies that the certificate expressly supports, together with optional qualifier information pertaining to these policies.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_id
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_ID {
    #StructPack 8

    /**
     * Number of elements in the <b>rgpszCertPolicyElementId</b> array.
     */
    cCertPolicyElementId : UInt32

    /**
     * Array of pointers to policy element identifier strings.
     */
    rgpszCertPolicyElementId : PSTR.Ptr

}

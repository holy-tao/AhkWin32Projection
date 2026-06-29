#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The CERT_POLICY_CONSTRAINTS_INFO structure contains established policies for accepting certificates as trusted.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_policy_constraints_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_POLICY_CONSTRAINTS_INFO {
    #StructPack 4

    /**
     * <b>BOOL</b> flag indicating whether explicit policy information is required.
     */
    fRequireExplicitPolicy : BOOL

    /**
     * <b>DWORD</b> indicating the number of required explicit policy certificates.
     */
    dwRequireExplicitPolicySkipCerts : UInt32

    /**
     * <b>BOOL</b> flag indicating whether policy mapping is inhibited.
     */
    fInhibitPolicyMapping : BOOL

    /**
     * <b>DWORD</b> indicating the number of policy mapping certificates to be skipped.
     */
    dwInhibitPolicyMappingSkipCerts : UInt32

}

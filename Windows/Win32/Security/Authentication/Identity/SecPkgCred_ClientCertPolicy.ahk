#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgCred_ClientCertPolicy {
    #StructPack 8

    dwFlags : UInt32

    guidPolicyId : Guid

    dwCertFlags : UInt32

    dwUrlRetrievalTimeout : UInt32

    fCheckRevocationFreshnessTime : BOOL

    dwRevocationFreshnessTime : UInt32

    fOmitUsageCheck : BOOL

    pwszSslCtlStoreName : PWSTR

    pwszSslCtlIdentifier : PWSTR

}

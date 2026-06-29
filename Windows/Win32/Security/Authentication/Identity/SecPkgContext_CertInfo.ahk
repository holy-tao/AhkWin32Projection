#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_CertInfo {
    #StructPack 8

    dwVersion : UInt32

    cbSubjectName : UInt32

    pwszSubjectName : PWSTR

    cbIssuerName : UInt32

    pwszIssuerName : PWSTR

    dwKeySize : UInt32

}

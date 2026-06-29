#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_INFORMATION_EX2 {
    #StructPack 8

    Name : LSA_UNICODE_STRING

    FlatName : LSA_UNICODE_STRING

    Sid : PSID

    TrustDirection : UInt32

    TrustType : UInt32

    TrustAttributes : UInt32

    ForestTrustLength : UInt32

    ForestTrustInfo : IntPtr

}

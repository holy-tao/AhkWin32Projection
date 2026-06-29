#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_PRIMARY_CRED_EX {
    #StructPack 8

    LogonId : LUID

    DownlevelName : LSA_UNICODE_STRING

    DomainName : LSA_UNICODE_STRING

    Password : LSA_UNICODE_STRING

    OldPassword : LSA_UNICODE_STRING

    UserSid : PSID

    Flags : UInt32

    DnsDomainName : LSA_UNICODE_STRING

    Upn : LSA_UNICODE_STRING

    LogonServer : LSA_UNICODE_STRING

    Spare1 : LSA_UNICODE_STRING

    Spare2 : LSA_UNICODE_STRING

    Spare3 : LSA_UNICODE_STRING

    Spare4 : LSA_UNICODE_STRING

    PackageId : IntPtr

    PrevLogonId : LUID

    FlagsEx : UInt32

}

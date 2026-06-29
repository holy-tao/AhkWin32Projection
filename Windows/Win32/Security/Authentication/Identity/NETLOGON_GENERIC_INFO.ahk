#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\NETLOGON_LOGON_IDENTITY_INFO.ahk" { NETLOGON_LOGON_IDENTITY_INFO }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NETLOGON_GENERIC_INFO {
    #StructPack 8

    Identity : NETLOGON_LOGON_IDENTITY_INFO

    PackageName : LSA_UNICODE_STRING

    DataLength : UInt32

    LogonData : IntPtr

}

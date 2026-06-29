#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MSV1_0_LOGON_SUBMIT_TYPE.ahk" { MSV1_0_LOGON_SUBMIT_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_S4U_LOGON {
    #StructPack 8

    MessageType : MSV1_0_LOGON_SUBMIT_TYPE

    Flags : UInt32

    UserPrincipalName : LSA_UNICODE_STRING

    DomainName : LSA_UNICODE_STRING

}

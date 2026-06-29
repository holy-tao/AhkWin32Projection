#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROFILE_BUFFER_TYPE.ahk" { KERB_PROFILE_BUFFER_TYPE }
#Import ".\KERB_INTERACTIVE_PROFILE.ahk" { KERB_INTERACTIVE_PROFILE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_SMART_CARD_PROFILE {
    #StructPack 8

    Profile : KERB_INTERACTIVE_PROFILE

    CertificateSize : UInt32

    CertificateData : IntPtr

}

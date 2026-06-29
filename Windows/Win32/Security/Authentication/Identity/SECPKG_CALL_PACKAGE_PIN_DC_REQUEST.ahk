#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_CALL_PACKAGE_PIN_DC_REQUEST {
    #StructPack 8

    MessageType : UInt32

    Flags : UInt32

    DomainName : LSA_UNICODE_STRING

    DcName : LSA_UNICODE_STRING

    DcFlags : UInt32

}

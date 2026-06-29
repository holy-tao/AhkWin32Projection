#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_RETRIEVE_KEY_TAB_REQUEST {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    Flags : UInt32

    UserName : LSA_UNICODE_STRING

    DomainName : LSA_UNICODE_STRING

    Password : LSA_UNICODE_STRING

}

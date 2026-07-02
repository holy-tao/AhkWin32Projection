#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_REFRESH_SCCRED_REQUEST {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    CredentialBlob : LSA_UNICODE_STRING

    LogonId : LUID

    Flags : UInt32

}

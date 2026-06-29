#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_TRANSFER_CRED_REQUEST {
    #StructPack 4

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    OriginLogonId : LUID

    DestinationLogonId : LUID

    Flags : UInt32

}

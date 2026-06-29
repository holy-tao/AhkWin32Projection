#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_CRYPTO_KEY32.ahk" { KERB_CRYPTO_KEY32 }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_SUBMIT_TKT_REQUEST {
    #StructPack 4

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    LogonId : LUID

    Flags : UInt32

    Key : KERB_CRYPTO_KEY32

    KerbCredSize : UInt32

    KerbCredOffset : UInt32

}

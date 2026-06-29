#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CLOUD_KERBEROS_DEBUG_RESPONSE {
    #StructPack 4

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    Version : UInt32

    Length : UInt32

    Data : UInt32[1]

}

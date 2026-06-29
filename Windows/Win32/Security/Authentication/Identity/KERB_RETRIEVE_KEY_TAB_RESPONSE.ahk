#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_RETRIEVE_KEY_TAB_RESPONSE {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    KeyTabLength : UInt32

    KeyTab : IntPtr

}

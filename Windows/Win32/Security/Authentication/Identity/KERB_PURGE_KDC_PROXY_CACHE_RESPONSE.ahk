#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_PURGE_KDC_PROXY_CACHE_RESPONSE {
    #StructPack 4

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    CountOfPurged : UInt32

}

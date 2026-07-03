#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import ".\KERB_S4U2PROXY_CRED.ahk" { KERB_S4U2PROXY_CRED }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_QUERY_S4U2PROXY_CACHE_RESPONSE {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    CountOfCreds : UInt32

    Creds : KERB_S4U2PROXY_CRED.Ptr

}

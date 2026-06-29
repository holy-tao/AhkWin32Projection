#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import ".\KDC_PROXY_CACHE_ENTRY_DATA.ahk" { KDC_PROXY_CACHE_ENTRY_DATA }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_QUERY_KDC_PROXY_CACHE_RESPONSE {
    #StructPack 8

    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    CountOfEntries : UInt32

    Entries : KDC_PROXY_CACHE_ENTRY_DATA.Ptr

}

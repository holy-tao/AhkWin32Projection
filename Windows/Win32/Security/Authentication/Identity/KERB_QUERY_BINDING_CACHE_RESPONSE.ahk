#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import ".\KERB_BINDING_CACHE_ENTRY_DATA.ahk" { KERB_BINDING_CACHE_ENTRY_DATA }

/**
 * Contains the results of querying the binding cache.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_binding_cache_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_QUERY_BINDING_CACHE_RESPONSE {
    #StructPack 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbQueryBindingCacheMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * The number of entries in the binding cache.
     */
    CountOfEntries : UInt32

    Entries : KERB_BINDING_CACHE_ENTRY_DATA.Ptr

}

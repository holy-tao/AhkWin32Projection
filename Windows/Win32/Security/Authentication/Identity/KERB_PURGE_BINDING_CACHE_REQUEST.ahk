#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * Deletes the request for the binding cache.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_purge_binding_cache_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_PURGE_BINDING_CACHE_REQUEST {
    #StructPack 4

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbPurgeBindingCacheMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

}

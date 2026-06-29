#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_ADDRESS_TYPE.ahk" { KERB_ADDRESS_TYPE }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }

/**
 * Specifies a message to add a binding cache entry.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_add_binding_cache_entry_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_ADD_BINDING_CACHE_ENTRY_REQUEST {
    #StructPack 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbAddBindingCacheEntryMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * The 	name of the realm of the domain controller.
     */
    RealmName : LSA_UNICODE_STRING

    /**
     * The address of the Key Distribution Center (KDC) of the server to  which you want to bind.
     */
    KdcAddress : LSA_UNICODE_STRING

    AddressType : KERB_ADDRESS_TYPE

}

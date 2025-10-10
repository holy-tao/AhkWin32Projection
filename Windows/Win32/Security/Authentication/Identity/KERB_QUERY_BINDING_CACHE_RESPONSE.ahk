#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the results of querying the binding cache.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_query_binding_cache_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_QUERY_BINDING_CACHE_RESPONSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbQueryBindingCacheMessage</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of entries in the binding cache.
     * @type {Integer}
     */
    CountOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Pointer<KERB_BINDING_CACHE_ENTRY_DATA>}
     */
    Entries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

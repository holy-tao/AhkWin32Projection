#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Specifies a message to add a binding cache entry.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_add_binding_cache_entry_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_ADD_BINDING_CACHE_ENTRY_REQUEST extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A 
     * 						value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> enumeration that lists the types of messages that can be sent to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function. This member must be set to <b>KerbAddBindingCacheEntryMessage</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The 	name of the realm of the domain controller.
     * @type {LSA_UNICODE_STRING}
     */
    RealmName{
        get {
            if(!this.HasProp("__RealmName"))
                this.__RealmName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__RealmName
        }
    }

    /**
     * The address of the Key Distribution Center (KDC) of the server to  which you want to bind.
     * @type {LSA_UNICODE_STRING}
     */
    KdcAddress{
        get {
            if(!this.HasProp("__KdcAddress"))
                this.__KdcAddress := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__KdcAddress
        }
    }

    /**
     * 
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

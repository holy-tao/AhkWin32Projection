#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KDC_PROXY_CACHE_ENTRY_DATA extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SinceLastUsed {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ProxyServerName{
        get {
            if(!this.HasProp("__ProxyServerName"))
                this.__ProxyServerName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__ProxyServerName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ProxyServerVdir{
        get {
            if(!this.HasProp("__ProxyServerVdir"))
                this.__ProxyServerVdir := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__ProxyServerVdir
        }
    }

    /**
     * @type {Integer}
     */
    ProxyServerPort {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 64)
            return this.__LogonId
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    CredUserName{
        get {
            if(!this.HasProp("__CredUserName"))
                this.__CredUserName := LSA_UNICODE_STRING(this.ptr + 72)
            return this.__CredUserName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    CredDomainName{
        get {
            if(!this.HasProp("__CredDomainName"))
                this.__CredDomainName := LSA_UNICODE_STRING(this.ptr + 88)
            return this.__CredDomainName
        }
    }

    /**
     * @type {BOOLEAN}
     */
    GlobalCache{
        get {
            if(!this.HasProp("__GlobalCache"))
                this.__GlobalCache := BOOLEAN(this.ptr + 104)
            return this.__GlobalCache
        }
    }
}

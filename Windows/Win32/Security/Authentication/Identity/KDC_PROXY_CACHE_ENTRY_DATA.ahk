#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\Foundation\LUID.ahk

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
                this.__DomainName := LSA_UNICODE_STRING(8, this)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ProxyServerName{
        get {
            if(!this.HasProp("__ProxyServerName"))
                this.__ProxyServerName := LSA_UNICODE_STRING(24, this)
            return this.__ProxyServerName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ProxyServerVdir{
        get {
            if(!this.HasProp("__ProxyServerVdir"))
                this.__ProxyServerVdir := LSA_UNICODE_STRING(40, this)
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
                this.__LogonId := LUID(60, this)
            return this.__LogonId
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    CredUserName{
        get {
            if(!this.HasProp("__CredUserName"))
                this.__CredUserName := LSA_UNICODE_STRING(72, this)
            return this.__CredUserName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    CredDomainName{
        get {
            if(!this.HasProp("__CredDomainName"))
                this.__CredDomainName := LSA_UNICODE_STRING(88, this)
            return this.__CredDomainName
        }
    }

    /**
     * @type {BOOLEAN}
     */
    GlobalCache {
        get => NumGet(this, 104, "char")
        set => NumPut("char", value, this, 104)
    }
}

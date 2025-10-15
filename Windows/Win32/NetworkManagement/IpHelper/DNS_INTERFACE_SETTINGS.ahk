#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_INTERFACE_SETTINGS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    Domain{
        get {
            if(!this.HasProp("__Domain"))
                this.__Domain := PWSTR(this.ptr + 16)
            return this.__Domain
        }
    }

    /**
     * @type {PWSTR}
     */
    NameServer{
        get {
            if(!this.HasProp("__NameServer"))
                this.__NameServer := PWSTR(this.ptr + 24)
            return this.__NameServer
        }
    }

    /**
     * @type {PWSTR}
     */
    SearchList{
        get {
            if(!this.HasProp("__SearchList"))
                this.__SearchList := PWSTR(this.ptr + 32)
            return this.__SearchList
        }
    }

    /**
     * @type {Integer}
     */
    RegistrationEnabled {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    RegisterAdapterName {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    EnableLLMNR {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    QueryAdapterName {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {PWSTR}
     */
    ProfileNameServer{
        get {
            if(!this.HasProp("__ProfileNameServer"))
                this.__ProfileNameServer := PWSTR(this.ptr + 56)
            return this.__ProfileNameServer
        }
    }
}

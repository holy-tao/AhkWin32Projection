#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_INTERFACE_SETTINGS4 extends Win32Struct
{
    static sizeof => 120

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

    /**
     * @type {Integer}
     */
    DisableUnconstrainedQueries {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {PWSTR}
     */
    SupplementalSearchList{
        get {
            if(!this.HasProp("__SupplementalSearchList"))
                this.__SupplementalSearchList := PWSTR(this.ptr + 72)
            return this.__SupplementalSearchList
        }
    }

    /**
     * @type {Integer}
     */
    cServerProperties {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<DNS_SERVER_PROPERTY>}
     */
    ServerProperties {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    cProfileServerProperties {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Pointer<DNS_SERVER_PROPERTY>}
     */
    ProfileServerProperties {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    EncryptedDnsAdapterFlags {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }
}

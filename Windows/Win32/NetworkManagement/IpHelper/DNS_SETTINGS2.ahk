#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class DNS_SETTINGS2 extends Win32Struct
{
    static sizeof => 48

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
    Hostname{
        get {
            if(!this.HasProp("__Hostname"))
                this.__Hostname := PWSTR(this.ptr + 16)
            return this.__Hostname
        }
    }

    /**
     * @type {PWSTR}
     */
    Domain{
        get {
            if(!this.HasProp("__Domain"))
                this.__Domain := PWSTR(this.ptr + 24)
            return this.__Domain
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
    SettingFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}

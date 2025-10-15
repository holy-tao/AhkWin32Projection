#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVER_INFO_103 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    sv103_platform_id {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    sv103_name{
        get {
            if(!this.HasProp("__sv103_name"))
                this.__sv103_name := PWSTR(this.ptr + 8)
            return this.__sv103_name
        }
    }

    /**
     * @type {Integer}
     */
    sv103_version_major {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    sv103_version_minor {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    sv103_type {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    sv103_comment{
        get {
            if(!this.HasProp("__sv103_comment"))
                this.__sv103_comment := PWSTR(this.ptr + 32)
            return this.__sv103_comment
        }
    }

    /**
     * @type {Integer}
     */
    sv103_users {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    sv103_disc {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    sv103_hidden{
        get {
            if(!this.HasProp("__sv103_hidden"))
                this.__sv103_hidden := BOOL(this.ptr + 48)
            return this.__sv103_hidden
        }
    }

    /**
     * @type {Integer}
     */
    sv103_announce {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    sv103_anndelta {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    sv103_licenses {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {PWSTR}
     */
    sv103_userpath{
        get {
            if(!this.HasProp("__sv103_userpath"))
                this.__sv103_userpath := PWSTR(this.ptr + 64)
            return this.__sv103_userpath
        }
    }

    /**
     * @type {Integer}
     */
    sv103_capabilities {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}

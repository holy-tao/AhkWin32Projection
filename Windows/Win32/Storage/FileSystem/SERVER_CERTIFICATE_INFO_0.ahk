#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SERVER_CERTIFICATE_INFO_0 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    srvci0_name{
        get {
            if(!this.HasProp("__srvci0_name"))
                this.__srvci0_name := PWSTR(this.ptr + 0)
            return this.__srvci0_name
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_subject{
        get {
            if(!this.HasProp("__srvci0_subject"))
                this.__srvci0_subject := PWSTR(this.ptr + 8)
            return this.__srvci0_subject
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_issuer{
        get {
            if(!this.HasProp("__srvci0_issuer"))
                this.__srvci0_issuer := PWSTR(this.ptr + 16)
            return this.__srvci0_issuer
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_thumbprint{
        get {
            if(!this.HasProp("__srvci0_thumbprint"))
                this.__srvci0_thumbprint := PWSTR(this.ptr + 24)
            return this.__srvci0_thumbprint
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_friendlyname{
        get {
            if(!this.HasProp("__srvci0_friendlyname"))
                this.__srvci0_friendlyname := PWSTR(this.ptr + 32)
            return this.__srvci0_friendlyname
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_notbefore{
        get {
            if(!this.HasProp("__srvci0_notbefore"))
                this.__srvci0_notbefore := PWSTR(this.ptr + 40)
            return this.__srvci0_notbefore
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_notafter{
        get {
            if(!this.HasProp("__srvci0_notafter"))
                this.__srvci0_notafter := PWSTR(this.ptr + 48)
            return this.__srvci0_notafter
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_storelocation{
        get {
            if(!this.HasProp("__srvci0_storelocation"))
                this.__srvci0_storelocation := PWSTR(this.ptr + 56)
            return this.__srvci0_storelocation
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_storename{
        get {
            if(!this.HasProp("__srvci0_storename"))
                this.__srvci0_storename := PWSTR(this.ptr + 64)
            return this.__srvci0_storename
        }
    }

    /**
     * @type {PWSTR}
     */
    srvci0_renewalchain{
        get {
            if(!this.HasProp("__srvci0_renewalchain"))
                this.__srvci0_renewalchain := PWSTR(this.ptr + 72)
            return this.__srvci0_renewalchain
        }
    }

    /**
     * @type {Integer}
     */
    srvci0_type {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    srvci0_flags {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    srvci0_mapping_status {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }
}

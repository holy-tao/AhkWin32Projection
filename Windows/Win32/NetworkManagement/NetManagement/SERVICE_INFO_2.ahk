#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVICE_INFO_2 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    svci2_name{
        get {
            if(!this.HasProp("__svci2_name"))
                this.__svci2_name := PWSTR(this.ptr + 0)
            return this.__svci2_name
        }
    }

    /**
     * @type {Integer}
     */
    svci2_status {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    svci2_code {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    svci2_pid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    svci2_text{
        get {
            if(!this.HasProp("__svci2_text"))
                this.__svci2_text := PWSTR(this.ptr + 24)
            return this.__svci2_text
        }
    }

    /**
     * @type {Integer}
     */
    svci2_specific_error {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    svci2_display_name{
        get {
            if(!this.HasProp("__svci2_display_name"))
                this.__svci2_display_name := PWSTR(this.ptr + 40)
            return this.__svci2_display_name
        }
    }
}

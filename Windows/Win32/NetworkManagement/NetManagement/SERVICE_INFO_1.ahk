#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SERVICE_INFO_1 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    svci1_name{
        get {
            if(!this.HasProp("__svci1_name"))
                this.__svci1_name := PWSTR(this.ptr + 0)
            return this.__svci1_name
        }
    }

    /**
     * @type {Integer}
     */
    svci1_status {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    svci1_code {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    svci1_pid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}

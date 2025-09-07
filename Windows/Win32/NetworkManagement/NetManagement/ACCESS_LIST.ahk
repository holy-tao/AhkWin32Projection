#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class ACCESS_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    acl_ugname{
        get {
            if(!this.HasProp("__acl_ugname"))
                this.__acl_ugname := PWSTR(this.ptr + 0)
            return this.__acl_ugname
        }
    }

    /**
     * @type {Integer}
     */
    acl_access {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

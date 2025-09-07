#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class CONFIG_INFO_0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    cfgi0_key{
        get {
            if(!this.HasProp("__cfgi0_key"))
                this.__cfgi0_key := PWSTR(this.ptr + 0)
            return this.__cfgi0_key
        }
    }

    /**
     * @type {PWSTR}
     */
    cfgi0_data{
        get {
            if(!this.HasProp("__cfgi0_data"))
                this.__cfgi0_data := PWSTR(this.ptr + 8)
            return this.__cfgi0_data
        }
    }
}

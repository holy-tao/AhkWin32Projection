#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PF_FILTER_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class PF_FILTER_STATS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwNumPacketsFiltered {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PF_FILTER_DESCRIPTOR}
     */
    info{
        get {
            if(!this.HasProp("__info"))
                this.__info := PF_FILTER_DESCRIPTOR(this.ptr + 8)
            return this.__info
        }
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_IFINDEX_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszConnectionName{
        get {
            if(!this.HasProp("__pwszConnectionName"))
                this.__pwszConnectionName := PWSTR(this.ptr + 0)
            return this.__pwszConnectionName
        }
    }

    /**
     * @type {Integer}
     */
    dwIfIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

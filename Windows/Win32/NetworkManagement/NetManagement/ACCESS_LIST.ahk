#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class ACCESS_LIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    acl_ugname {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    acl_access {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

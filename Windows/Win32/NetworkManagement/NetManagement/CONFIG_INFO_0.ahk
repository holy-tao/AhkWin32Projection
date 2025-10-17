#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    cfgi0_key {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    cfgi0_data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

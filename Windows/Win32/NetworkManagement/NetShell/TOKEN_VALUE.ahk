#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
class TOKEN_VALUE extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszToken {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class TOKEN_VALUE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszToken{
        get {
            if(!this.HasProp("__pwszToken"))
                this.__pwszToken := PWSTR(this.ptr + 0)
            return this.__pwszToken
        }
    }

    /**
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

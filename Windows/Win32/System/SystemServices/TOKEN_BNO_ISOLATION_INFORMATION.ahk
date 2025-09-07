#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TOKEN_BNO_ISOLATION_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    IsolationPrefix{
        get {
            if(!this.HasProp("__IsolationPrefix"))
                this.__IsolationPrefix := PWSTR(this.ptr + 0)
            return this.__IsolationPrefix
        }
    }

    /**
     * @type {Integer}
     */
    IsolationEnabled {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
     * @type {BOOLEAN}
     */
    IsolationEnabled{
        get {
            if(!this.HasProp("__IsolationEnabled"))
                this.__IsolationEnabled := BOOLEAN(this.ptr + 8)
            return this.__IsolationEnabled
        }
    }
}

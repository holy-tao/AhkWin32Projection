#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\WPARAM.ahk
#Include ..\..\..\Foundation\LPARAM.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class TRANSMSG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    message {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {WPARAM}
     */
    wParam{
        get {
            if(!this.HasProp("__wParam"))
                this.__wParam := WPARAM(this.ptr + 8)
            return this.__wParam
        }
    }

    /**
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 16)
            return this.__lParam
        }
    }
}

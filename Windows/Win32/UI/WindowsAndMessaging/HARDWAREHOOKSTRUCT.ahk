#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class HARDWAREHOOKSTRUCT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(0, this)
            return this.__hwnd
        }
    }

    /**
     * @type {Integer}
     */
    message {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {WPARAM}
     */
    wParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

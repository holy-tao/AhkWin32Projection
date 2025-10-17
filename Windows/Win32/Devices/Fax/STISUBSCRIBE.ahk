#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class STISUBSCRIBE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwFilter {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {HWND}
     */
    hWndNotify{
        get {
            if(!this.HasProp("__hWndNotify"))
                this.__hWndNotify := HWND(16, this)
            return this.__hWndNotify
        }
    }

    /**
     * @type {HANDLE}
     */
    hEvent{
        get {
            if(!this.HasProp("__hEvent"))
                this.__hEvent := HANDLE(24, this)
            return this.__hEvent
        }
    }

    /**
     * @type {Integer}
     */
    uiNotificationMessage {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Defines the message parameters passed to a WH_CALLWNDPROC hook procedure, CallWndProc.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-cwpstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CWPSTRUCT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>LPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 0)
            return this.__lParam
        }
    }

    /**
     * Type: <b>WPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
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
     * Type: <b>UINT</b>
     * 
     * The message.
     * @type {Integer}
     */
    message {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to receive the message.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 24)
            return this.__hwnd
        }
    }
}

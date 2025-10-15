#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Defines the message parameters passed to a WH_CALLWNDPROCRET hook procedure, CallWndRetProc.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-cwpretstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CWPRETSTRUCT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>LRESULT</b>
     * 
     * The return value of the window procedure that processed the message specified by the 
     * 					<b>message</b> value.
     * @type {LRESULT}
     */
    lResult{
        get {
            if(!this.HasProp("__lResult"))
                this.__lResult := LRESULT(this.ptr + 0)
            return this.__lResult
        }
    }

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
                this.__lParam := LPARAM(this.ptr + 8)
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
                this.__wParam := WPARAM(this.ptr + 16)
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
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that processed the message specified by the 
     * 					<b>message</b> value.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 32)
            return this.__hwnd
        }
    }
}

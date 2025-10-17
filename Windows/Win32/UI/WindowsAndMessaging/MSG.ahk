#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains message information from a thread's message queue.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-msg
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MSG extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window whose window procedure receives the message. This member is <b>NULL</b> when the message is a thread message.
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
     * Type: <b>UINT</b>
     * 
     * The message identifier. Applications can only use the low word; the high word is reserved by the system.
     * @type {Integer}
     */
    message {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>WPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the value of the 
     * 					<b>message</b> member.
     * @type {WPARAM}
     */
    wParam {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the value of the 
     * 					<b>message</b> member.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time at which the message was posted.
     * @type {Integer}
     */
    time {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The cursor position, in screen coordinates, when the message was posted.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(40, this)
            return this.__pt
        }
    }
}

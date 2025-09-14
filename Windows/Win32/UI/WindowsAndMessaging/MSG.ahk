#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains message information from a thread's message queue.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-msg
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
     * @type {Pointer<HWND>}
     */
    hwnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
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
     * @type {Pointer}
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
     * @type {Pointer}
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
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The cursor position, in screen coordinates, when the message was posted.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(this.ptr + 40)
            return this.__pt
        }
    }
}

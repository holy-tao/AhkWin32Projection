#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the message parameters passed to a WH_CALLWNDPROC hook procedure, CallWndProc.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cwpstruct
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
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>WPARAM</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     * @type {Pointer}
     */
    wParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
     * @type {Pointer<HWND>}
     */
    hwnd {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}

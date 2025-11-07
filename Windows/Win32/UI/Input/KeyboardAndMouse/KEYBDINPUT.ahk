#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a simulated keyboard event.
 * @remarks
 * 
 * <b> INPUT_KEYBOARD</b> supports nonkeyboard-input methods—such as handwriting recognition or voice recognition—as if it were text input by using the <b>KEYEVENTF_UNICODE</b> flag. If <b>KEYEVENTF_UNICODE</b> is specified, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> sends a <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a> or <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a> message to the foreground thread's message queue with <i>wParam</i> equal to <b>VK_PACKET</b>. Once <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessage">GetMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> obtains this message, passing the message to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> posts a <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-char">WM_CHAR</a> message with the Unicode character originally specified by <b>wScan</b>. This Unicode character will automatically be converted to the appropriate ANSI value if it is posted to an ANSI window.
 * 
 *  Set the <b>KEYEVENTF_SCANCODE</b> flag to define keyboard input in terms of the scan code. This is useful to simulate a physical keystroke regardless of which keyboard is currently being used. The virtual key value of a key may alter depending on the current keyboard layout or what other keys were pressed, but the scan code will always be the same.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-keybdinput
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class KEYBDINPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>WORD</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">virtual-key code</a>. The code must be a value in the range 1 to 254. If the <b>dwFlags</b> member specifies <b>KEYEVENTF_UNICODE</b>, <b>wVk</b> must be 0.
     * @type {Integer}
     */
    wVk {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * A hardware scan code for the key. If <b>dwFlags</b> specifies <b>KEYEVENTF_UNICODE</b>, <b>wScan</b> specifies a Unicode character which is to be sent to the foreground application.
     * @type {Integer}
     */
    wScan {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time stamp for the event, in milliseconds. If this parameter is zero, the system will provide its own time stamp.
     * @type {Integer}
     */
    time {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * An additional value associated with the keystroke. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessageextrainfo">GetMessageExtraInfo</a> function to obtain this information.
     * @type {Pointer}
     */
    dwExtraInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KEYBD_EVENT_FLAGS.ahk" { KEYBD_EVENT_FLAGS }
#Import ".\VIRTUAL_KEY.ahk" { VIRTUAL_KEY }

/**
 * Contains information about a simulated keyboard event.
 * @remarks
 * <b> INPUT_KEYBOARD</b> supports nonkeyboard-input methods—such as handwriting recognition or voice recognition—as if it were text input by using the <b>KEYEVENTF_UNICODE</b> flag. If <b>KEYEVENTF_UNICODE</b> is specified, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> sends a <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a> or <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a> message to the foreground thread's message queue with <i>wParam</i> equal to <b>VK_PACKET</b>. Once <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessage">GetMessage</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> obtains this message, passing the message to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-translatemessage">TranslateMessage</a> posts a <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-char">WM_CHAR</a> message with the Unicode character originally specified by <b>wScan</b>. This Unicode character will automatically be converted to the appropriate ANSI value if it is posted to an ANSI window.
 * 
 * Set the <b>KEYEVENTF_SCANCODE</b> flag to define keyboard input in terms of the scan code. This is useful for simulating a physical keystroke regardless of which keyboard is currently being used. You can also pass the <b>KEYEVENTF_EXTENDEDKEY</b> flag if the scan code is an extended key. The virtual key value of a key can change depending on the current keyboard layout or what other keys were pressed, but the scan code will always be the same.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-keybdinput
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct KEYBDINPUT {
    #StructPack 8

    /**
     * Type: <b>WORD</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">virtual-key code</a>. The code must be a value in the range 1 to 254. If the <b>dwFlags</b> member specifies <b>KEYEVENTF_UNICODE</b>, <b>wVk</b> must be 0.
     */
    wVk : VIRTUAL_KEY

    /**
     * Type: <b>WORD</b>
     * 
     * A hardware scan code for the key. If <b>dwFlags</b> specifies <b>KEYEVENTF_UNICODE</b>, <b>wScan</b> specifies a Unicode character which is to be sent to the foreground application.
     */
    wScan : UInt16

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : KEYBD_EVENT_FLAGS

    /**
     * Type: <b>DWORD</b>
     * 
     * The time stamp for the event, in milliseconds. If this parameter is zero, the system will provide its own time stamp.
     */
    time : UInt32

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * An additional value associated with the keystroke. Use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessageextrainfo">GetMessageExtraInfo</a> function to obtain this information.
     */
    dwExtraInfo : IntPtr

}

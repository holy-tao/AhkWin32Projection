#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a low-level keyboard input event.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-kbdllhookstruct
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class KBDLLHOOKSTRUCT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">virtual-key code</a>. The code must be a value in the range 1 to 254.
     * @type {Integer}
     */
    vkCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A hardware scan code for the key.
     * @type {Integer}
     */
    scanCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The extended-key flag, event-injected flags, context code, and transition-state flag. This member is specified as follows. An application can use the following values to test the keystroke flags. Testing LLKHF_INJECTED (bit 4) will tell you whether the event was injected. If it was, then testing LLKHF_LOWER_IL_INJECTED (bit 1) will tell you whether or not the event was injected from a process running at lower integrity level.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LLKHF_EXTENDED"></a><a id="llkhf_extended"></a><dl>
     * <dt><b>LLKHF_EXTENDED</b></dt>
     * <dt>(KF_EXTENDED &gt;&gt; 8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test the extended-key flag. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LLKHF_LOWER_IL_INJECTED"></a><a id="llkhf_lower_il_injected"></a><dl>
     * <dt><b>LLKHF_LOWER_IL_INJECTED</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test the event-injected (from a process running at lower integrity level) flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LLKHF_INJECTED"></a><a id="llkhf_injected"></a><dl>
     * <dt><b>LLKHF_INJECTED</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test the event-injected (from any process) flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LLKHF_ALTDOWN"></a><a id="llkhf_altdown"></a><dl>
     * <dt><b>LLKHF_ALTDOWN</b></dt>
     * <dt>(KF_ALTDOWN &gt;&gt; 8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test the context code. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LLKHF_UP"></a><a id="llkhf_up"></a><dl>
     * <dt><b>LLKHF_UP</b></dt>
     * <dt>(KF_UP &gt;&gt; 8)</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Test the transition-state flag. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following table describes the layout of this value.
     * 
     * <table>
     * <tr>
     * <th>Bits</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Specifies whether the key is an extended key, such as a function key or a key on the numeric keypad. The value is 1 if the key is an extended key; otherwise, it is 0.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Specifies whether the event was injected from a process running at lower integrity level. The value is 1 if that is the case; otherwise, it is 0. Note that bit 4 is also set whenever bit 1 is set.</td>
     * </tr>
     * <tr>
     * <td>2-3</td>
     * <td>Reserved.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>Specifies whether the event was injected. The value is 1 if that is the case; otherwise, it is 0. Note that bit 1 is not necessarily set when bit 4 is set.</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>The context code. The value is 1 if the ALT key is pressed; otherwise, it is 0.</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>Reserved.</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>The transition state. The value is 0 if the key is pressed and 1 if it is being released.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time stamp for this message, equivalent to what <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessagetime">GetMessageTime</a> would return for this message.
     * @type {Integer}
     */
    time {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional information associated with the message.
     * @type {Pointer}
     */
    dwExtraInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information about a hardware message sent to the system message queue. This structure is used to store message information for the JournalPlaybackProc callback function.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-eventmsg
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class EVENTMSG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The message.
     * @type {Integer}
     */
    message {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     * @type {Integer}
     */
    paramL {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * Additional information about the message. The exact meaning depends on the 
     * 					<b>message</b> value.
     * @type {Integer}
     */
    paramH {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The time at which the message was posted.
     * @type {Integer}
     */
    time {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window to which the message was posted.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(this.ptr + 16)
            return this.__hwnd
        }
    }
}

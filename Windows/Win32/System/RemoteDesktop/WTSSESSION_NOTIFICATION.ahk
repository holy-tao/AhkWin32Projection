#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about the session change notification. A service receives this structure in its HandlerEx function in response to a session change event.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-wtssession_notification
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSESSION_NOTIFICATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Session identifier that triggered the session change event.
     * @type {Integer}
     */
    dwSessionId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}

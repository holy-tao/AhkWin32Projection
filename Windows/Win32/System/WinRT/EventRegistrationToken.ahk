#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies an event handler that has been registered with an event source.
 * @remarks
 * 
  * Use an <b>EventRegistrationToken</b> to  unsubscribe from a Windows Runtime event source.
  * 
  * You acquire an <b>EventRegistrationToken</b> when you subscribe to an event.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//eventtoken/ns-eventtoken-eventregistrationtoken
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class EventRegistrationToken extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Type: <b>INT64</b>
     * 
     * An identifying value that is provided by an event source.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}

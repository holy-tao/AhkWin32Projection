#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Identifies an event handler that has been registered with an event source.
 * @remarks
 * Use an **EventRegistrationToken** to  unsubscribe from a Windows Runtime event source.
  * 
  * You acquire an **EventRegistrationToken** when you subscribe to an event.
 * @see https://learn.microsoft.com/windows/win32/api/eventtoken/ns-eventtoken-eventregistrationtoken
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class EventRegistrationToken extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Type: **INT64**
     * 
     * An identifying value that is provided by an event source.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}

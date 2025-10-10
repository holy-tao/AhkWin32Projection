#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the error message or message box display text for a message table resource.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-message_resource_entry
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MESSAGE_RESOURCE_ENTRY extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Type: <b>WORD</b>
     * 
     * The length, in bytes, of the <b>MESSAGE_RESOURCE_ENTRY</b> structure.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * Indicates that the string is encoded in Unicode, if equal to the value 0x0001. Indicates that the string is encoded in ANSI, if equal to the value 0x0000.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>BYTE[1]</b>
     * 
     * Pointer to an array that contains the error message or message box display text.
     * @type {Array<Byte>}
     */
    Text{
        get {
            if(!this.HasProp("__TextProxyArray"))
                this.__TextProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__TextProxyArray
        }
    }
}

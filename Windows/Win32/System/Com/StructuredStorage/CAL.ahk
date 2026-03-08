#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Deprecated. Represents an instant in time, typically expressed as a date and time of day and a corresponding calendar.
 * @see https://learn.microsoft.com/windows/win32/Intl/caldatetime
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class CAL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cElems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pElems {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

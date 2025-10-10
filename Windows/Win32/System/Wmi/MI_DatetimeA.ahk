#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an array of MI_Datetime types.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_datetimea
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_DatetimeA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_datetime">MI_Datetime</a> types.
     * @type {Pointer<MI_Datetime>}
     */
    data {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Number of items in the data array.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

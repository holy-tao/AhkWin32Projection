#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes the start and end of a time range.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.msetimerange
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MseTimeRange extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The starting time interval expressed in 100-nanosecond units.
     * @type {Pointer<TimeSpan>}
     */
    Start {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The ending time interval expressed in 100-nanosecond units.
     * @type {Pointer<TimeSpan>}
     */
    End {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

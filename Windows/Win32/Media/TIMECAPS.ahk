#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The TIMECAPS structure contains information about the resolution of the timer.
 * @see https://docs.microsoft.com/windows/win32/api//timeapi/ns-timeapi-timecaps
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class TIMECAPS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The minimum supported resolution, in milliseconds.
     * @type {Integer}
     */
    wPeriodMin {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum supported resolution, in milliseconds.
     * @type {Integer}
     */
    wPeriodMax {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Represents a time range within media content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimerange
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaTimeRange extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A time span from the beginning of the media content to the beginning of the time range.
     * @type {Pointer<TimeSpan>}
     */
    Start {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A time span from the beginning of the media content to the end of the time range.
     * @type {Pointer<TimeSpan>}
     */
    End {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}

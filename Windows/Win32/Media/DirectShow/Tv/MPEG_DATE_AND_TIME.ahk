#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\MPEG_DATE.ahk
#Include .\MPEG_TIME.ahk

/**
 * The MPEG_DATE_AND_TIME structure specifies a date and time.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_date_and_time
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_DATE_AND_TIME extends Win32Struct
{
    static sizeof => 7

    static packingSize => 1

    /**
     * Specifies the date, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_date">MPEG_DATE</a> structure.
     * @type {MPEG_DATE}
     */
    D{
        get {
            if(!this.HasProp("__D"))
                this.__D := MPEG_DATE(this.ptr + 0)
            return this.__D
        }
    }

    /**
     * Specifies the time, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_time">MPEG_TIME</a> structure.
     * @type {MPEG_TIME}
     */
    T{
        get {
            if(!this.HasProp("__T"))
                this.__T := MPEG_TIME(this.ptr + 4)
            return this.__T
        }
    }
}

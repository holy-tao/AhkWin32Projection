#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The MPEG_TIME structure represents a time of day, or a duration.
 * @remarks
 * The <b>MPEG_DURATION</b> structure is a <c>typedef</c> for the <b>MPEG_TIME</b> structure.
 * 
 * <pre class="syntax" xml:space="preserve"><c>typedef MPEG_TIME MPEG_DURATION;</c></pre>
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_time
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class MPEG_TIME extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * Specifies the hours. The value can range from 0 to 23, inclusive.
     * @type {Integer}
     */
    Hours {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the minutes. The value can range from 0 to 59, inclusive.
     * @type {Integer}
     */
    Minutes {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the seconds. The value can range from 0 to 59, inclusive.
     * @type {Integer}
     */
    Seconds {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}

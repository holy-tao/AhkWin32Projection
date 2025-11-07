#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DVD_PLAYBACK_LOCATION structure indicates DVD playback location.
 * @remarks
 * 
 * <b>TitleNum</b> and <b>ChapterNum</b> or <b>TitleNum</b> and <b>TimeCode</b> are sufficient to save the playback location for simple linear movies.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_playback_location
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_PLAYBACK_LOCATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Title number for the whole disc; Title Track Number (TTN) not Video Title Set_Title Track Number (VTS_TTN).
     * @type {Integer}
     */
    TitleNum {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Part-of-title number with title. 0xffffffff if not a simple linear movie.
     * @type {Integer}
     */
    ChapterNum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Timecode. Use [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) for current playback time. 0xFFFFFFFF if not a simple linear movie.
     * @type {Integer}
     */
    TimeCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}

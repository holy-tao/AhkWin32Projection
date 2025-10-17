#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DVD_HMSF_TIMECODE.ahk

/**
 * The DVD_PLAYBACK_LOCATION2 structure indicates DVD playback location.
 * @remarks
 * 
  * Either <b>TitleNum</b> and <b>ChapterNum</b>, or <b>TitleNum</b> and <b>TimeCode</b>, are sufficient to save the playback location for simple linear movies.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-dvd_playback_location2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_PLAYBACK_LOCATION2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Title number for the whole disc (not the track number of the Video Title Set).
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
     * Timecode. Use [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) for current playback time. 0xffffffff if not a simple linear movie.
     * @type {DVD_HMSF_TIMECODE}
     */
    TimeCode{
        get {
            if(!this.HasProp("__TimeCode"))
                this.__TimeCode := DVD_HMSF_TIMECODE(8, this)
            return this.__TimeCode
        }
    }

    /**
     * A bitwise [DVD_TIMECODE_FLAGS](/windows/desktop/api/strmif/ne-strmif-dvd_timecode_flags) enumeration.
     * @type {Integer}
     */
    TimeCodeFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}

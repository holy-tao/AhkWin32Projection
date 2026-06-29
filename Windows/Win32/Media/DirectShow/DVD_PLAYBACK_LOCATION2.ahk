#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_HMSF_TIMECODE.ahk" { DVD_HMSF_TIMECODE }

/**
 * The DVD_PLAYBACK_LOCATION2 structure indicates DVD playback location.
 * @remarks
 * Either <b>TitleNum</b> and <b>ChapterNum</b>, or <b>TitleNum</b> and <b>TimeCode</b>, are sufficient to save the playback location for simple linear movies.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_playback_location2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_PLAYBACK_LOCATION2 {
    #StructPack 4

    /**
     * Title number for the whole disc (not the track number of the Video Title Set).
     */
    TitleNum : UInt32

    /**
     * Part-of-title number with title. 0xffffffff if not a simple linear movie.
     */
    ChapterNum : UInt32

    /**
     * Timecode. Use [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) for current playback time. 0xffffffff if not a simple linear movie.
     */
    TimeCode : DVD_HMSF_TIMECODE

    /**
     * A bitwise [DVD_TIMECODE_FLAGS](/windows/desktop/api/strmif/ne-strmif-dvd_timecode_flags) enumeration.
     */
    TimeCodeFlags : UInt32

}

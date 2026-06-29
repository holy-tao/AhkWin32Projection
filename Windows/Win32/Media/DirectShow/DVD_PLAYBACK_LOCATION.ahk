#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DVD_PLAYBACK_LOCATION structure indicates DVD playback location.
 * @remarks
 * <b>TitleNum</b> and <b>ChapterNum</b> or <b>TitleNum</b> and <b>TimeCode</b> are sufficient to save the playback location for simple linear movies.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_playback_location
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_PLAYBACK_LOCATION {
    #StructPack 4

    /**
     * Title number for the whole disc; Title Track Number (TTN) not Video Title Set_Title Track Number (VTS_TTN).
     */
    TitleNum : UInt32

    /**
     * Part-of-title number with title. 0xffffffff if not a simple linear movie.
     */
    ChapterNum : UInt32

    /**
     * Timecode. Use [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) for current playback time. 0xFFFFFFFF if not a simple linear movie.
     */
    TimeCode : UInt32

}

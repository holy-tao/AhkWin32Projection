#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MPEG_TIME.ahk" { MPEG_TIME }
#Import ".\MPEG_DATE.ahk" { MPEG_DATE }

/**
 * The MPEG_DATE_AND_TIME structure specifies a date and time.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_date_and_time
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_DATE_AND_TIME {
    #StructPack 2

    /**
     * Specifies the date, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_date">MPEG_DATE</a> structure.
     */
    D : MPEG_DATE

    /**
     * Specifies the time, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-mpeg_time">MPEG_TIME</a> structure.
     */
    T : MPEG_TIME

}

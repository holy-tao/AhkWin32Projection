#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPEG_TIME structure represents a time of day, or a duration.
 * @remarks
 * The <b>MPEG_DURATION</b> structure is a <c>typedef</c> for the <b>MPEG_TIME</b> structure.
 * 
 * <pre class="syntax" xml:space="preserve"><c>typedef MPEG_TIME MPEG_DURATION;</c></pre>
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_time
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_TIME {
    #StructPack 1

    /**
     * Specifies the hours. The value can range from 0 to 23, inclusive.
     */
    Hours : Int8

    /**
     * Specifies the minutes. The value can range from 0 to 59, inclusive.
     */
    Minutes : Int8

    /**
     * Specifies the seconds. The value can range from 0 to 59, inclusive.
     */
    Seconds : Int8

}

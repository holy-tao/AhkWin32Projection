#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPEG_DATE structure specifies a date.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpeg_date
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPEG_DATE {
    #StructPack 2

    /**
     * Specifies the day of the month. The value can range from 1 to 31, inclusive.
     */
    Date : Int8

    /**
     * Specifies the month. The value can range from 1 to 12, inclusive.
     */
    Month : Int8

    /**
     * Specifies the year.
     */
    Year : UInt16

}

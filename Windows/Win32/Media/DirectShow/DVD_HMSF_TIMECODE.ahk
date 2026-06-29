#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DVD_HMSF_TIMECODE structure gives the hours, minutes, seconds, and frames in a DVD timecode.
 * @remarks
 * A <c>DVD_HMSF_TIMECODE</code> structure is used in various <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcontrol2">IDvdControl2</a> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdinfo2">IDvdInfo2</a> methods. A <code>DVD_HMSF_TIMECODE</code> structure can be cast to or from a <b>ULONG</b> value. This means that if you need to use the old BCD time format for backward compatibility, you can do so in place of a <code>DVD_HMSF_TIMECODE</c> structure.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_hmsf_timecode
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_HMSF_TIMECODE {
    #StructPack 1

    /**
     * Hours.
     */
    bHours : Int8

    /**
     * Minutes.
     */
    bMinutes : Int8

    /**
     * Seconds.
     */
    bSeconds : Int8

    /**
     * Frames.
     */
    bFrames : Int8

}

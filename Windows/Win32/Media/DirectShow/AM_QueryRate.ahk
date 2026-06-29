#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_QueryRate structure is used to query the decoder's maximum full-frame rate for forward and reverse playback.
 * @remarks
 * Rate is the inverse of speed. For example, if the playback speed is 2x, the rate is 1/2, so the <b>Rate</b> member is set to 5000. Reverse rates are negative.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_queryrate
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_QueryRate {
    #StructPack 4

    /**
     * Specifies the maximum forward full-frame rate, as rate x 10000.
     */
    lMaxForwardFullFrame : Int32

    /**
     * Specifies the maximum reverse full-frame rate, as rate x 10000.
     */
    lMaxReverseFullFrame : Int32

}

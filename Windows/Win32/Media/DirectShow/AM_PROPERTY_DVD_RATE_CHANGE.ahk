#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_PROPERTY_DVD_RATE_CHANGE enumeration is not used.
 * @remarks
 * 
 * This enumeration is defined in dvdmedia.h but was never used. It is included here for the sake of completeness. For DVD rate-change control, use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/rate-change-property-set">Rate Change Property Set</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ne-dvdmedia-am_property_dvd_rate_change
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_PROPERTY_DVD_RATE_CHANGE extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_RATE_ChangeRate => 1

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_RATE_FullDataRateMax => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_RATE_ReverseDecode => 3

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_RATE_DecoderPosition => 4

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_RATE_DecoderVersion => 5
}

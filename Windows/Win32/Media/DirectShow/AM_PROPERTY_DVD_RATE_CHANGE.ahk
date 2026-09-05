#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_PROPERTY_DVD_RATE_CHANGE enumeration is not used.
 * @remarks
 * This enumeration is defined in dvdmedia.h but was never used. It is included here for the sake of completeness. For DVD rate-change control, use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/rate-change-property-set">Rate Change Property Set</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_property_dvd_rate_change
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_PROPERTY_DVD_RATE_CHANGE extends Win32Enum {

    /**
     * Reserved.
     * Native name: AM_RATE_ChangeRate
     * @type {Integer (Int32)}
     */
    static Rate => 1

    /**
     * Reserved.
     * Native name: AM_RATE_FullDataRateMax
     * @type {Integer (Int32)}
     */
    static FullDataRateMax => 2

    /**
     * Reserved.
     * Native name: AM_RATE_ReverseDecode
     * @type {Integer (Int32)}
     */
    static ReverseDecode => 3

    /**
     * Reserved.
     * Native name: AM_RATE_DecoderPosition
     * @type {Integer (Int32)}
     */
    static DecoderPosition => 4

    /**
     * Reserved.
     * Native name: AM_RATE_DecoderVersion
     * @type {Integer (Int32)}
     */
    static DecoderVersion => 5
}

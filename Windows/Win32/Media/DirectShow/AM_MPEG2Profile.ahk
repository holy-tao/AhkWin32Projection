#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates an MPEG-2 video profile as specified in the MPEG-2 video standard (ISO13818-2).
 * @remarks
 * DVD video decoders should support <b>AM_MPEG2Profile_Simple</b> or <b>AM_MPEG2Profile_Main</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_mpeg2profile
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_MPEG2Profile extends Win32Enum{

    /**
     * Simple profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_Simple => 1

    /**
     * Main profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_Main => 2

    /**
     * Signal to Noise Ratio (SNR) scalable profile
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_SNRScalable => 3

    /**
     * Spatially scalable profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_SpatiallyScalable => 4

    /**
     * High profile.
     * @type {Integer (Int32)}
     */
    static AM_MPEG2Profile_High => 5
}

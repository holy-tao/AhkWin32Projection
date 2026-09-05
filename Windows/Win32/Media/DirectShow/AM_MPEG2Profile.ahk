#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates an MPEG-2 video profile as specified in the MPEG-2 video standard (ISO13818-2).
 * @remarks
 * DVD video decoders should support <b>AM_MPEG2Profile_Simple</b> or <b>AM_MPEG2Profile_Main</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_mpeg2profile
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_MPEG2Profile extends Win32Enum {

    /**
     * Simple profile.
     * Native name: AM_MPEG2Profile_Simple
     * @type {Integer (Int32)}
     */
    static Simple => 1

    /**
     * Main profile.
     * Native name: AM_MPEG2Profile_Main
     * @type {Integer (Int32)}
     */
    static Main => 2

    /**
     * Signal to Noise Ratio (SNR) scalable profile
     * Native name: AM_MPEG2Profile_SNRScalable
     * @type {Integer (Int32)}
     */
    static SNRScalable => 3

    /**
     * Spatially scalable profile.
     * Native name: AM_MPEG2Profile_SpatiallyScalable
     * @type {Integer (Int32)}
     */
    static SpatiallyScalable => 4

    /**
     * High profile.
     * Native name: AM_MPEG2Profile_High
     * @type {Integer (Int32)}
     */
    static High => 5
}

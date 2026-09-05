#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates an MPEG-2 video level as specified in the MPEG-2 video standard (ISO13818-2).
 * @remarks
 * DVD MPEG-2 video decoders should support AM_MPEG2Level_Low or AM_MPEG2Level_Main.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_mpeg2level
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_MPEG2Level extends Win32Enum {

    /**
     * Low level.
     * Native name: AM_MPEG2Level_Low
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Main level.
     * Native name: AM_MPEG2Level_Main
     * @type {Integer (Int32)}
     */
    static Main => 2

    /**
     * High 1440 level.
     * Native name: AM_MPEG2Level_High1440
     * @type {Integer (Int32)}
     */
    static High1440 => 3

    /**
     * High level.
     * Native name: AM_MPEG2Level_High
     * @type {Integer (Int32)}
     */
    static High => 4
}

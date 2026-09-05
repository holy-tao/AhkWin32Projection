#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the seeking capabilities of a media stream.
 * @remarks
 * Most DirectShow filters do not report the <b>AM_SEEKING_CanGetCurrentPos</b> capability flag. However, the Filter Graph Manager's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getcurrentposition">IMediaSeeking::GetCurrentPosition</a> is based on the reference clock, so you can call this method even if the capabilities flags do not include <b>AM_SEEKING_CanGetCurrentPos</b>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_seeking_seeking_capabilities
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_SEEKING_SEEKING_CAPABILITIES extends Win32Enum {

    /**
     * The stream can seek to an absolute position.
     * Native name: AM_SEEKING_CanSeekAbsolute
     * @type {Integer (Int32)}
     */
    static CanSeekAbsolute => 1

    /**
     * The stream can seek forward.
     * Native name: AM_SEEKING_CanSeekForwards
     * @type {Integer (Int32)}
     */
    static CanSeekForwards => 2

    /**
     * The stream can seek backward.
     * Native name: AM_SEEKING_CanSeekBackwards
     * @type {Integer (Int32)}
     */
    static CanSeekBackwards => 4

    /**
     * The stream can report its current position. See Remarks.
     * Native name: AM_SEEKING_CanGetCurrentPos
     * @type {Integer (Int32)}
     */
    static CanGetCurrentPos => 8

    /**
     * The stream can report its stop position.
     * Native name: AM_SEEKING_CanGetStopPos
     * @type {Integer (Int32)}
     */
    static CanGetStopPos => 16

    /**
     * The stream can report its duration.
     * Native name: AM_SEEKING_CanGetDuration
     * @type {Integer (Int32)}
     */
    static CanGetDuration => 32

    /**
     * The stream can play backward.
     * Native name: AM_SEEKING_CanPlayBackwards
     * @type {Integer (Int32)}
     */
    static CanPlayBackwards => 64

    /**
     * The stream can do seamless looping (see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-setpositions">IMediaSeeking::SetPositions</a>).
     * Native name: AM_SEEKING_CanDoSegments
     * @type {Integer (Int32)}
     */
    static CanDoSegments => 128

    /**
     * Reserved.
     * Native name: AM_SEEKING_Source
     * @type {Integer (Int32)}
     */
    static Source => 256
}

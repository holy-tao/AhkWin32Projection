#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the seeking capabilities of a media stream.
 * @remarks
 * Most DirectShow filters do not report the <b>AM_SEEKING_CanGetCurrentPos</b> capability flag. However, the Filter Graph Manager's implementation of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-getcurrentposition">IMediaSeeking::GetCurrentPosition</a> is based on the reference clock, so you can call this method even if the capabilities flags do not include <b>AM_SEEKING_CanGetCurrentPos</b>.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-am_seeking_seeking_capabilities
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_SEEKING_SEEKING_CAPABILITIES extends Win32Enum{

    /**
     * The stream can seek to an absolute position.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanSeekAbsolute => 1

    /**
     * The stream can seek forward.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanSeekForwards => 2

    /**
     * The stream can seek backward.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanSeekBackwards => 4

    /**
     * The stream can report its current position. See Remarks.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanGetCurrentPos => 8

    /**
     * The stream can report its stop position.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanGetStopPos => 16

    /**
     * The stream can report its duration.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanGetDuration => 32

    /**
     * The stream can play backward.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanPlayBackwards => 64

    /**
     * The stream can do seamless looping (see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-setpositions">IMediaSeeking::SetPositions</a>).
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_CanDoSegments => 128

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_SEEKING_Source => 256
}

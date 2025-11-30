#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPPlayState enumeration type defines the possible operational states of Windows Media Player as it plays a digital media file.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/ne-wmp-wmpplaystate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPPlayState extends Win32Enum{

    /**
     * Windows Media Player is in an undefined state.
     * @type {Integer (Int32)}
     */
    static wmppsUndefined => 0

    /**
     * Playback is stopped.
     * @type {Integer (Int32)}
     */
    static wmppsStopped => 1

    /**
     * Playback is paused.
     * @type {Integer (Int32)}
     */
    static wmppsPaused => 2

    /**
     * Stream is playing.
     * @type {Integer (Int32)}
     */
    static wmppsPlaying => 3

    /**
     * Stream is scanning forward.
     * @type {Integer (Int32)}
     */
    static wmppsScanForward => 4

    /**
     * Stream is scanning backward.
     * @type {Integer (Int32)}
     */
    static wmppsScanReverse => 5

    /**
     * Stream is being buffered.
     * @type {Integer (Int32)}
     */
    static wmppsBuffering => 6

    /**
     * Waiting for streaming data.
     * @type {Integer (Int32)}
     */
    static wmppsWaiting => 7

    /**
     * The end of the media item has been reached.
     * @type {Integer (Int32)}
     */
    static wmppsMediaEnded => 8

    /**
     * Preparing new media item.
     * @type {Integer (Int32)}
     */
    static wmppsTransitioning => 9

    /**
     * Ready to begin playing.
     * @type {Integer (Int32)}
     */
    static wmppsReady => 10

    /**
     * Trying to reconnect for streaming data.
     * @type {Integer (Int32)}
     */
    static wmppsReconnecting => 11

    /**
     * Last enumerated value. Not a valid state.
     * @type {Integer (Int32)}
     */
    static wmppsLast => 12
}

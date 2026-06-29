#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMPPlayState enumeration type defines the possible operational states of Windows Media Player as it plays a digital media file.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpplaystate
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPPlayState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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

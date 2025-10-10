#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the current playback state.
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/ne-mfplay-mfp_mediaplayer_state
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_MEDIAPLAYER_STATE{

    /**
     * Initial state. No media items have been set on the player object.
     * @type {Integer (Int32)}
     */
    static MFP_MEDIAPLAYER_STATE_EMPTY => 0

    /**
     * Playback is stopped.
     * @type {Integer (Int32)}
     */
    static MFP_MEDIAPLAYER_STATE_STOPPED => 1

    /**
     * Playback is in progress.
     * @type {Integer (Int32)}
     */
    static MFP_MEDIAPLAYER_STATE_PLAYING => 2

    /**
     * Playback is paused.
     * @type {Integer (Int32)}
     */
    static MFP_MEDIAPLAYER_STATE_PAUSED => 3

    /**
     * The player object was shut down. This state is returned after the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">IMFPMediaPlayer::Shutdown</a>.
     * @type {Integer (Int32)}
     */
    static MFP_MEDIAPLAYER_STATE_SHUTDOWN => 4
}

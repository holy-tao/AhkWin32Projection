#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines event types for the IMFPMediaPlayerCallback interface.
 * @remarks
 * For each event type, the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback receives a pointer to a data structure. The first part of the data structure is always an <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure. The following table lists the data structure for each event type.
 * 
 * In your implementation of <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">OnMediaPlayerEvent</a>, you must cast the <i>pEventHeader</i> parameter to the correct structure type. A set of macros is defined for this purpose. These macros check the value of the event type and return <b>NULL</b> if there is a mismatch; otherwise they return a pointer to the correct structure type.
 * 
 * <table>
 * <tr>
 * <td><b>Event type</b></td>
 * <td>
 * <b>Event structure</b>
 * 
 * <b>Pointer cast macro</b>
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_PLAY</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_play_event">MFP_PLAY_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_play_event">MFP_GET_PLAY_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_PAUSE</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_pause_event">MFP_PAUSE_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_pause_event">MFP_GET_PAUSE_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_STOP</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_stop_event">MFP_STOP_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_stop_event">MFP_GET_STOP_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_POSITION_SET</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_position_set_event">MFP_POSITION_SET_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_position_set_event">MFP_GET_POSITION_SET_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_RATE_SET</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_rate_set_event">MFP_RATE_SET_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_rate_set_event">MFP_GET_RATE_SET_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_MEDIAITEM_CREATED</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_mediaitem_created_event">MFP_MEDIAITEM_CREATED_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_mediaitem_created_event">MFP_GET_MEDIAITEM_CREATED_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_MEDIAITEM_SET</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_mediaitem_set_event">MFP_MEDIAITEM_SET_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_mediaitem_set_event">MFP_GET_MEDIAITEM_SET_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_FRAME_STEP</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_frame_step_event">MFP_FRAME_STEP_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_frame_step_event">MFP_GET_FRAME_STEP_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_MEDIAITEM_CLEARED</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_mediaitem_cleared_event">MFP_MEDIAITEM_CLEARED_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_mediaitem_cleared_event">MFP_GET_MEDIAITEM_CLEARED_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_MF</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_mf_event">MFP_MF_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_mf_event">MFP_GET_MF_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_ERROR</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_error_event">MFP_ERROR_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_error_event">MFP_GET_ERROR_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_PLAYBACK_ENDED</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_playback_ended_event">MFP_PLAYBACK_ENDED_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_playback_ended_event">MFP_GET_PLAYBACK_ENDED_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL</td>
 * <td>
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_acquire_user_credential_event">MFP_ACQUIRE_USER_CREDENTIAL_EVENT</a>
 * 
 * 
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfp_get_acquire_user_credential_event">MFP_GET_ACQUIRE_USER_CREDENTIAL_EVENT</a>
 * 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/ne-mfplay-mfp_event_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFP_EVENT_TYPE extends Win32Enum{

    /**
     * Playback has started. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-play">IMFPMediaPlayer::Play</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_PLAY => 0

    /**
     * Playback has paused. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-pause">IMFPMediaPlayer::Pause</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_PAUSE => 1

    /**
     * Playback has stopped. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-stop">IMFPMediaPlayer::Stop</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_STOP => 2

    /**
     * The MFPlay player object has seeked to a new playback position. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setposition">IMFPMediaPlayer::SetPosition</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_POSITION_SET => 3

    /**
     * The playback rate has changed. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setrate">IMFPMediaPlayer::SetRate</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_RATE_SET => 4

    /**
     * A new media item was created. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">CreateMediaItemFromObject</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_MEDIAITEM_CREATED => 5

    /**
     * A media item is ready for playback. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem">IMFPMediaPlayer::SetMediaItem</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_MEDIAITEM_SET => 6

    /**
     * A frame-step operation has completed. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-framestep">IMFPMediaPlayer::FrameStep</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_FRAME_STEP => 7

    /**
     * The current media item was cleared. This event is sent when the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-clearmediaitem">IMFPMediaPlayer::ClearMediaItem</a> method completes.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_MEDIAITEM_CLEARED => 8

    /**
     * A pipeline object sent an event. The player object forwards certain pipeline events to the application. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_mf_event">MFP_MF_EVENT</a>.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_MF => 9

    /**
     * A playback error has occurred.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_ERROR => 10

    /**
     * Playback has ended. The player object sends this event when playback reaches the end of the media file.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_PLAYBACK_ENDED => 11

    /**
     * The media source requires authentication before it can play the file.
     * @type {Integer (Int32)}
     */
    static MFP_EVENT_TYPE_ACQUIRE_USER_CREDENTIAL => 12
}

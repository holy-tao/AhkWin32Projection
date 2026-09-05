#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines event codes for the Media Engine.
 * @remarks
 * The application receives Media Engine events through the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEngineNotify::EventNotify</a> method. The <b>EventNotify</b> method includes two event parameters, <i>param1</i> and <i>param2</i>. The meaning of the parameters depends on the event code. If the event description does not list any parameters, ignore the values of <i>param1</i> and <i>param2</i>.
 * 
 * Values below 1000 correspond to events defined in HTML 5 for media elements.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_event
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_EVENT extends Win32Enum {

    /**
     * The Media Engine has started to load the source. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">IMFMediaEngine::Load</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_LOADSTART
     * @type {Integer (Int32)}
     */
    static LOADSTART => 1

    /**
     * The Media Engine is loading the source.
     * Native name: MF_MEDIA_ENGINE_EVENT_PROGRESS
     * @type {Integer (Int32)}
     */
    static PROGRESS => 2

    /**
     * The Media Engine has suspended a load operation.
     * Native name: MF_MEDIA_ENGINE_EVENT_SUSPEND
     * @type {Integer (Int32)}
     */
    static SUSPEND => 3

    /**
     * The Media Engine cancelled a load operation that was in progress.
     * Native name: MF_MEDIA_ENGINE_EVENT_ABORT
     * @type {Integer (Int32)}
     */
    static ABORT => 4

    /**
     * An error occurred.
     * 
     * <table>
     * <tr>
     * <th>Event Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><i>param1</i></td>
     * <td>A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_err">MF_MEDIA_ENGINE_ERR</a> enumeration.</td>
     * </tr>
     * <tr>
     * <td><i>param2</i></td>
     * <td>An <b>HRESULT</b> error code, or zero.</td>
     * </tr>
     * </table>
     * Native name: MF_MEDIA_ENGINE_EVENT_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 5

    /**
     * The Media Engine has switched to the <b>MF_MEDIA_ENGINE_NETWORK_EMPTY</b> state. This can occur when the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">IMFMediaEngine::Load</a> method is called, or if an error occurs during the <b>Load</b> method. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getnetworkstate">IMFMediaEngine::GetNetworkState</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_EMPTIED
     * @type {Integer (Int32)}
     */
    static EMPTIED => 6

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">Load</a> algorithm is stalled, waiting for data.
     * Native name: MF_MEDIA_ENGINE_EVENT_STALLED
     * @type {Integer (Int32)}
     */
    static STALLED => 7

    /**
     * The Media Engine is switching to the playing state. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play">IMFMediaEngine::Play</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_PLAY
     * @type {Integer (Int32)}
     */
    static PLAY => 8

    /**
     * The media engine has paused. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-pause">IMFMediaEngine::Pause</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_PAUSE
     * @type {Integer (Int32)}
     */
    static PAUSE => 9

    /**
     * The Media Engine has loaded enough source data to determine the duration and dimensions  of the source.
     * Native name: MF_MEDIA_ENGINE_EVENT_LOADEDMETADATA
     * @type {Integer (Int32)}
     */
    static LOADEDMETADATA => 10

    /**
     * The Media Engine has loaded enough data to render some content (for example, a video frame).
     * Native name: MF_MEDIA_ENGINE_EVENT_LOADEDDATA
     * @type {Integer (Int32)}
     */
    static LOADEDDATA => 11

    /**
     * Playback has stopped because the next frame is not available.
     * Native name: MF_MEDIA_ENGINE_EVENT_WAITING
     * @type {Integer (Int32)}
     */
    static WAITING => 12

    /**
     * Playback has started. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play">IMFMediaEngine::Play</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_PLAYING
     * @type {Integer (Int32)}
     */
    static PLAYING => 13

    /**
     * Playback can start, but the Media Engine might need to stop to buffer more data.
     * Native name: MF_MEDIA_ENGINE_EVENT_CANPLAY
     * @type {Integer (Int32)}
     */
    static CANPLAY => 14

    /**
     * The Media Engine can probably play through to the end of the resource, without stopping to buffer data.
     * Native name: MF_MEDIA_ENGINE_EVENT_CANPLAYTHROUGH
     * @type {Integer (Int32)}
     */
    static CANPLAYTHROUGH => 15

    /**
     * The Media Engine has started seeking to a new playback position. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setcurrenttime">IMFMediaEngine::SetCurrentTime</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_SEEKING
     * @type {Integer (Int32)}
     */
    static SEEKING => 16

    /**
     * The Media Engine has seeked to a new playback position. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setcurrenttime">IMFMediaEngine::SetCurrentTime</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_SEEKED
     * @type {Integer (Int32)}
     */
    static SEEKED => 17

    /**
     * The playback position has changed. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrenttime">IMFMediaEngine::GetCurrentTime</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_TIMEUPDATE
     * @type {Integer (Int32)}
     */
    static TIMEUPDATE => 18

    /**
     * Playback has reached the end of the source. This event is not sent if the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getloop">GetLoop</a> is <b>TRUE</b>.
     * Native name: MF_MEDIA_ENGINE_EVENT_ENDED
     * @type {Integer (Int32)}
     */
    static ENDED => 19

    /**
     * The playback rate has changed. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setplaybackrate">IMFMediaEngine::SetPlaybackRate</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_RATECHANGE
     * @type {Integer (Int32)}
     */
    static RATECHANGE => 20

    /**
     * The duration of the media source has changed. See <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getduration">IMFMediaEngine::GetDuration</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_DURATIONCHANGE
     * @type {Integer (Int32)}
     */
    static DURATIONCHANGE => 21

    /**
     * The audio volume changed. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setvolume">IMFMediaEngine::SetVolume</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_VOLUMECHANGE
     * @type {Integer (Int32)}
     */
    static VOLUMECHANGE => 22

    /**
     * The output format of the media source has changed.
     * 
     * <table>
     * <tr>
     * <th>Event Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><i>param1</i></td>
     * <td>Zero if the video format changed, 1 if the audio format changed.</td>
     * </tr>
     * <tr>
     * <td><i>param2</i></td>
     * <td>Zero.</td>
     * </tr>
     * </table>
     * Native name: MF_MEDIA_ENGINE_EVENT_FORMATCHANGE
     * @type {Integer (Int32)}
     */
    static FORMATCHANGE => 1000

    /**
     * The Media Engine flushed any pending events from its 	queue.
     * Native name: MF_MEDIA_ENGINE_EVENT_PURGEQUEUEDEVENTS
     * @type {Integer (Int32)}
     */
    static PURGEQUEUEDEVENTS => 1001

    /**
     * The playback position reached a timeline marker. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-settimelinemarkertimer">IMFMediaEngineEx::SetTimelineMarkerTimer</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_TIMELINE_MARKER
     * @type {Integer (Int32)}
     */
    static TIMELINE_MARKER => 1002

    /**
     * The audio balance changed. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setbalance">IMFMediaEngineEx::SetBalance</a>.
     * Native name: MF_MEDIA_ENGINE_EVENT_BALANCECHANGE
     * @type {Integer (Int32)}
     */
    static BALANCECHANGE => 1003

    /**
     * The Media Engine has finished downloading the source data.
     * Native name: MF_MEDIA_ENGINE_EVENT_DOWNLOADCOMPLETE
     * @type {Integer (Int32)}
     */
    static DOWNLOADCOMPLETE => 1004

    /**
     * The media source has started to buffer data.
     * Native name: MF_MEDIA_ENGINE_EVENT_BUFFERINGSTARTED
     * @type {Integer (Int32)}
     */
    static BUFFERINGSTARTED => 1005

    /**
     * The media source has stopped buffering data.
     * Native name: MF_MEDIA_ENGINE_EVENT_BUFFERINGENDED
     * @type {Integer (Int32)}
     */
    static BUFFERINGENDED => 1006

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-framestep">IMFMediaEngineEx::FrameStep</a> method completed.
     * Native name: MF_MEDIA_ENGINE_EVENT_FRAMESTEPCOMPLETED
     * @type {Integer (Int32)}
     */
    static FRAMESTEPCOMPLETED => 1007

    /**
     * The Media Engine's <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">Load</a> algorithm is waiting to start.
     * 
     * <table>
     * <tr>
     * <th>Event Parameter</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><i>param1</i></td>
     * <td>A handle to a waitable event, of type <b>HANDLE</b>.</td>
     * </tr>
     * <tr>
     * <td><i>param2</i></td>
     * <td>Zero.</td>
     * </tr>
     * </table>
     *  
     * 
     * If Media Engine is created with the <b>MF_MEDIA_ENGINE_WAITFORSTABLE_STATE</b> flag, the Media Engine sends the <b>MF_MEDIA_ENGINE_EVENT_NOTIFYSTABLESTATE</b> event at the start of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">Load</a> algorithm. The <i>param1</i> parameter is a handle to a waitable event. The <b>Load</b> thread waits for the application to signal the event by calling <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-setevent">SetEvent</a>.
     * 
     * If the Media Engine is not created with the <b>MF_MEDIA_ENGINE_WAITFORSTABLE_STATE</b>, it does not send this event, and the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">Load</a> thread does not wait to be signalled.
     * Native name: MF_MEDIA_ENGINE_EVENT_NOTIFYSTABLESTATE
     * @type {Integer (Int32)}
     */
    static NOTIFYSTABLESTATE => 1008

    /**
     * The first frame of the media source is ready to render.
     * Native name: MF_MEDIA_ENGINE_EVENT_FIRSTFRAMEREADY
     * @type {Integer (Int32)}
     */
    static FIRSTFRAMEREADY => 1009

    /**
     * Raised when a new track is added or removed.
     * 
     * Supported in Windows 8.1 and later.
     * Native name: MF_MEDIA_ENGINE_EVENT_TRACKSCHANGE
     * @type {Integer (Int32)}
     */
    static TRACKSCHANGE => 1010

    /**
     * Raised when there is new information about the <a href="https://docs.microsoft.com/windows/desktop/medfound/output-protection-manager">Output Protection Manager</a>  (OPM). 
     * 
     * This event will be raised when an OPM failure occurs, but ITA allows fallback without the OPM. In this case, constriction can be applied. 
     * 
     * This event will not be raised when there is an OPM failure and the fallback also fails. For example, if ITA blocks playback entirely when OPM cannot be established.
     * 
     * Supported in Windows 8.1 and later.
     * Native name: MF_MEDIA_ENGINE_EVENT_OPMINFO
     * @type {Integer (Int32)}
     */
    static OPMINFO => 1011

    /**
     * Native name: MF_MEDIA_ENGINE_EVENT_RESOURCELOST
     * @type {Integer (Int32)}
     */
    static RESOURCELOST => 1012

    /**
     * Native name: MF_MEDIA_ENGINE_EVENT_DELAYLOADEVENT_CHANGED
     * @type {Integer (Int32)}
     */
    static DELAYLOADEVENT_CHANGED => 1013

    /**
     * Raised when one of the component streams of a media stream fails. This event is only raised if the media stream contains other component streams that did not fail.
     * Native name: MF_MEDIA_ENGINE_EVENT_STREAMRENDERINGERROR
     * @type {Integer (Int32)}
     */
    static STREAMRENDERINGERROR => 1014

    /**
     * Native name: MF_MEDIA_ENGINE_EVENT_SUPPORTEDRATES_CHANGED
     * @type {Integer (Int32)}
     */
    static SUPPORTEDRATES_CHANGED => 1015

    /**
     * Native name: MF_MEDIA_ENGINE_EVENT_AUDIOENDPOINTCHANGE
     * @type {Integer (Int32)}
     */
    static AUDIOENDPOINTCHANGE => 1016
}

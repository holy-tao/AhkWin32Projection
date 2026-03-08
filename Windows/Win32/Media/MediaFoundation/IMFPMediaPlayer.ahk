#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include .\IMFPMediaItem.ahk
#Include .\MFVideoNormalizedRect.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods to play media files. (Deprecated.).
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/nn-mfplay-imfpmediaplayer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMediaPlayer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMediaPlayer
     * @type {Guid}
     */
    static IID => Guid("{a714590a-58af-430a-85bf-44f5ec838d85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Play", "Pause", "Stop", "FrameStep", "SetPosition", "GetPosition", "GetDuration", "SetRate", "GetRate", "GetSupportedRates", "GetState", "CreateMediaItemFromURL", "CreateMediaItemFromObject", "SetMediaItem", "ClearMediaItem", "GetMediaItem", "GetVolume", "SetVolume", "GetBalance", "SetBalance", "GetMute", "SetMute", "GetNativeVideoSize", "GetIdealVideoSize", "SetVideoSourceRect", "GetVideoSourceRect", "SetAspectRatioMode", "GetAspectRatioMode", "GetVideoWindow", "UpdateVideo", "SetBorderColor", "GetBorderColor", "InsertEffect", "RemoveEffect", "RemoveAllEffects", "Shutdown"]

    /**
     * Starts playback. (IMFPMediaPlayer.Play)
     * @remarks
     * This method completes asynchronously.  When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_PLAY</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-play
     */
    Play() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Pauses playback. (IMFPMediaPlayer.Pause)
     * @remarks
     * This method completes asynchronously.  When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_PAUSE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-pause
     */
    Pause() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Stops playback.
     * @remarks
     * This method completes asynchronously.  When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_STOP</b>.
     * 
     * The current media item is still valid. After playback stops, the playback position resets to the beginning of the current media item.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Steps forward one video frame.
     * @remarks
     * This method completes asynchronously.  When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_FRAME_STEP</b>.
     * 
     * The player object does not support frame stepping during reverse playback (that is, while the playback rate is negative).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Cannot frame step. Reasons for this error code include:
     * 
     * <ul>
     * <li>There is no media item queued for playback.</li>
     * <li>The current media item does not contain video.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source does not support frame stepping, or the current playback rate is negative.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-framestep
     */
    FrameStep() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Sets the playback position.
     * @remarks
     * If you call this method while playback is stopped, the new position takes effect after playback resumes.
     * 
     * This method completes asynchronously. When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_POSITION_SET</b>.
     * 
     * If playback was started before <b>SetPosition</b> is called, playback resumes at the new position. If playback was paused, the video is refreshed to display the current frame at the new position. 
     * 
     * If you make two consecutive calls to <b>SetPosition</b> with <i>guidPositionType</i> equal to <b>MFP_POSITIONTYPE_100NS</b>, and the second call is made before the first call has completed, the second call supersedes the first. The status code for the superseded call is set to <b>S_FALSE</b> in the event data for that call. This behavior prevents excessive latency from repeated calls to <b>SetPosition</b>, as each call may force the media source to perform a relatively lengthy seek operation.
     * @param {Pointer<Guid>} guidPositionType Unit of time for the playback position. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFP_POSITIONTYPE_100NS"></a><a id="mfp_positiontype_100ns"></a><dl>
     * <dt><b>MFP_POSITIONTYPE_100NS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 100-nanosecond units. 
     * 
     * The value of <i>pvPositionValue</i> must be a <b>LARGE_INTEGER</b>.
     * 
     * <ul>
     * <li>Variant type (<b>vt</b>): <b>VT_I8</b></li>
     * <li>Variant member: <b>hVal</b></li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PROPVARIANT>} pvPositionValue New playback position. The meaning and data type of this parameter are indicated by the <i>guidPositionType</i> parameter.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32( ERROR_SEEK )</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>pvPositionValue</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALIDREQUEST</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No media item has been queued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setposition
     */
    SetPosition(guidPositionType, pvPositionValue) {
        result := ComCall(7, this, "ptr", guidPositionType, "ptr", pvPositionValue, "HRESULT")
        return result
    }

    /**
     * Gets the current playback position. (IMFPMediaPlayer.GetPosition)
     * @remarks
     * The playback position is calculated relative to the start time of the media item, which can be specified by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstartstopposition">IMFPMediaItem::SetStartStopPosition</a>. For example, if you set the start time to 20 seconds and the source duration is 60 seconds, the range of values returned by <b>GetPosition</b> is 0–40 seconds.
     * @param {Pointer<Guid>} guidPositionType Specifies the unit of time for the playback position. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFP_POSITIONTYPE_100NS"></a><a id="mfp_positiontype_100ns"></a><dl>
     * <dt><b><b>MFP_POSITIONTYPE_100NS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 100-nanosecond units. 
     * 
     * The value returned in <i>pvPositionValue</i> is a <b>LARGE_INTEGER</b>.
     * 
     * <ul>
     * <li>Variant type (<b>vt</b>): <b>VT_I8</b></li>
     * <li>Variant member: <b>hVal</b></li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the playback position.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getposition
     */
    GetPosition(guidPositionType) {
        pvPositionValue := PROPVARIANT()
        result := ComCall(8, this, "ptr", guidPositionType, "ptr", pvPositionValue, "HRESULT")
        return pvPositionValue
    }

    /**
     * Gets the playback duration of the current media item.
     * @remarks
     * This method calculates the playback duration, taking into account the start and stop times for the media item. To set the start and stop times, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstartstopposition">IMFPMediaItem::SetStartStopPosition</a> on the media item. To get the actual duration of the underlying media file, regardless of start and stop times, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getduration">IMFPMediaItem::GetDuration</a>.
     * 
     * For example, suppose that you load a 30-second audio file and set the start time equal to 2 seconds and stop time equal to 10 seconds. The <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getduration">IMFPMediaItem::GetDuration</a> method will return 30 seconds, but the <b>IMFPMediaPlayer::GetDuration</b> method will return 8 seconds.
     * @param {Pointer<Guid>} guidPositionType Specifies the unit of time for the duration. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFP_POSITIONTYPE_100NS"></a><a id="mfp_positiontype_100ns"></a><dl>
     * <dt><b><b>MFP_POSITIONTYPE_100NS</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 100-nanosecond units. 
     *                
     * 
     * The value returned in <i>pvDurationValue</i> is a <b>ULARGE_INTEGER</b>.
     * 
     * <ul>
     * <li>Variant type (<b>vt</b>): <b>VT_UI8</b></li>
     * <li>Variant member: <b>uhVal</b></li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the duration.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getduration
     */
    GetDuration(guidPositionType) {
        pvDurationValue := PROPVARIANT()
        result := ComCall(9, this, "ptr", guidPositionType, "ptr", pvDurationValue, "HRESULT")
        return pvDurationValue
    }

    /**
     * Sets the playback rate. (IMFPMediaPlayer.SetRate)
     * @remarks
     * This method completes asynchronously.  When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_RATE_SET</b>.
     * 
     * The method sets the nearest supported rate, which will depend on the underlying media source. For example, if <i>flRate</i> is 50 and the source's maximum rate is 8× normal rate, the method will set the rate to 8.0.  The actual rate is indicated in the event data for the <b>MFP_EVENT_TYPE_RATE_SET</b> event.
     * 
     * To find the range of supported rates, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-getsupportedrates">IMFPMediaPlayer::GetSupportedRates</a>.
     * 
     * This method does not support playback rates of zero, although Media Foundation defines a meaning for zero rates in some other contexts.
     * 
     * The new rate applies only to the current media item. Setting a new media item resets the playback rate to 1.0.
     * @param {Float} flRate Playback rate. The playback rate is expressed as a ratio of the current rate to the normal rate. For example, <b>1.0</b> indicates normal playback speed, <b>0.5</b> indicates half speed, and <b>2.0</b> indicates twice speed. Positive values indicate forward playback, and negative values indicate reverse playback.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_OUT_OF_RANGE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>flRate</i> parameter is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setrate
     */
    SetRate(flRate) {
        result := ComCall(10, this, "float", flRate, "HRESULT")
        return result
    }

    /**
     * Gets the current playback rate. (IMFPMediaPlayer.GetRate)
     * @returns {Float} Receives the playback rate. The playback rate is expressed as a ratio of the current rate to the normal rate. For example, 1.0 indicates normal playback, 0.5 indicates half speed, and 2.0 indicates twice speed. Positive values indicate forward playback, and negative values indicate reverse playback.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getrate
     */
    GetRate() {
        result := ComCall(11, this, "float*", &pflRate := 0, "HRESULT")
        return pflRate
    }

    /**
     * Gets the range of supported playback rates.
     * @remarks
     * Playback rates are expressed as a ratio of the current rate to the normal rate. For example, 1.0 indicates normal playback speed, 0.5 indicates half speed, and 2.0 indicates twice speed. Positive values indicate forward playback, and negative values indicate reverse playback.
     * @param {BOOL} fForwardDirection Specify  <b>TRUE</b> to get the playback rates for forward playback. Specify <b>FALSE</b> to get the rates for reverse playback.
     * @param {Pointer<Float>} pflSlowestRate Receives the slowest supported rate.
     * @param {Pointer<Float>} pflFastestRate Receives the fastest supported rate.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_UNSUPPORTED_RATE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media item does not support playback in the requested direction (either forward or reverse).
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getsupportedrates
     */
    GetSupportedRates(fForwardDirection, pflSlowestRate, pflFastestRate) {
        pflSlowestRateMarshal := pflSlowestRate is VarRef ? "float*" : "ptr"
        pflFastestRateMarshal := pflFastestRate is VarRef ? "float*" : "ptr"

        result := ComCall(12, this, "int", fForwardDirection, pflSlowestRateMarshal, pflSlowestRate, pflFastestRateMarshal, pflFastestRate, "HRESULT")
        return result
    }

    /**
     * Gets the current playback state of the MFPlay player object.
     * @remarks
     * This method can be called after the player object has been shut down.
     * 
     * Many of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> methods complete asynchronously. While an asynchronous operation is pending, the current state is not updated until the operation completes. When the operation completes, the application receives an event callback, and the new state is given in the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ns-mfplay-mfp_event_header">MFP_EVENT_HEADER</a> structure that is passed to the callback.
     * @returns {Integer} Receives the playback state, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_mediaplayer_state">MFP_MEDIAPLAYER_STATE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getstate
     */
    GetState() {
        result := ComCall(13, this, "int*", &peState := 0, "HRESULT")
        return peState
    }

    /**
     * Creates a media item from a URL.
     * @remarks
     * This method does not queue the media item for playback. To queue the item for playback, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem">IMFPMediaPlayer::SetMediaItem</a>.
     * 
     * The <b>CreateMediaItemFromURL</b> method can be called either synchronously or asynchronously: 
     * 
     * <ul>
     * <li>If <i>fSync</i> is <b>TRUE</b>, the method completes synchronously. The <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> pointer is returned in the <i>ppMediaItem</i> parameter. </li>
     * <li>If <i>fSync</i> is <b>FALSE</b>, the method completes asynchronously. When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_MEDIAITEM_CREATED</b>. The event data contains the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> pointer for the new media item.</li>
     * </ul>
     * The callback interface is set when you first call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfpcreatemediaplayer">MFPCreateMediaPlayer</a> to create the MFPlay player object. If you do not provide a callback interface, the <i>fSync</i> parameter must be <b>TRUE</b>. Otherwise, <b>CreateMediaItemFromURL</b> returns <b>MF_E_INVALIDREQUEST</b>. 
     * 
     * If you make multiple asynchronous calls to <b>CreateMediaItemFromURL</b>, they are not guaranteed to complete in the same order. Use the <i>dwUserData</i> parameter to match created media items with pending requests.
     * 
     * Currently, this method returns <b>MF_E_UNSUPPORTED_SCHEME</b> if the URL specifies any of the following protocols: rtsp*, mms*, or mcast. If you want to use the Media Foundation network source with MFPlay, first use the <a href="https://docs.microsoft.com/windows/desktop/medfound/source-resolver">Source Resolver</a> to create the source, and then call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">IMFPMediaPlayer::CreateMediaItemFromObject</a>.
     * 
     * <h3><a id="Configuring_the_Source"></a><a id="configuring_the_source"></a><a id="CONFIGURING_THE_SOURCE"></a>Configuring the Source</h3>
     * Internally, this method creates a media source. To configure the media source, do the following:
     * 
     * <ol>
     * <li>Call <b>QueryInterface</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> pointer to get the <b>IPropertyStore</b> interface.</li>
     * <li>Call <b>IPropertyStore::SetValue</b> to set properties for the media source. For a list of configuration properties, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>. Third-party media sources may define custom properties.</li>
     * <li>Call the <b>CreateMediaItemFromURL</b> method to create the media item.</li>
     * </ol>
     * @param {PWSTR} pwszURL Null-terminated string that contains the URL of a media file.
     * @param {BOOL} fSync If <b>TRUE</b>, the method blocks until it completes. If <b>FALSE</b>, the method does not block and completes asynchronously.
     * @param {Pointer} dwUserData Application-defined value to store in the media item. To retrieve this value from the media item, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getuserdata">IMFPMediaItem::GetUserData</a>.
     * @returns {IMFPMediaItem} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface. The caller must release the interface. If <i>fSync</i> is <b>TRUE</b>, this parameter must be a valid pointer. If <i>bSync</i> is <b>FALSE</b>, this parameter must be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl
     */
    CreateMediaItemFromURL(pwszURL, fSync, dwUserData) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(14, this, "ptr", pwszURL, "int", fSync, "ptr", dwUserData, "ptr*", &ppMediaItem := 0, "HRESULT")
        return IMFPMediaItem(ppMediaItem)
    }

    /**
     * Creates a media item from an object.
     * @remarks
     * The <i>pIUnknownObj</i> parameter must specify one of the following:
     * 
     * <ul>
     * <li>A pointer to a media source. Media sources expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> interface. It is the caller's responsibility to call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">IMFMediaSource::Shutdown</a> on the media source.</li>
     * <li>A pointer to a byte stream. Byte streams expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface. Internally, the method calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsourceresolver-createobjectfrombytestream">IMFSourceResolver::CreateObjectFromByteStream</a> method to create a media source from the byte stream. Therefore, a byte-stream handler must be registered for the byte stream. For more information about byte-stream handlers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/scheme-handlers-and-byte-stream-handlers">Scheme Handlers and Byte-Stream Handlers</a>.
     * 
     * </li>
     * </ul>
     * This method does not queue the media item for playback. To queue the item for playback, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem">IMFPMediaPlayer::SetMediaItem</a>.
     * 
     * The <b>CreateMediaItemFromObject</b> method can be called either synchronously or asynchronously: 
     * 
     * <ul>
     * <li>If <i>fSync</i> is <b>TRUE</b>, the method completes synchronously. The <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> pointer is returned in the <i>ppMediaItem</i> parameter. </li>
     * <li>If <i>fSync</i> is <b>FALSE</b>, the method completes asynchronously. When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_MEDIAITEM_CREATED</b>. The event data contains the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> pointer for the new media item.</li>
     * </ul>
     * The callback interface is set when you first call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfpcreatemediaplayer">MFPCreateMediaPlayer</a> to create the MFPlay player object. If you do not provide a callback interface, the <i>fSync</i> parameter must be <b>TRUE</b>. Otherwise, <b>CreateMediaItemFromObject</b> returns <b>MF_E_INVALIDREQUEST</b>. 
     * 
     * If you make multiple asynchronous calls to <b>CreateMediaItemFromObject</b>, they are not guaranteed to complete in the same order. Use the <i>dwUserData</i> parameter to match created media items with pending requests.
     * 
     * <h3><a id="Configuring_the_Source"></a><a id="configuring_the_source"></a><a id="CONFIGURING_THE_SOURCE"></a>Configuring the Source</h3>
     * If <i>pIUnknownObj</i> points to a byte stream, you can configure the media source by performing the following steps:
     * 
     * <ol>
     * <li>Call <b>QueryInterface</b> on the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> pointer to get the <b>IPropertyStore</b> interface.</li>
     * <li>Call <b>IPropertyStore::SetValue</b> to set properties for the media source. For a list of configuration properties, see <a href="https://docs.microsoft.com/windows/desktop/medfound/configuring-a-media-source">Configuring a Media Source</a>. Third-party media sources may define custom properties.</li>
     * <li>Call the <b>CreateMediaItemFromObject</b> method to create the media item.</li>
     * </ol>
     * If <i>pIUnknownObj</i> points to a media source, you can configure the source at the time that you create it.
     * @param {IUnknown} pIUnknownObj A pointer to the object's <b>IUnknown</b> interface. See Remarks.
     * @param {BOOL} fSync If <b>TRUE</b>, the method blocks until it completes. If <b>FALSE</b>, the method does not block and completes asynchronously.
     * @param {Pointer} dwUserData Application-defined value to store in the media item. To retrieve this value from the media item, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getuserdata">IMFPMediaItem::GetUserData</a>.
     * @returns {IMFPMediaItem} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface. The caller must release the interface. If <i>fSync</i> is <b>TRUE</b>, this parameter must be a valid pointer. If <i>bSync</i> is <b>FALSE</b>, this parameter must be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject
     */
    CreateMediaItemFromObject(pIUnknownObj, fSync, dwUserData) {
        result := ComCall(15, this, "ptr", pIUnknownObj, "int", fSync, "ptr", dwUserData, "ptr*", &ppMediaItem := 0, "HRESULT")
        return IMFPMediaItem(ppMediaItem)
    }

    /**
     * Queues a media item for playback.
     * @remarks
     * This method completes asynchronously.  When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_MEDIAITEM_SET</b>.
     * 
     * To create a media item, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">IMFPMediaPlayer::CreateMediaItemFromObject</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a>. A media item must be used with the same MFPlay player object that created that item. If the media item was created by a different instance of the player object, <b>SetMediaItem</b> returns <b>E_INVALIDARG</b>.
     * @param {IMFPMediaItem} pIMFPMediaItem Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface of the media item.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_DRM_UNSUPPORTED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media item contains protected content. MFPlay currently does not support protected content.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_NO_AUDIO_PLAYBACK_DEVICE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No audio playback device was found. This error can occur if the media source contains audio, but no audio playback devices are available on the system.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem
     */
    SetMediaItem(pIMFPMediaItem) {
        result := ComCall(16, this, "ptr", pIMFPMediaItem, "HRESULT")
        return result
    }

    /**
     * Clears the current media item.
     * @remarks
     * This method stops playback and releases the player object's references to the current media item.
     * 
     * This method completes asynchronously.  When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a> callback method is invoked. The event type is <b>MFP_EVENT_TYPE_MEDIAITEM_CLEARED</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-clearmediaitem
     */
    ClearMediaItem() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the current media item.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem">IMFPMediaPlayer::SetMediaItem</a> method is asynchronous. Therefore, while <b>SetMediaItem</b> is pending, <b>GetMediaItem</b> will not return the media item that was just set. Instead, the application should implement <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayercallback">IMFPMediaPlayerCallback</a> interface and handle the <b>MFP_EVENT_TYPE_MEDIAITEM_SET</b> event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/getting-started-with-mfplay">Receiving Events From the Player</a>.
     * 
     * The previous remark also applies to setting the media item in the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfpcreatemediaplayer">MFPCreateMediaPlayer</a> function.
     * @returns {IMFPMediaItem} Receives a pointer to the media item's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getmediaitem
     */
    GetMediaItem() {
        result := ComCall(18, this, "ptr*", &ppIMFPMediaItem := 0, "HRESULT")
        return IMFPMediaItem(ppIMFPMediaItem)
    }

    /**
     * Gets the current audio volume.
     * @returns {Float} Receives the audio volume. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getvolume
     */
    GetVolume() {
        result := ComCall(19, this, "float*", &pflVolume := 0, "HRESULT")
        return pflVolume
    }

    /**
     * Sets the audio volume.
     * @remarks
     * If you call this method before playback starts, the setting is applied after playback starts.
     * 
     * This method does not change the master volume level for the player's audio session. Instead, it adjusts the per-channel volume levels for audio stream(s) that belong to the current media item. Other streams in the audio session are not affected. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/managing-the-audio-session">Managing the Audio Session</a>.
     * @param {Float} flVolume The volume level. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_OUT_OF_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>flVolume</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setvolume
     */
    SetVolume(flVolume) {
        result := ComCall(20, this, "float", flVolume, "HRESULT")
        return result
    }

    /**
     * Gets the current audio balance.
     * @returns {Float} Receives the balance. The value can be any number in the following range (inclusive).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1.0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The left channel is at full volume; the right channel is silent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>+1.0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The right channel is at full volume; the left channel is silent.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the value is zero, the left and right channels are at equal volumes. The default value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getbalance
     */
    GetBalance() {
        result := ComCall(21, this, "float*", &pflBalance := 0, "HRESULT")
        return pflBalance
    }

    /**
     * Sets the audio balance. (IMFPMediaPlayer.SetBalance)
     * @remarks
     * If you call this method before playback starts, the setting is applied when playback starts.
     * @param {Float} flBalance The audio balance. The value can be any number in the following range (inclusive).
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>-1.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The left channel is at full volume; the right channel is silent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>+1.0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The right channel is at full volume; the left channel is silent.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the value is zero, the left and right channels are at equal volumes. The default value is zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_OUT_OF_RANGE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>flBalance</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setbalance
     */
    SetBalance(flBalance) {
        result := ComCall(22, this, "float", flBalance, "HRESULT")
        return result
    }

    /**
     * Queries whether the audio is muted. (IMFPMediaPlayer.GetMute)
     * @returns {BOOL} Receives the value <b>TRUE</b> if the audio is muted, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getmute
     */
    GetMute() {
        result := ComCall(23, this, "int*", &pfMute := 0, "HRESULT")
        return pfMute
    }

    /**
     * Mutes or unmutes the audio. (IMFPMediaPlayer.SetMute)
     * @remarks
     * If you call this method before playback starts, the setting is applied after playback starts.
     * 
     * This method does not mute the entire audio session to which the player belongs. It mutes only the streams from the current media item. Other streams in the audio session are not affected. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/managing-the-audio-session">Managing the Audio Session</a>.
     * @param {BOOL} fMute Specify <b>TRUE</b> to mute the audio, or <b>FALSE</b> to unmute the audio.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setmute
     */
    SetMute(fMute) {
        result := ComCall(24, this, "int", fMute, "HRESULT")
        return result
    }

    /**
     * Gets the size and aspect ratio of the video.
     * @remarks
     * At least one parameter must be non-<b>NULL</b>.
     * @param {Pointer<SIZE>} pszVideo Receives the size of the video, in pixels. This parameter can be <b>NULL</b>.
     * @param {Pointer<SIZE>} pszARVideo Receives the picture aspect ratio of the video. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALIDREQUEST</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media item does not contain video.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getnativevideosize
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(25, this, "ptr", pszVideo, "ptr", pszARVideo, "HRESULT")
        return result
    }

    /**
     * Gets the range of video sizes that can be displayed without significantly degrading performance or image quality.
     * @remarks
     * At least one parameter must be non-<b>NULL</b>. Sizes are given in pixels.
     * @param {Pointer<SIZE>} pszMin Receives the minimum size that is preferable. This parameter can be <b>NULL</b>.
     * @param {Pointer<SIZE>} pszMax Receives the maximum size that is preferable. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALIDREQUEST</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media item does not contain video.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getidealvideosize
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(26, this, "ptr", pszMin, "ptr", pszMax, "HRESULT")
        return result
    }

    /**
     * Sets the video source rectangle.
     * @remarks
     * MFPlay stretches the source rectangle to fill the entire video window. By default, MFPlay maintains the source's correct aspect ratio, letterboxing if needed. The letterbox color is controlled by the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setbordercolor">IMFPMediaPlayer::SetBorderColor</a> method.
     * 
     * This method fails if no media item is currently set, or if the current media item does not contain video.
     * 
     * To set the video position before playback starts, call this method inside your event handler for the <b>MFP_EVENT_TYPE_MEDIAITEM_SET</b> event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>.
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle. This rectangle defines which portion of the video is displayed. It is specified in normalized coordinates, which are defined as follows:
     * 
     * <ul>
     * <li>The upper-left corner of the video image is (0, 0).</li>
     * <li>The lower-right corner of  the video image is (1, 1).</li>
     * </ul>
     * To display the entire image, set the source rectangle to {0, 0, 1, 1}. This is the default value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media item does not contain video.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setvideosourcerect
     */
    SetVideoSourceRect(pnrcSource) {
        result := ComCall(27, this, "ptr", pnrcSource, "HRESULT")
        return result
    }

    /**
     * Gets the video source rectangle.
     * @returns {MFVideoNormalizedRect} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle. This rectangle defines which portion of the video is displayed. It is specified in normalized coordinates, which are defined as follows:
     * 
     * <ul>
     * <li>The upper-left corner of the video image is (0, 0).</li>
     * <li>The lower-right corner of  the video image is (1, 1).</li>
     * </ul>
     * If the source rectangle is {0, 0, 1, 1}, the entire image is displayed. This is the default value.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getvideosourcerect
     */
    GetVideoSourceRect() {
        pnrcSource := MFVideoNormalizedRect()
        result := ComCall(28, this, "ptr", pnrcSource, "HRESULT")
        return pnrcSource
    }

    /**
     * Specifies whether the aspect ratio of the video is preserved during playback.
     * @remarks
     * This method fails if no media item is currently set, or if the current media item does not contain video.
     * 
     * To set the aspect-ratio mode before playback starts, call this method inside your event handler for the <b>MFP_EVENT_TYPE_MEDIAITEM_SET</b> event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>.
     * @param {Integer} dwAspectRatioMode Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideoaspectratiomode">MFVideoAspectRatioMode</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALIDREQUEST</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media item does not contain video.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setaspectratiomode
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(29, this, "uint", dwAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * Gets the current aspect-ratio correction mode. This mode controls whether the aspect ratio of the video is preserved during playback.
     * @returns {Integer} Receives a bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideoaspectratiomode">MFVideoAspectRatioMode</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(30, this, "uint*", &pdwAspectRatioMode := 0, "HRESULT")
        return pdwAspectRatioMode
    }

    /**
     * Gets the window where the video is displayed.
     * @remarks
     * The video window is specified when you first call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-mfpcreatemediaplayer">MFPCreateMediaPlayer</a> to create the MFPlay player object.
     * @returns {HWND} Receives a handle to the application window where the video is displayed.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getvideowindow
     */
    GetVideoWindow() {
        phwndVideo := HWND()
        result := ComCall(31, this, "ptr", phwndVideo, "HRESULT")
        return phwndVideo
    }

    /**
     * Updates the video frame. (IMFPMediaPlayer.UpdateVideo)
     * @remarks
     * Call this method when your application's video playback window receives either a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> or <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-size">WM_SIZE</a> message. This method performs two functions:
     *         
     *         
     * 
     * <ul>
     * <li>Ensures that the video frame is repainted while playback is paused or stopped.  </li>
     * <li>Adjusts the displayed video to match the current size of the video window.</li>
     * </ul>
     * <div class="alert"><b>Important</b>  Call the GDI <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-beginpaint">BeginPaint</a> function before calling  <b>UpdateVideo</b>.</div>
     * <div> </div>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALIDREQUEST</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media item does not contain video.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-updatevideo
     */
    UpdateVideo() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * Sets the color for the video border.
     * @remarks
     * This method fails if no media item is currently set, or if the current media item does not contain video.
     * 
     * To set the border color before playback starts, call this method inside your event handler for the <b>MFP_EVENT_TYPE_MEDIAITEM_SET</b> event. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayercallback-onmediaplayerevent">IMFPMediaPlayerCallback::OnMediaPlayerEvent</a>.
     * @param {COLORREF} Clr Specifies the border color as a <b>COLORREF</b> value. Use the <b>RGB</b> macro to create this value. The default value is black.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current media item does not contain video.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(33, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * Gets the current color of the video border.
     * @returns {COLORREF} Receives the border color as a <b>COLORREF</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(34, this, "uint*", &pClr := 0, "HRESULT")
        return pClr
    }

    /**
     * Applies an audio or video effect to playback.
     * @remarks
     * The object specified in the <i>pEffect</i> parameter can implement either a video effect or an audio effect. The effect is applied to any media items set after the method is called. It is not applied to the current media item. 
     * 
     * For each media item, the effect is applied to the first selected stream of the matching type (audio or video). If a media item has two selected streams of the same type, the second stream does not receive the effect. The effect is ignored if the media item does not contain a stream that matches the effect type. For example, if you set a video effect and play a file that contains just audio, the video effect is ignored, although no error is raised.
     * 
     * The effect is applied to all subsequent media items, until the application removes the effect. To remove an effect, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-removeeffect">IMFPMediaPlayer::RemoveEffect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-removealleffects">IMFPMediaPlayer::RemoveAllEffects</a>.
     * 
     * If you set multiple effects of the same type (audio or video), they are applied in the same order in which you call <b>InsertEffect</b>.
     * 
     * <h3><a id="Remote_Playback_Optimizations"></a><a id="remote_playback_optimizations"></a><a id="REMOTE_PLAYBACK_OPTIMIZATIONS"></a>Remote Playback Optimizations</h3>
     * Audio and video effects might be incompatible with optimizations that are used for remote playback. The following remarks apply only to audio or video effects that are actually used during playback:
     * 
     * <ul>
     * <li>If you mark an audio or video effect as required, by setting <i>fOptional</i> to <b>FALSE</b>, MFPlay disables remote playback optimizations.</li>
     * <li>Otherwise, if all audio/video effects are marked as optional, MFPlay  might drop the effects, in order to enable remote playback optimizations.</li>
     * </ul>
     * In other words, required effects have priority over remote optimizations, but optional effects do not.
     * 
     * Remote optimizations might be disabled for other reasons. For example, they are disabled if you set the <b>MFP_OPTION_NO_REMOTE_DESKTOP_OPTIMIZATION</b> option when you create the player object. In that case, MFPlay will attempt to insert any optional effects. 
     * 
     * Non-audio, non-video effects do not affect remote optimizations. Also, if you insert a required effect but the source does not contain any streams of that type, remote optimizations are not disabled.
     * @param {IUnknown} pEffect Pointer to the <b>IUnknown</b> interface for one of the following: 
     * 
     * <ul>
     * <li>A Media Foundation transform (MFT) that implements the effect. MFTs expose the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.</li>
     * <li>An activation object that creates an MFT. Activation objects expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface.</li>
     * </ul>
     * @param {BOOL} fOptional Specifies whether the effect is optional.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The effect is optional. If the MFPlay player object cannot add the effect, it ignores the effect and  continues playback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the MFPlay player object cannot add the effect, a playback error occurs.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>S_OK</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALIDINDEX</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This effect was already added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-inserteffect
     */
    InsertEffect(pEffect, fOptional) {
        result := ComCall(35, this, "ptr", pEffect, "int", fOptional, "HRESULT")
        return result
    }

    /**
     * Removes an effect that was added with the IMFPMediaPlayer::InsertEffect method.
     * @remarks
     * The change applies to the next media item that is set on the player. The effect is not removed from the current media item.
     * @param {IUnknown} pEffect Pointer to the <b>IUnknown</b> interface of the effect object. Use the same pointer that you passed to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-inserteffect">InsertEffect</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The effect was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-removeeffect
     */
    RemoveEffect(pEffect) {
        result := ComCall(36, this, "ptr", pEffect, "HRESULT")
        return result
    }

    /**
     * Removes all effects that were added with the IMFPMediaPlayer::InsertEffect method.
     * @remarks
     * The change applies to the next media item that is set on the player. The effects are not removed from the current media item.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-removealleffects
     */
    RemoveAllEffects() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * Shuts down the MFPlay player object and releases any resources the object is using.
     * @remarks
     * After this method is called, most <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> methods return <b>MF_E_SHUTDOWN</b>. Also, any media items created from this instance of the player object are invalidated and most <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> methods also return <b>MF_E_SHUTDOWN</b>.
     * 
     * The player object automatically shuts itself down when its reference count reaches zero. You can use the <b>Shutdown</b> method to shut down the player before all of the references have been released.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown
     */
    Shutdown() {
        result := ComCall(38, this, "HRESULT")
        return result
    }
}

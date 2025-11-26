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
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/nn-mfplay-imfpmediaplayer
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
     * Starts playback.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-play
     */
    Play() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Pauses playback.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-pause
     */
    Pause() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Stops playback.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Steps forward one video frame.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-framestep
     */
    FrameStep() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Sets the playback position.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setposition
     */
    SetPosition(guidPositionType, pvPositionValue) {
        result := ComCall(7, this, "ptr", guidPositionType, "ptr", pvPositionValue, "HRESULT")
        return result
    }

    /**
     * Gets the current playback position.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getposition
     */
    GetPosition(guidPositionType) {
        pvPositionValue := PROPVARIANT()
        result := ComCall(8, this, "ptr", guidPositionType, "ptr", pvPositionValue, "HRESULT")
        return pvPositionValue
    }

    /**
     * Gets the playback duration of the current media item.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getduration
     */
    GetDuration(guidPositionType) {
        pvDurationValue := PROPVARIANT()
        result := ComCall(9, this, "ptr", guidPositionType, "ptr", pvDurationValue, "HRESULT")
        return pvDurationValue
    }

    /**
     * Sets the playback rate.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setrate
     */
    SetRate(flRate) {
        result := ComCall(10, this, "float", flRate, "HRESULT")
        return result
    }

    /**
     * Gets the current playback rate.
     * @returns {Float} Receives the playback rate. The playback rate is expressed as a ratio of the current rate to the normal rate. For example, 1.0 indicates normal playback, 0.5 indicates half speed, and 2.0 indicates twice speed. Positive values indicate forward playback, and negative values indicate reverse playback.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getrate
     */
    GetRate() {
        result := ComCall(11, this, "float*", &pflRate := 0, "HRESULT")
        return pflRate
    }

    /**
     * Gets the range of supported playback rates.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getsupportedrates
     */
    GetSupportedRates(fForwardDirection, pflSlowestRate, pflFastestRate) {
        pflSlowestRateMarshal := pflSlowestRate is VarRef ? "float*" : "ptr"
        pflFastestRateMarshal := pflFastestRate is VarRef ? "float*" : "ptr"

        result := ComCall(12, this, "int", fForwardDirection, pflSlowestRateMarshal, pflSlowestRate, pflFastestRateMarshal, pflFastestRate, "HRESULT")
        return result
    }

    /**
     * Gets the current playback state of the MFPlay player object.
     * @returns {Integer} Receives the playback state, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/ne-mfplay-mfp_mediaplayer_state">MFP_MEDIAPLAYER_STATE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getstate
     */
    GetState() {
        result := ComCall(13, this, "int*", &peState := 0, "HRESULT")
        return peState
    }

    /**
     * Creates a media item from a URL.
     * @param {PWSTR} pwszURL Null-terminated string that contains the URL of a media file.
     * @param {BOOL} fSync If <b>TRUE</b>, the method blocks until it completes. If <b>FALSE</b>, the method does not block and completes asynchronously.
     * @param {Pointer} dwUserData Application-defined value to store in the media item. To retrieve this value from the media item, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getuserdata">IMFPMediaItem::GetUserData</a>.
     * @returns {IMFPMediaItem} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface. The caller must release the interface. If <i>fSync</i> is <b>TRUE</b>, this parameter must be a valid pointer. If <i>bSync</i> is <b>FALSE</b>, this parameter must be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl
     */
    CreateMediaItemFromURL(pwszURL, fSync, dwUserData) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(14, this, "ptr", pwszURL, "int", fSync, "ptr", dwUserData, "ptr*", &ppMediaItem := 0, "HRESULT")
        return IMFPMediaItem(ppMediaItem)
    }

    /**
     * Creates a media item from an object.
     * @param {IUnknown} pIUnknownObj A pointer to the object's <b>IUnknown</b> interface. See Remarks.
     * @param {BOOL} fSync If <b>TRUE</b>, the method blocks until it completes. If <b>FALSE</b>, the method does not block and completes asynchronously.
     * @param {Pointer} dwUserData Application-defined value to store in the media item. To retrieve this value from the media item, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getuserdata">IMFPMediaItem::GetUserData</a>.
     * @returns {IMFPMediaItem} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface. The caller must release the interface. If <i>fSync</i> is <b>TRUE</b>, this parameter must be a valid pointer. If <i>bSync</i> is <b>FALSE</b>, this parameter must be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject
     */
    CreateMediaItemFromObject(pIUnknownObj, fSync, dwUserData) {
        result := ComCall(15, this, "ptr", pIUnknownObj, "int", fSync, "ptr", dwUserData, "ptr*", &ppMediaItem := 0, "HRESULT")
        return IMFPMediaItem(ppMediaItem)
    }

    /**
     * Queues a media item for playback.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setmediaitem
     */
    SetMediaItem(pIMFPMediaItem) {
        result := ComCall(16, this, "ptr", pIMFPMediaItem, "HRESULT")
        return result
    }

    /**
     * Clears the current media item.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-clearmediaitem
     */
    ClearMediaItem() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the current media item.
     * @returns {IMFPMediaItem} Receives a pointer to the media item's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaitem">IMFPMediaItem</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getmediaitem
     */
    GetMediaItem() {
        result := ComCall(18, this, "ptr*", &ppIMFPMediaItem := 0, "HRESULT")
        return IMFPMediaItem(ppIMFPMediaItem)
    }

    /**
     * Gets the current audio volume.
     * @returns {Float} Receives the audio volume. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getvolume
     */
    GetVolume() {
        result := ComCall(19, this, "float*", &pflVolume := 0, "HRESULT")
        return pflVolume
    }

    /**
     * Sets the audio volume.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setvolume
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getbalance
     */
    GetBalance() {
        result := ComCall(21, this, "float*", &pflBalance := 0, "HRESULT")
        return pflBalance
    }

    /**
     * Sets the audio balance.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setbalance
     */
    SetBalance(flBalance) {
        result := ComCall(22, this, "float", flBalance, "HRESULT")
        return result
    }

    /**
     * Queries whether the audio is muted.
     * @returns {BOOL} Receives the value <b>TRUE</b> if the audio is muted, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getmute
     */
    GetMute() {
        result := ComCall(23, this, "int*", &pfMute := 0, "HRESULT")
        return pfMute
    }

    /**
     * Mutes or unmutes the audio.
     * @param {BOOL} fMute Specify <b>TRUE</b> to mute the audio, or <b>FALSE</b> to unmute the audio.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setmute
     */
    SetMute(fMute) {
        result := ComCall(24, this, "int", fMute, "HRESULT")
        return result
    }

    /**
     * Gets the size and aspect ratio of the video.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getnativevideosize
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(25, this, "ptr", pszVideo, "ptr", pszARVideo, "HRESULT")
        return result
    }

    /**
     * Gets the range of video sizes that can be displayed without significantly degrading performance or image quality.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getidealvideosize
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(26, this, "ptr", pszMin, "ptr", pszMax, "HRESULT")
        return result
    }

    /**
     * Sets the video source rectangle.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setvideosourcerect
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getvideosourcerect
     */
    GetVideoSourceRect() {
        pnrcSource := MFVideoNormalizedRect()
        result := ComCall(28, this, "ptr", pnrcSource, "HRESULT")
        return pnrcSource
    }

    /**
     * Specifies whether the aspect ratio of the video is preserved during playback.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setaspectratiomode
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(29, this, "uint", dwAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * Gets the current aspect-ratio correction mode. This mode controls whether the aspect ratio of the video is preserved during playback.
     * @returns {Integer} Receives a bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvideoaspectratiomode">MFVideoAspectRatioMode</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(30, this, "uint*", &pdwAspectRatioMode := 0, "HRESULT")
        return pdwAspectRatioMode
    }

    /**
     * Gets the window where the video is displayed.
     * @returns {HWND} Receives a handle to the application window where the video is displayed.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getvideowindow
     */
    GetVideoWindow() {
        phwndVideo := HWND()
        result := ComCall(31, this, "ptr", phwndVideo, "HRESULT")
        return phwndVideo
    }

    /**
     * Updates the video frame.
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
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-updatevideo
     */
    UpdateVideo() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * Sets the color for the video border.
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
     * <dt><b>M<b>F_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object's <a href="/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown">Shutdown</a> method was called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(33, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * Gets the current color of the video border.
     * @returns {COLORREF} Receives the border color as a <b>COLORREF</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-getbordercolor
     */
    GetBorderColor() {
        result := ComCall(34, this, "uint*", &pClr := 0, "HRESULT")
        return pClr
    }

    /**
     * Applies an audio or video effect to playback.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-inserteffect
     */
    InsertEffect(pEffect, fOptional) {
        result := ComCall(35, this, "ptr", pEffect, "int", fOptional, "HRESULT")
        return result
    }

    /**
     * Removes an effect that was added with the IMFPMediaPlayer::InsertEffect method.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-removeeffect
     */
    RemoveEffect(pEffect) {
        result := ComCall(36, this, "ptr", pEffect, "HRESULT")
        return result
    }

    /**
     * Removes all effects that were added with the IMFPMediaPlayer::InsertEffect method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-removealleffects
     */
    RemoveAllEffects() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * Shuts down the MFPlay player object and releases any resources the object is using.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaplayer-shutdown
     */
    Shutdown() {
        result := ComCall(38, this, "HRESULT")
        return result
    }
}

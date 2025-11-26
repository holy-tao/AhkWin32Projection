#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\IMFMediaEngine.ahk

/**
 * Extends the IMFMediaEngine interface.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengine">IMFMediaEngine</a> interface contains methods that map to the HTML5 media elements. The <b>IMFMediaEngineEx</b> provides additional functionality that does not correspond directly to HTML5.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineEx extends IMFMediaEngine{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineEx
     * @type {Guid}
     */
    static IID => Guid("{83015ead-b1e6-40d0-a98a-37145ffe1ad1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSourceFromByteStream", "GetStatistics", "UpdateVideoStream", "GetBalance", "SetBalance", "IsPlaybackRateSupported", "FrameStep", "GetResourceCharacteristics", "GetPresentationAttribute", "GetNumberOfStreams", "GetStreamAttribute", "GetStreamSelection", "SetStreamSelection", "ApplyStreamSelections", "IsProtected", "InsertVideoEffect", "InsertAudioEffect", "RemoveAllEffects", "SetTimelineMarkerTimer", "GetTimelineMarkerTimer", "CancelTimelineMarkerTimer", "IsStereo3D", "GetStereo3DFramePackingMode", "SetStereo3DFramePackingMode", "GetStereo3DRenderMode", "SetStereo3DRenderMode", "EnableWindowlessSwapchainMode", "GetVideoSwapchainHandle", "EnableHorizontalMirrorMode", "GetAudioStreamCategory", "SetAudioStreamCategory", "GetAudioEndpointRole", "SetAudioEndpointRole", "GetRealTimeMode", "SetRealTimeMode", "SetCurrentTimeEx", "EnableTimeUpdateTimer"]

    /**
     * Opens a media resource from a byte stream.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream.
     * @param {BSTR} pURL The URL of the byte stream.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setsourcefrombytestream
     */
    SetSourceFromByteStream(pByteStream, pURL) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL

        result := ComCall(45, this, "ptr", pByteStream, "ptr", pURL, "HRESULT")
        return result
    }

    /**
     * Gets a playback statistic from the Media Engine.
     * @param {Integer} StatisticID A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_statistic">MF_MEDIA_ENGINE_STATISTIC</a> enumeration that identifies the statistic to get.
     * @returns {PROPVARIANT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> that receives the statistic. The data type and meaning of this value depends on the value of <i>StatisticID</i>. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstatistics
     */
    GetStatistics(StatisticID) {
        pStatistic := PROPVARIANT()
        result := ComCall(46, this, "int", StatisticID, "ptr", pStatistic, "HRESULT")
        return pStatistic
    }

    /**
     * Updates the source rectangle, destination rectangle, and border color for the video.
     * @param {Pointer<MFVideoNormalizedRect>} pSrc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle. The source rectangle defines the area of the video frame that is displayed. If this parameter is <b>NULL</b>, the entire video frame is displayed.
     * @param {Pointer<RECT>} pDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle. The destination rectangle defines the area of the window or DirectComposition visual where the video is drawn.
     * @param {Pointer<MFARGB>} pBorderClr A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-updatevideostream
     */
    UpdateVideoStream(pSrc, pDst, pBorderClr) {
        result := ComCall(47, this, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "HRESULT")
        return result
    }

    /**
     * Gets the audio balance.
     * @returns {Float} Returns the balance. The value can be any number in the following range (inclusive).
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The left channel is at full volume; the right channel is silent.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The right channel is at full volume; the left channel is silent.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the value is zero, the left and right channels are at equal volumes. The default value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getbalance
     */
    GetBalance() {
        result := ComCall(48, this, "double")
        return result
    }

    /**
     * Sets the audio balance.
     * @param {Float} balance The audio balance. The value can be any number in the following range (inclusive).
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The left channel is at full volume; the right channel is silent.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The right channel is at full volume; the left channel is silent.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the value is zero, the left and right channels are at equal volumes. The default value is zero.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setbalance
     */
    SetBalance(balance) {
        result := ComCall(49, this, "double", balance, "HRESULT")
        return result
    }

    /**
     * Queries whether the Media Engine can play at a specified playback rate.
     * @param {Float} rate The requested playback rate.
     * @returns {BOOL} Returns <b>TRUE</b> if the playback rate is supported, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-isplaybackratesupported
     */
    IsPlaybackRateSupported(rate) {
        result := ComCall(50, this, "double", rate, "int")
        return result
    }

    /**
     * Steps forward or backward one frame.
     * @param {BOOL} Forward Specify <b>TRUE</b> to step forward or <b>FALSE</b> to step backward.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-framestep
     */
    FrameStep(Forward) {
        result := ComCall(51, this, "int", Forward, "HRESULT")
        return result
    }

    /**
     * Gets various flags that describe the media resource.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfmediasource_characteristics">MFMEDIASOURCE_CHARACTERISTICS enumeration</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getresourcecharacteristics
     */
    GetResourceCharacteristics() {
        result := ComCall(52, this, "uint*", &pCharacteristics := 0, "HRESULT")
        return pCharacteristics
    }

    /**
     * Gets a presentation attribute from the media resource.
     * @param {Pointer<Guid>} guidMFAttribute The attribute to query.
     * 
     * For a list of presentation attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/presentation-descriptor-attributes">Presentation Descriptor Attributes</a>.
     * @returns {PROPVARIANT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> that receives the value. The method fills the <b>PROPVARIANT</b> with a copy of the stored value. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getpresentationattribute
     */
    GetPresentationAttribute(guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(53, this, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Gets the number of streams in the media resource.
     * @returns {Integer} Receives the number of streams.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(54, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * Gets a stream-level attribute from the media resource.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getnumberofstreams">IMFMediaEngineEx::GetNumberOfStreams</a>.
     * @param {Pointer<Guid>} guidMFAttribute The attribute to query. Possible values are listed in the following topics:
     * 
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/stream-descriptor-attributes">Stream Descriptor Attributes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-attributes">Media Type Attributes</a>
     * </li>
     * </ul>
     * @returns {PROPVARIANT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> that receives the value. The method fills the <b>PROPVARIANT</b> with a copy of the stored value. Call <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a> to free the memory allocated by the method.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstreamattribute
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(55, this, "uint", dwStreamIndex, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Queries whether a stream is selected to play.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getnumberofstreams">IMFMediaEngineEx::GetNumberOfStreams</a>.
     * @returns {BOOL} Receives a Boolean value.
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
     * The stream is selected. During playback, this stream will play.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is not selected. During playback, this stream will not play.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(56, this, "uint", dwStreamIndex, "int*", &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * Selects or deselects a stream for playback.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getnumberofstreams">IMFMediaEngineEx::GetNumberOfStreams</a>.
     * @param {BOOL} Enabled Specifies whether to select or deselect the stream.
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
     * The stream is selected. During playback, this stream will play.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is not selected. During playback, this stream will not play.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, Enabled) {
        result := ComCall(57, this, "uint", dwStreamIndex, "int", Enabled, "HRESULT")
        return result
    }

    /**
     * Applies the stream selections from previous calls to SetStreamSelection.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-applystreamselections
     */
    ApplyStreamSelections() {
        result := ComCall(58, this, "HRESULT")
        return result
    }

    /**
     * Queries whether the media resource contains protected content.
     * @returns {BOOL} Receives the value <b>TRUE</b> if the media resource contains protected content, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-isprotected
     */
    IsProtected() {
        result := ComCall(59, this, "int*", &pProtected := 0, "HRESULT")
        return pProtected
    }

    /**
     * Inserts a video effect.
     * @param {IUnknown} pEffect One of the following: 
     * 
     * <ul>
     * <li>A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface of a Media Foundation transform (MFT) that implements the video effect.</li>
     * <li>A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation object. The activation object must create an MFT for the video effect.</li>
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
     * The effect is optional. If the Media Engine cannot add the effect, it ignores the effect and  continues playback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The effect is required. If the Media Engine object cannot add the effect, a playback error occurs.
     * 
     * </td>
     * </tr>
     * </table>
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * The maximum number of video effects was reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertvideoeffect
     */
    InsertVideoEffect(pEffect, fOptional) {
        result := ComCall(60, this, "ptr", pEffect, "int", fOptional, "HRESULT")
        return result
    }

    /**
     * Inserts an audio effect.
     * @param {IUnknown} pEffect One of the following: 
     * 
     * <ul>
     * <li>A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface of a Media Foundation transform (MFT) that implements the audio effect.</li>
     * <li>A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface of an activation object. The activation object must create an MFT for the audio effect.</li>
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
     * The effect is optional. If the Media Engine cannot add the effect, it ignores the effect and  continues playback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The effect is required. If the Media Engine object cannot add the effect, a playback error occurs.
     * 
     * </td>
     * </tr>
     * </table>
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
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
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
     * The maximum number of audio effects was reached.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertaudioeffect
     */
    InsertAudioEffect(pEffect, fOptional) {
        result := ComCall(61, this, "ptr", pEffect, "int", fOptional, "HRESULT")
        return result
    }

    /**
     * Removes all audio and video effects.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-removealleffects
     */
    RemoveAllEffects() {
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * Specifies a presentation time when the Media Engine will send a marker event.
     * @param {Float} timeToFire The presentation time for the marker event, in seconds.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-settimelinemarkertimer
     */
    SetTimelineMarkerTimer(timeToFire) {
        result := ComCall(63, this, "double", timeToFire, "HRESULT")
        return result
    }

    /**
     * Gets the time of the next timeline marker, if any.
     * @returns {Float} Receives the marker time, in seconds. If no marker is set, this parameter receives the value <b>NaN</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-gettimelinemarkertimer
     */
    GetTimelineMarkerTimer() {
        result := ComCall(64, this, "double*", &pTimeToFire := 0, "HRESULT")
        return pTimeToFire
    }

    /**
     * Cancels the next pending timeline marker.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-canceltimelinemarkertimer
     */
    CancelTimelineMarkerTimer() {
        result := ComCall(65, this, "HRESULT")
        return result
    }

    /**
     * Queries whether the media resource contains stereoscopic 3D video.
     * @returns {BOOL} Returns <b>TRUE</b> if the media resource contains 3D video, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-isstereo3d
     */
    IsStereo3D() {
        result := ComCall(66, this, "int")
        return result
    }

    /**
     * For stereoscopic 3D video, gets the layout of the two views within a video frame.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_s3d_packing_mode">MF_MEDIA_ENGINE_S3D_PACKING_MODE</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstereo3dframepackingmode
     */
    GetStereo3DFramePackingMode() {
        result := ComCall(67, this, "int*", &packMode := 0, "HRESULT")
        return packMode
    }

    /**
     * For stereoscopic 3D video, sets the layout of the two views within a video frame.
     * @param {Integer} packMode A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_s3d_packing_mode">MF_MEDIA_ENGINE_S3D_PACKING_MODE</a> enumeration that specifies the layout. The two views can be arranged side-by-side, or top-to-bottom.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstereo3dframepackingmode
     */
    SetStereo3DFramePackingMode(packMode) {
        result := ComCall(68, this, "int", packMode, "HRESULT")
        return result
    }

    /**
     * For stereoscopic 3D video, queries how the Media Engine renders the 3D video content.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mf3dvideooutputtype">MF3DVideoOutputType</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstereo3drendermode
     */
    GetStereo3DRenderMode() {
        result := ComCall(69, this, "int*", &outputType := 0, "HRESULT")
        return outputType
    }

    /**
     * For stereoscopic 3D video, specifies how the Media Engine renders the 3D video content.
     * @param {Integer} outputType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mf3dvideooutputtype">MF3DVideoOutputType</a> enumeration that specifies the 3D video rendering mode.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstereo3drendermode
     */
    SetStereo3DRenderMode(outputType) {
        result := ComCall(70, this, "int", outputType, "HRESULT")
        return result
    }

    /**
     * Enables or disables windowless swap-chain mode.
     * @param {BOOL} fEnable If <b>TRUE</b>, windowless swap-chain mode is enabled.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-enablewindowlessswapchainmode
     */
    EnableWindowlessSwapchainMode(fEnable) {
        result := ComCall(71, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the windowless swap chain.
     * @returns {HANDLE} Receives a handle to the swap chain.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getvideoswapchainhandle
     */
    GetVideoSwapchainHandle() {
        phSwapchain := HANDLE()
        result := ComCall(72, this, "ptr", phSwapchain, "HRESULT")
        return phSwapchain
    }

    /**
     * Enables or disables mirroring of the video.
     * @param {BOOL} fEnable If <b>TRUE</b>, the video is mirrored horizontally. Otherwise, the video is displayed normally.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-enablehorizontalmirrormode
     */
    EnableHorizontalMirrorMode(fEnable) {
        result := ComCall(73, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Gets the audio stream category used for the next call to SetSource or Load.
     * @returns {Integer} Receives the audio stream category.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getaudiostreamcategory
     */
    GetAudioStreamCategory() {
        result := ComCall(74, this, "uint*", &pCategory := 0, "HRESULT")
        return pCategory
    }

    /**
     * Sets the audio stream category for the next call to SetSource or Load.
     * @param {Integer} category 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setaudiostreamcategory
     */
    SetAudioStreamCategory(category) {
        result := ComCall(75, this, "uint", category, "HRESULT")
        return result
    }

    /**
     * Gets the audio device endpoint role used for the next call to SetSource or Load.
     * @returns {Integer} Receives the audio endpoint role.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getaudioendpointrole
     */
    GetAudioEndpointRole() {
        result := ComCall(76, this, "uint*", &pRole := 0, "HRESULT")
        return pRole
    }

    /**
     * Sets the audio device endpoint used for the next call to SetSource or Load.
     * @param {Integer} role Specifies the audio end point role.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setaudioendpointrole
     */
    SetAudioEndpointRole(role) {
        result := ComCall(77, this, "uint", role, "HRESULT")
        return result
    }

    /**
     * Gets the real time mode used for the next call to SetSource or Load.
     * @returns {BOOL} Receives the real time mode.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-getrealtimemode
     */
    GetRealTimeMode() {
        result := ComCall(78, this, "int*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Sets the real time mode used for the next call to SetSource or Load.
     * @param {BOOL} fEnable Specifies the real time mode.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setrealtimemode
     */
    SetRealTimeMode(fEnable) {
        result := ComCall(79, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * Seeks to a new playback position using the specified MF_MEDIA_ENGINE_SEEK_MODE.
     * @param {Float} seekTime The new playback position, in seconds.
     * @param {Integer} seekMode Specifies if the seek is a normal seek or an approximate seek.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-setcurrenttimeex
     */
    SetCurrentTimeEx(seekTime, seekMode) {
        result := ComCall(80, this, "double", seekTime, "int", seekMode, "HRESULT")
        return result
    }

    /**
     * Enables or disables the time update timer.
     * @param {BOOL} fEnableTimer If <b>TRUE</b>, the update timer is enabled. Otherwise, the timer is disabled.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengineex-enabletimeupdatetimer
     */
    EnableTimeUpdateTimer(fEnableTimer) {
        result := ComCall(81, this, "int", fEnableTimer, "HRESULT")
        return result
    }
}

#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_MEDIA_ENGINE_SEEK_MODE.ahk" { MF_MEDIA_ENGINE_SEEK_MODE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_MEDIA_ENGINE_S3D_PACKING_MODE.ahk" { MF_MEDIA_ENGINE_S3D_PACKING_MODE }
#Import ".\MF_MEDIA_ENGINE_STATISTIC.ahk" { MF_MEDIA_ENGINE_STATISTIC }
#Import ".\MFARGB.ahk" { MFARGB }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MF3DVideoOutputType.ahk" { MF3DVideoOutputType }
#Import ".\MFVideoNormalizedRect.ahk" { MFVideoNormalizedRect }
#Import ".\IMFByteStream.ahk" { IMFByteStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\IMFMediaEngine.ahk" { IMFMediaEngine }

/**
 * Extends the IMFMediaEngine interface.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengine">IMFMediaEngine</a> interface contains methods that map to the HTML5 media elements. The <b>IMFMediaEngineEx</b> provides additional functionality that does not correspond directly to HTML5.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineEx extends IMFMediaEngine {
    /**
     * The interface identifier for IMFMediaEngineEx
     * @type {Guid}
     */
    static IID := Guid("{83015ead-b1e6-40d0-a98a-37145ffe1ad1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineEx interfaces
    */
    struct Vtbl extends IMFMediaEngine.Vtbl {
        SetSourceFromByteStream       : IntPtr
        GetStatistics                 : IntPtr
        UpdateVideoStream             : IntPtr
        GetBalance                    : IntPtr
        SetBalance                    : IntPtr
        IsPlaybackRateSupported       : IntPtr
        FrameStep                     : IntPtr
        GetResourceCharacteristics    : IntPtr
        GetPresentationAttribute      : IntPtr
        GetNumberOfStreams            : IntPtr
        GetStreamAttribute            : IntPtr
        GetStreamSelection            : IntPtr
        SetStreamSelection            : IntPtr
        ApplyStreamSelections         : IntPtr
        IsProtected                   : IntPtr
        InsertVideoEffect             : IntPtr
        InsertAudioEffect             : IntPtr
        RemoveAllEffects              : IntPtr
        SetTimelineMarkerTimer        : IntPtr
        GetTimelineMarkerTimer        : IntPtr
        CancelTimelineMarkerTimer     : IntPtr
        IsStereo3D                    : IntPtr
        GetStereo3DFramePackingMode   : IntPtr
        SetStereo3DFramePackingMode   : IntPtr
        GetStereo3DRenderMode         : IntPtr
        SetStereo3DRenderMode         : IntPtr
        EnableWindowlessSwapchainMode : IntPtr
        GetVideoSwapchainHandle       : IntPtr
        EnableHorizontalMirrorMode    : IntPtr
        GetAudioStreamCategory        : IntPtr
        SetAudioStreamCategory        : IntPtr
        GetAudioEndpointRole          : IntPtr
        SetAudioEndpointRole          : IntPtr
        GetRealTimeMode               : IntPtr
        SetRealTimeMode               : IntPtr
        SetCurrentTimeEx              : IntPtr
        EnableTimeUpdateTimer         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Opens a media resource from a byte stream.
     * @param {IMFByteStream} pByteStream A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfbytestream">IMFByteStream</a> interface of the byte stream.
     * @param {BSTR} pURL The URL of the byte stream.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setsourcefrombytestream
     */
    SetSourceFromByteStream(pByteStream, pURL) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL

        result := ComCall(45, this, "ptr", pByteStream, BSTR, pURL, "HRESULT")
        return result
    }

    /**
     * Gets a playback statistic from the Media Engine.
     * @param {MF_MEDIA_ENGINE_STATISTIC} StatisticID A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_statistic">MF_MEDIA_ENGINE_STATISTIC</a> enumeration that identifies the statistic to get.
     * @returns {PROPVARIANT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> that receives the statistic. The data type and meaning of this value depends on the value of <i>StatisticID</i>. The caller must free the <b>PROPVARIANT</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstatistics
     */
    GetStatistics(StatisticID) {
        pStatistic := PROPVARIANT()
        result := ComCall(46, this, MF_MEDIA_ENGINE_STATISTIC, StatisticID, PROPVARIANT.Ptr, pStatistic, "HRESULT")
        return pStatistic
    }

    /**
     * Updates the source rectangle, destination rectangle, and border color for the video.
     * @remarks
     * In rendering mode, call this method to reposition the video, update the border color, or repaint the video frame. If all of the parameters are <b>NULL</b>, the method repaints the most recent video frame.
     * 
     * In frame-server mode, this method has no effect.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> for info regarding source and destination rectangles in the <b>Video Processor MFT</b>.
     * @param {Pointer<MFVideoNormalizedRect>} pSrc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle. The source rectangle defines the area of the video frame that is displayed. If this parameter is <b>NULL</b>, the entire video frame is displayed.
     * @param {Pointer<RECT>} pDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle. The destination rectangle defines the area of the window or DirectComposition visual where the video is drawn.
     * @param {Pointer<MFARGB>} pBorderClr A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-updatevideostream
     */
    UpdateVideoStream(pSrc, pDst, pBorderClr) {
        result := ComCall(47, this, MFVideoNormalizedRect.Ptr, pSrc, RECT.Ptr, pDst, MFARGB.Ptr, pBorderClr, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getbalance
     */
    GetBalance() {
        result := ComCall(48, this, Float64)
        return result
    }

    /**
     * Sets the audio balance. (IMFMediaEngineEx.SetBalance)
     * @remarks
     * When the audio balance changes, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_BALANCECHANGE</b> event. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEventNotify::EventNotify</a>.
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setbalance
     */
    SetBalance(balance) {
        result := ComCall(49, this, "double", balance, "HRESULT")
        return result
    }

    /**
     * Queries whether the Media Engine can play at a specified playback rate.
     * @remarks
     * Playback rates are expressed as a ratio of the current rate to the normal rate. For example, 1.0 is normal playback speed, 0.5 is half speed, and 2.0 is 2× speed. Positive values mean forward playback, and negative values mean reverse playback.
     * 
     * The results of this method can vary depending on the media resource that is currently loaded. Some media formats might support faster playback rates than others. Also, some formats might not support reverse play.
     * @param {Float} rate The requested playback rate.
     * @returns {BOOL} Returns <b>TRUE</b> if the playback rate is supported, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-isplaybackratesupported
     */
    IsPlaybackRateSupported(rate) {
        result := ComCall(50, this, "double", rate, BOOL)
        return result
    }

    /**
     * Steps forward or backward one frame.
     * @remarks
     * The frame-step direction is independent of the current playback direction.
     * 
     * This method completes asynchronously. When the operation completes, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_FRAMESTEPCOMPLETED</b> event and enters the paused state.
     * @param {BOOL} Forward Specify <b>TRUE</b> to step forward or <b>FALSE</b> to step backward.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-framestep
     */
    FrameStep(Forward) {
        result := ComCall(51, this, BOOL, Forward, "HRESULT")
        return result
    }

    /**
     * Gets various flags that describe the media resource.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfmediasource_characteristics">MFMEDIASOURCE_CHARACTERISTICS enumeration</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getresourcecharacteristics
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getpresentationattribute
     */
    GetPresentationAttribute(guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(53, this, Guid.Ptr, guidMFAttribute, PROPVARIANT.Ptr, pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Gets the number of streams in the media resource.
     * @returns {Integer} Receives the number of streams.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getnumberofstreams
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstreamattribute
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(55, this, "uint", dwStreamIndex, Guid.Ptr, guidMFAttribute, PROPVARIANT.Ptr, pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Queries whether a stream is selected to play. (IMFMediaEngineEx.GetStreamSelection)
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(56, this, "uint", dwStreamIndex, BOOL.Ptr, &pEnabled := 0, "HRESULT")
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, Enabled) {
        result := ComCall(57, this, "uint", dwStreamIndex, BOOL, Enabled, "HRESULT")
        return result
    }

    /**
     * Applies the stream selections from previous calls to SetStreamSelection.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-applystreamselections
     */
    ApplyStreamSelections() {
        result := ComCall(58, this, "HRESULT")
        return result
    }

    /**
     * Queries whether the media resource contains protected content.
     * @returns {BOOL} Receives the value <b>TRUE</b> if the media resource contains protected content, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-isprotected
     */
    IsProtected() {
        result := ComCall(59, this, BOOL.Ptr, &pProtected := 0, "HRESULT")
        return pProtected
    }

    /**
     * Inserts a video effect.
     * @remarks
     * The effect is applied when the next media resource is loaded.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertvideoeffect
     */
    InsertVideoEffect(pEffect, fOptional) {
        result := ComCall(60, this, "ptr", pEffect, BOOL, fOptional, "HRESULT")
        return result
    }

    /**
     * Inserts an audio effect.
     * @remarks
     * The effect is applied when the next media resource is loaded.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertaudioeffect
     */
    InsertAudioEffect(pEffect, fOptional) {
        result := ComCall(61, this, "ptr", pEffect, BOOL, fOptional, "HRESULT")
        return result
    }

    /**
     * Removes all audio and video effects.
     * @remarks
     * Call this method to remove all of the effects that were added with the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertaudioeffect">InsertAudioEffect</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertvideoeffect">InsertVideoEffect</a> methods.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-removealleffects
     */
    RemoveAllEffects() {
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * Specifies a presentation time when the Media Engine will send a marker event.
     * @remarks
     * When playback reaches the time specified by <i>timeToFire</i>, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_TIMELINE_MARKER</b> event through the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEngineNotify::EventNotify</a> method. Calling this method cancels any previous marker that is still pending. 
     * 
     * If the application seeks past the marker point, the Media Engine cancels the marker and does not send the event.
     * 
     * During  forward playback, set <i>timeToFire</i> to a value greater than the current playback position. During reverse playback, set <i>timeToFire</i> to a value less than the playback position.
     * 
     * To cancel a marker, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-canceltimelinemarkertimer">IMFMediaEngineEx::CancelTimelineMarkerTimer</a>.
     * @param {Float} timeToFire The presentation time for the marker event, in seconds.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-settimelinemarkertimer
     */
    SetTimelineMarkerTimer(timeToFire) {
        result := ComCall(63, this, "double", timeToFire, "HRESULT")
        return result
    }

    /**
     * Gets the time of the next timeline marker, if any.
     * @returns {Float} Receives the marker time, in seconds. If no marker is set, this parameter receives the value <b>NaN</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-gettimelinemarkertimer
     */
    GetTimelineMarkerTimer() {
        result := ComCall(64, this, "double*", &pTimeToFire := 0, "HRESULT")
        return pTimeToFire
    }

    /**
     * Cancels the next pending timeline marker.
     * @remarks
     * Call this method to cancel the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-settimelinemarkertimer">IMFMediaEngineEx::SetTimelineMarkerTimer</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-canceltimelinemarkertimer
     */
    CancelTimelineMarkerTimer() {
        result := ComCall(65, this, "HRESULT")
        return result
    }

    /**
     * Queries whether the media resource contains stereoscopic 3D video.
     * @returns {BOOL} Returns <b>TRUE</b> if the media resource contains 3D video, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-isstereo3d
     */
    IsStereo3D() {
        result := ComCall(66, this, BOOL)
        return result
    }

    /**
     * For stereoscopic 3D video, gets the layout of the two views within a video frame.
     * @returns {MF_MEDIA_ENGINE_S3D_PACKING_MODE} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_s3d_packing_mode">MF_MEDIA_ENGINE_S3D_PACKING_MODE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstereo3dframepackingmode
     */
    GetStereo3DFramePackingMode() {
        result := ComCall(67, this, "int*", &packMode := 0, "HRESULT")
        return packMode
    }

    /**
     * For stereoscopic 3D video, sets the layout of the two views within a video frame.
     * @param {MF_MEDIA_ENGINE_S3D_PACKING_MODE} packMode A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_s3d_packing_mode">MF_MEDIA_ENGINE_S3D_PACKING_MODE</a> enumeration that specifies the layout. The two views can be arranged side-by-side, or top-to-bottom.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstereo3dframepackingmode
     */
    SetStereo3DFramePackingMode(packMode) {
        result := ComCall(68, this, MF_MEDIA_ENGINE_S3D_PACKING_MODE, packMode, "HRESULT")
        return result
    }

    /**
     * For stereoscopic 3D video, queries how the Media Engine renders the 3D video content.
     * @returns {MF3DVideoOutputType} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mf3dvideooutputtype">MF3DVideoOutputType</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstereo3drendermode
     */
    GetStereo3DRenderMode() {
        result := ComCall(69, this, "int*", &outputType := 0, "HRESULT")
        return outputType
    }

    /**
     * For stereoscopic 3D video, specifies how the Media Engine renders the 3D video content.
     * @param {MF3DVideoOutputType} outputType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/ne-mftransform-mf3dvideooutputtype">MF3DVideoOutputType</a> enumeration that specifies the 3D video rendering mode.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstereo3drendermode
     */
    SetStereo3DRenderMode(outputType) {
        result := ComCall(70, this, MF3DVideoOutputType, outputType, "HRESULT")
        return result
    }

    /**
     * Enables or disables windowless swap-chain mode.
     * @remarks
     * In windowless swap-chain mode, the Media Engine creates a windowless swap chain and presents video frames to the swap chain. To render the video, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getvideoswapchainhandle">IMFMediaEngineEx::GetVideoSwapchainHandle</a> to get a handle to the swap chain, and then associate the handle with a Microsoft DirectComposition visual.
     * @param {BOOL} fEnable If <b>TRUE</b>, windowless swap-chain mode is enabled.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-enablewindowlessswapchainmode
     */
    EnableWindowlessSwapchainMode(fEnable) {
        result := ComCall(71, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * Gets a handle to the windowless swap chain.
     * @remarks
     * To enable windowless swap-chain mode, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-enablewindowlessswapchainmode">IMFMediaEngineEx::EnableWindowlessSwapchainMode</a>.
     * @returns {HANDLE} Receives a handle to the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getvideoswapchainhandle
     */
    GetVideoSwapchainHandle() {
        phSwapchain := HANDLE.Owned()
        result := ComCall(72, this, HANDLE.Ptr, phSwapchain, "HRESULT")
        return phSwapchain
    }

    /**
     * Enables or disables mirroring of the video.
     * @param {BOOL} fEnable If <b>TRUE</b>, the video is mirrored horizontally. Otherwise, the video is displayed normally.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-enablehorizontalmirrormode
     */
    EnableHorizontalMirrorMode(fEnable) {
        result := ComCall(73, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * Gets the audio stream category used for the next call to SetSource or Load.
     * @remarks
     * For information on audio stream categories, see <a href="https://docs.microsoft.com/windows/desktop/api/audiosessiontypes/ne-audiosessiontypes-audio_stream_category">AUDIO_STREAM_CATEGORY enumeration</a>.
     * @returns {Integer} Receives the audio stream category.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getaudiostreamcategory
     */
    GetAudioStreamCategory() {
        result := ComCall(74, this, "uint*", &pCategory := 0, "HRESULT")
        return pCategory
    }

    /**
     * Sets the audio stream category for the next call to SetSource or Load.
     * @remarks
     * For information on audio stream categories, see <a href="https://docs.microsoft.com/windows/desktop/api/audiosessiontypes/ne-audiosessiontypes-audio_stream_category">AUDIO_STREAM_CATEGORY enumeration</a>.
     * @param {Integer} category 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setaudiostreamcategory
     */
    SetAudioStreamCategory(category) {
        result := ComCall(75, this, "uint", category, "HRESULT")
        return result
    }

    /**
     * Gets the audio device endpoint role used for the next call to SetSource or Load.
     * @remarks
     * For information on audio endpoint roles, see <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">ERole  enumeration</a>.
     * @returns {Integer} Receives the audio endpoint role.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getaudioendpointrole
     */
    GetAudioEndpointRole() {
        result := ComCall(76, this, "uint*", &pRole := 0, "HRESULT")
        return pRole
    }

    /**
     * Sets the audio device endpoint used for the next call to SetSource or Load.
     * @remarks
     * For information on audio endpoint roles, see <a href="https://docs.microsoft.com/windows/win32/api/mmdeviceapi/ne-mmdeviceapi-erole">ERole  enumeration</a>.
     * @param {Integer} role Specifies the audio end point role.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setaudioendpointrole
     */
    SetAudioEndpointRole(role) {
        result := ComCall(77, this, "uint", role, "HRESULT")
        return result
    }

    /**
     * Gets the real time mode used for the next call to SetSource or Load.
     * @returns {BOOL} Receives the real time mode.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getrealtimemode
     */
    GetRealTimeMode() {
        result := ComCall(78, this, BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Sets the real time mode used for the next call to SetSource or Load.
     * @param {BOOL} fEnable Specifies the real time mode.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setrealtimemode
     */
    SetRealTimeMode(fEnable) {
        result := ComCall(79, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * Seeks to a new playback position using the specified MF_MEDIA_ENGINE_SEEK_MODE.
     * @param {Float} seekTime The new playback position, in seconds.
     * @param {MF_MEDIA_ENGINE_SEEK_MODE} seekMode Specifies if the seek is a normal seek or an approximate seek.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setcurrenttimeex
     */
    SetCurrentTimeEx(seekTime, seekMode) {
        result := ComCall(80, this, "double", seekTime, MF_MEDIA_ENGINE_SEEK_MODE, seekMode, "HRESULT")
        return result
    }

    /**
     * Enables or disables the time update timer.
     * @param {BOOL} fEnableTimer If <b>TRUE</b>, the update timer is enabled. Otherwise, the timer is disabled.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-enabletimeupdatetimer
     */
    EnableTimeUpdateTimer(fEnableTimer) {
        result := ComCall(81, this, BOOL, fEnableTimer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSourceFromByteStream := CallbackCreate(GetMethod(implObj, "SetSourceFromByteStream"), flags, 3)
        this.vtbl.GetStatistics := CallbackCreate(GetMethod(implObj, "GetStatistics"), flags, 3)
        this.vtbl.UpdateVideoStream := CallbackCreate(GetMethod(implObj, "UpdateVideoStream"), flags, 4)
        this.vtbl.GetBalance := CallbackCreate(GetMethod(implObj, "GetBalance"), flags, 1)
        this.vtbl.SetBalance := CallbackCreate(GetMethod(implObj, "SetBalance"), flags, 2)
        this.vtbl.IsPlaybackRateSupported := CallbackCreate(GetMethod(implObj, "IsPlaybackRateSupported"), flags, 2)
        this.vtbl.FrameStep := CallbackCreate(GetMethod(implObj, "FrameStep"), flags, 2)
        this.vtbl.GetResourceCharacteristics := CallbackCreate(GetMethod(implObj, "GetResourceCharacteristics"), flags, 2)
        this.vtbl.GetPresentationAttribute := CallbackCreate(GetMethod(implObj, "GetPresentationAttribute"), flags, 3)
        this.vtbl.GetNumberOfStreams := CallbackCreate(GetMethod(implObj, "GetNumberOfStreams"), flags, 2)
        this.vtbl.GetStreamAttribute := CallbackCreate(GetMethod(implObj, "GetStreamAttribute"), flags, 4)
        this.vtbl.GetStreamSelection := CallbackCreate(GetMethod(implObj, "GetStreamSelection"), flags, 3)
        this.vtbl.SetStreamSelection := CallbackCreate(GetMethod(implObj, "SetStreamSelection"), flags, 3)
        this.vtbl.ApplyStreamSelections := CallbackCreate(GetMethod(implObj, "ApplyStreamSelections"), flags, 1)
        this.vtbl.IsProtected := CallbackCreate(GetMethod(implObj, "IsProtected"), flags, 2)
        this.vtbl.InsertVideoEffect := CallbackCreate(GetMethod(implObj, "InsertVideoEffect"), flags, 3)
        this.vtbl.InsertAudioEffect := CallbackCreate(GetMethod(implObj, "InsertAudioEffect"), flags, 3)
        this.vtbl.RemoveAllEffects := CallbackCreate(GetMethod(implObj, "RemoveAllEffects"), flags, 1)
        this.vtbl.SetTimelineMarkerTimer := CallbackCreate(GetMethod(implObj, "SetTimelineMarkerTimer"), flags, 2)
        this.vtbl.GetTimelineMarkerTimer := CallbackCreate(GetMethod(implObj, "GetTimelineMarkerTimer"), flags, 2)
        this.vtbl.CancelTimelineMarkerTimer := CallbackCreate(GetMethod(implObj, "CancelTimelineMarkerTimer"), flags, 1)
        this.vtbl.IsStereo3D := CallbackCreate(GetMethod(implObj, "IsStereo3D"), flags, 1)
        this.vtbl.GetStereo3DFramePackingMode := CallbackCreate(GetMethod(implObj, "GetStereo3DFramePackingMode"), flags, 2)
        this.vtbl.SetStereo3DFramePackingMode := CallbackCreate(GetMethod(implObj, "SetStereo3DFramePackingMode"), flags, 2)
        this.vtbl.GetStereo3DRenderMode := CallbackCreate(GetMethod(implObj, "GetStereo3DRenderMode"), flags, 2)
        this.vtbl.SetStereo3DRenderMode := CallbackCreate(GetMethod(implObj, "SetStereo3DRenderMode"), flags, 2)
        this.vtbl.EnableWindowlessSwapchainMode := CallbackCreate(GetMethod(implObj, "EnableWindowlessSwapchainMode"), flags, 2)
        this.vtbl.GetVideoSwapchainHandle := CallbackCreate(GetMethod(implObj, "GetVideoSwapchainHandle"), flags, 2)
        this.vtbl.EnableHorizontalMirrorMode := CallbackCreate(GetMethod(implObj, "EnableHorizontalMirrorMode"), flags, 2)
        this.vtbl.GetAudioStreamCategory := CallbackCreate(GetMethod(implObj, "GetAudioStreamCategory"), flags, 2)
        this.vtbl.SetAudioStreamCategory := CallbackCreate(GetMethod(implObj, "SetAudioStreamCategory"), flags, 2)
        this.vtbl.GetAudioEndpointRole := CallbackCreate(GetMethod(implObj, "GetAudioEndpointRole"), flags, 2)
        this.vtbl.SetAudioEndpointRole := CallbackCreate(GetMethod(implObj, "SetAudioEndpointRole"), flags, 2)
        this.vtbl.GetRealTimeMode := CallbackCreate(GetMethod(implObj, "GetRealTimeMode"), flags, 2)
        this.vtbl.SetRealTimeMode := CallbackCreate(GetMethod(implObj, "SetRealTimeMode"), flags, 2)
        this.vtbl.SetCurrentTimeEx := CallbackCreate(GetMethod(implObj, "SetCurrentTimeEx"), flags, 3)
        this.vtbl.EnableTimeUpdateTimer := CallbackCreate(GetMethod(implObj, "EnableTimeUpdateTimer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSourceFromByteStream)
        CallbackFree(this.vtbl.GetStatistics)
        CallbackFree(this.vtbl.UpdateVideoStream)
        CallbackFree(this.vtbl.GetBalance)
        CallbackFree(this.vtbl.SetBalance)
        CallbackFree(this.vtbl.IsPlaybackRateSupported)
        CallbackFree(this.vtbl.FrameStep)
        CallbackFree(this.vtbl.GetResourceCharacteristics)
        CallbackFree(this.vtbl.GetPresentationAttribute)
        CallbackFree(this.vtbl.GetNumberOfStreams)
        CallbackFree(this.vtbl.GetStreamAttribute)
        CallbackFree(this.vtbl.GetStreamSelection)
        CallbackFree(this.vtbl.SetStreamSelection)
        CallbackFree(this.vtbl.ApplyStreamSelections)
        CallbackFree(this.vtbl.IsProtected)
        CallbackFree(this.vtbl.InsertVideoEffect)
        CallbackFree(this.vtbl.InsertAudioEffect)
        CallbackFree(this.vtbl.RemoveAllEffects)
        CallbackFree(this.vtbl.SetTimelineMarkerTimer)
        CallbackFree(this.vtbl.GetTimelineMarkerTimer)
        CallbackFree(this.vtbl.CancelTimelineMarkerTimer)
        CallbackFree(this.vtbl.IsStereo3D)
        CallbackFree(this.vtbl.GetStereo3DFramePackingMode)
        CallbackFree(this.vtbl.SetStereo3DFramePackingMode)
        CallbackFree(this.vtbl.GetStereo3DRenderMode)
        CallbackFree(this.vtbl.SetStereo3DRenderMode)
        CallbackFree(this.vtbl.EnableWindowlessSwapchainMode)
        CallbackFree(this.vtbl.GetVideoSwapchainHandle)
        CallbackFree(this.vtbl.EnableHorizontalMirrorMode)
        CallbackFree(this.vtbl.GetAudioStreamCategory)
        CallbackFree(this.vtbl.SetAudioStreamCategory)
        CallbackFree(this.vtbl.GetAudioEndpointRole)
        CallbackFree(this.vtbl.SetAudioEndpointRole)
        CallbackFree(this.vtbl.GetRealTimeMode)
        CallbackFree(this.vtbl.SetRealTimeMode)
        CallbackFree(this.vtbl.SetCurrentTimeEx)
        CallbackFree(this.vtbl.EnableTimeUpdateTimer)
    }
}

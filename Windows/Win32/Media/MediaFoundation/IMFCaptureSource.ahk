#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_CAPTURE_ENGINE_DEVICE_TYPE.ahk" { MF_CAPTURE_ENGINE_DEVICE_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_CAPTURE_ENGINE_STREAM_CATEGORY.ahk" { MF_CAPTURE_ENGINE_STREAM_CATEGORY }
#Import ".\IMFActivate.ahk" { IMFActivate }
#Import ".\IMFMediaSource.ahk" { IMFMediaSource }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Controls the capture source object. The capture source manages the audio and video capture devices.
 * @remarks
 * To get a pointer to the capture source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsource">IMFCaptureEngine::GetSource</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcapturesource
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCaptureSource extends IUnknown {
    /**
     * The interface identifier for IMFCaptureSource
     * @type {Guid}
     */
    static IID := Guid("{439a42a8-0d2c-4505-be83-f79b2a05d5c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCaptureSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCaptureDeviceSource         : IntPtr
        GetCaptureDeviceActivate       : IntPtr
        GetService                     : IntPtr
        AddEffect                      : IntPtr
        RemoveEffect                   : IntPtr
        RemoveAllEffects               : IntPtr
        GetAvailableDeviceMediaType    : IntPtr
        SetCurrentDeviceMediaType      : IntPtr
        GetCurrentDeviceMediaType      : IntPtr
        GetDeviceStreamCount           : IntPtr
        GetDeviceStreamCategory        : IntPtr
        GetMirrorState                 : IntPtr
        SetMirrorState                 : IntPtr
        GetStreamIndexFromFriendlyName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCaptureSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the current capture device's IMFMediaSource object pointer.
     * @param {MF_CAPTURE_ENGINE_DEVICE_TYPE} mfCaptureEngineDeviceType The capture engine device type.
     * @returns {IMFMediaSource} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> that represent the device.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcapturedevicesource
     */
    GetCaptureDeviceSource(mfCaptureEngineDeviceType) {
        result := ComCall(3, this, MF_CAPTURE_ENGINE_DEVICE_TYPE, mfCaptureEngineDeviceType, "ptr*", &ppMediaSource := 0, "HRESULT")
        return IMFMediaSource(ppMediaSource)
    }

    /**
     * Gets the current capture device's IMFActivate object pointer.
     * @param {MF_CAPTURE_ENGINE_DEVICE_TYPE} mfCaptureEngineDeviceType The capture engine device type.
     * @returns {IMFActivate} Receives the pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> that represents a device.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcapturedeviceactivate
     */
    GetCaptureDeviceActivate(mfCaptureEngineDeviceType) {
        result := ComCall(4, this, MF_CAPTURE_ENGINE_DEVICE_TYPE, mfCaptureEngineDeviceType, "ptr*", &ppActivate := 0, "HRESULT")
        return IMFActivate(ppActivate)
    }

    /**
     * Gets a pointer to the underlying Source Reader object.
     * @param {Pointer<Guid>} rguidService A service identifier GUID. Currently the value must be <b>IID_IMFSourceReader</b> or <b>GUID_NULL</b>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested. The value must be <b>IID_IMFSourceReader</b>. If the value is not set to <b>IID_IMFSourceReader</b>, the call  will fail and return <b>E_INVALIDARG</b>.
     * @returns {IUnknown} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getservice
     */
    GetService(rguidService, riid) {
        result := ComCall(5, this, Guid.Ptr, rguidService, Guid.Ptr, riid, "ptr*", &ppUnknown := 0, "HRESULT")
        return IUnknown(ppUnknown)
    }

    /**
     * Adds an effect to a capture stream.
     * @remarks
     * The effect must be implemented as a <a href="https://docs.microsoft.com/windows/desktop/medfound/media-foundation-transforms">Media Foundation Transform</a> (MFT). The <i>pUnknown</i> parameter can point to an instance of the MFT, or to an activation object for the MFT. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/activation-objects">Activation Objects</a>.
     * 
     * The effect is applied to the stream before the data reaches the capture sinks.
     * @param {Integer} dwSourceStreamIndex The capture stream. The value can be any of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0–0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The zero-based index of a stream.  To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount">IMFCaptureSource::GetDeviceStreamCount</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM"></a><a id="mf_capture_engine_first_source_photo_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first image stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM"></a><a id="mf_capture_engine_first_source_video_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM"></a><a id="mf_capture_engine_first_source_audio_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IUnknown} pUnknown A pointer to one of the following:
     * 
     * 
     * 
     * <ul>
     * <li>A Media Foundation transform (MFT) that exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface.</li>
     * <li>An MFT activation object that exposes the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface.</li>
     * </ul>
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
     * <dt><b>MF_E_INVALIDMEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No compatible media type could be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSourceStreamIndex</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-addeffect
     */
    AddEffect(dwSourceStreamIndex, pUnknown) {
        result := ComCall(6, this, "uint", dwSourceStreamIndex, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * Removes an effect from a capture stream.
     * @remarks
     * This method removes an effect that was previously added using the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-addeffect">IMFCaptureSource::AddEffect</a> method.
     * @param {Integer} dwSourceStreamIndex The capture stream. The value can be any of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0–0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The zero-based index of a stream.  To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount">IMFCaptureSource::GetDeviceStreamCount</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM"></a><a id="mf_capture_engine_first_source_photo_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first image stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM"></a><a id="mf_capture_engine_first_source_video_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM"></a><a id="mf_capture_engine_first_source_audio_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IUnknown} pUnknown A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the effect object.
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
     * Invalid request. Possibly the specified effect could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSourceStreamIndex</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-removeeffect
     */
    RemoveEffect(dwSourceStreamIndex, pUnknown) {
        result := ComCall(7, this, "uint", dwSourceStreamIndex, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * Removes all effects from a capture stream.
     * @param {Integer} dwSourceStreamIndex The capture stream. The value can be any of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0–0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The zero-based index of a stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount">IMFCaptureSource::GetDeviceStreamCount</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM"></a><a id="mf_capture_engine_first_source_photo_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first image stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM"></a><a id="mf_capture_engine_first_source_video_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM"></a><a id="mf_capture_engine_first_source_audio_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
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
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSourceStreamIndex</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-removealleffects
     */
    RemoveAllEffects(dwSourceStreamIndex) {
        result := ComCall(8, this, "uint", dwSourceStreamIndex, "HRESULT")
        return result
    }

    /**
     * Gets a format that is supported by one of the capture streams.
     * @remarks
     * To enumerate all of the available formats on a stream, call this method in a loop while incrementing <i>dwMediaTypeIndex</i>, until the method returns <b>MF_E_NO_MORE_TYPES</b>.
     * 
     * Some cameras might support a range of frame rates. The minimum and maximum frame rates are stored in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-range-min">MF_MT_FRAME_RATE_RANGE_MIN</a> and <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-range-max">MF_MT_FRAME_RATE_RANGE_MAX</a> attributes on the media type.
     * @param {Integer} dwSourceStreamIndex The stream to query. The value can be any of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0–0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The zero-based index of a stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount">IMFCaptureSource::GetDeviceStreamCount</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM"></a><a id="mf_capture_engine_first_source_photo_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first image stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM"></a><a id="mf_capture_engine_first_source_video_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM"></a><a id="mf_capture_engine_first_source_audio_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwMediaTypeIndex The zero-based index of the media type to retrieve.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getavailabledevicemediatype
     */
    GetAvailableDeviceMediaType(dwSourceStreamIndex, dwMediaTypeIndex) {
        result := ComCall(9, this, "uint", dwSourceStreamIndex, "uint", dwMediaTypeIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Sets the output format for a capture stream.
     * @remarks
     * This method sets the native output type on the capture device. The device must support the specified format. To get the list of available formats, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getavailabledevicemediatype">IMFCaptureSource::GetAvailableDeviceMediaType</a>.
     * @param {Integer} dwSourceStreamIndex The capture stream to set. The value can be any of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0–0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The zero-based index of a stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount">IMFCaptureSource::GetDeviceStreamCount</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM"></a><a id="mf_capture_engine_first_source_photo_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first image stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM"></a><a id="mf_capture_engine_first_source_video_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM"></a><a id="mf_capture_engine_first_source_audio_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface.
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
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwSourceStreamIndex</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-setcurrentdevicemediatype
     */
    SetCurrentDeviceMediaType(dwSourceStreamIndex, pMediaType) {
        result := ComCall(10, this, "uint", dwSourceStreamIndex, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * Gets the current media type for a capture stream.
     * @param {Integer} dwSourceStreamIndex Specifies which stream to query. The value can be any of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0–0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The zero-based index of a stream.  To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount">IMFCaptureSource::GetDeviceStreamCount</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM"></a><a id="mf_capture_engine_first_source_photo_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first image stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM"></a><a id="mf_capture_engine_first_source_video_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM"></a><a id="mf_capture_engine_first_source_audio_stream"></a><dl>
     * <dt><b><b>MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getcurrentdevicemediatype
     */
    GetCurrentDeviceMediaType(dwSourceStreamIndex) {
        result := ComCall(11, this, "uint", dwSourceStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Gets the number of device streams.
     * @returns {Integer} Receives the number of device streams.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcount
     */
    GetDeviceStreamCount() {
        result := ComCall(12, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * Gets the stream category for the specified source stream index.
     * @param {Integer} dwSourceStreamIndex The index of the source stream.
     * @returns {MF_CAPTURE_ENGINE_STREAM_CATEGORY} Receives the MF_CAPTURE_ENGINE_STREAM_CATEGORY of the specified source stream.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getdevicestreamcategory
     */
    GetDeviceStreamCategory(dwSourceStreamIndex) {
        result := ComCall(13, this, "uint", dwSourceStreamIndex, "int*", &pStreamCategory := 0, "HRESULT")
        return pStreamCategory
    }

    /**
     * Gets the current mirroring state of the video preview stream. (IMFCaptureSource.GetMirrorState)
     * @param {Integer} dwStreamIndex The zero-based index of the stream.
     * @returns {BOOL} Receives the value <b>TRUE</b> if mirroring is enabled, or <b>FALSE</b> if mirroring is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getmirrorstate
     */
    GetMirrorState(dwStreamIndex) {
        result := ComCall(14, this, "uint", dwStreamIndex, BOOL.Ptr, &pfMirrorState := 0, "HRESULT")
        return pfMirrorState
    }

    /**
     * Enables or disables mirroring of the video preview stream. (IMFCaptureSource.SetMirrorState)
     * @param {Integer} dwStreamIndex The zero-based index of the stream.
     * @param {BOOL} fMirrorState If   <b>TRUE</b>,    mirroring is enabled; if  <b>FALSE</b>, mirroring is  disabled.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device stream does not have mirroring capability.
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
     * The source is not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-setmirrorstate
     */
    SetMirrorState(dwStreamIndex, fMirrorState) {
        result := ComCall(15, this, "uint", dwStreamIndex, BOOL, fMirrorState, "HRESULT")
        return result
    }

    /**
     * Gets the actual device stream index translated from a friendly stream name.
     * @param {Integer} uifriendlyName The friendly name.  Can be one of the following:
     * 
     * <ul>
     * <li>MF_CAPTURE_ENGINE_FIRST_SOURCE_AUDIO_STREAM</li>
     * <li>MF_CAPTURE_ENGINE_FIRST_SOURCE_VIDEO_STREAM</li>
     * <li>MF_CAPTURE_ENGINE_FIRST_SOURCE_PHOTO_STREAM</li>
     * <li>MF_CAPTURE_ENGINE_PREFERRED_SOURCE_VIDEO_STREAM_FOR_RECORD</li>
     * <li>MF_CAPTURE_ENGINE_PREFERRED_SOURCE_VIDEO_STREAM_FOR_PREVIEW</li>
     * <li>MF_CAPTURE_ENGINE_FIRST_SOURCE_INDEPENDENT_PHOTO_STREAM</li>
     * </ul>
     * @returns {Integer} Receives the value of the stream index that corresponds to the friendly name.
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesource-getstreamindexfromfriendlyname
     */
    GetStreamIndexFromFriendlyName(uifriendlyName) {
        result := ComCall(16, this, "uint", uifriendlyName, "uint*", &pdwActualStreamIndex := 0, "HRESULT")
        return pdwActualStreamIndex
    }

    Query(iid) {
        if (IMFCaptureSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCaptureDeviceSource := CallbackCreate(GetMethod(implObj, "GetCaptureDeviceSource"), flags, 3)
        this.vtbl.GetCaptureDeviceActivate := CallbackCreate(GetMethod(implObj, "GetCaptureDeviceActivate"), flags, 3)
        this.vtbl.GetService := CallbackCreate(GetMethod(implObj, "GetService"), flags, 4)
        this.vtbl.AddEffect := CallbackCreate(GetMethod(implObj, "AddEffect"), flags, 3)
        this.vtbl.RemoveEffect := CallbackCreate(GetMethod(implObj, "RemoveEffect"), flags, 3)
        this.vtbl.RemoveAllEffects := CallbackCreate(GetMethod(implObj, "RemoveAllEffects"), flags, 2)
        this.vtbl.GetAvailableDeviceMediaType := CallbackCreate(GetMethod(implObj, "GetAvailableDeviceMediaType"), flags, 4)
        this.vtbl.SetCurrentDeviceMediaType := CallbackCreate(GetMethod(implObj, "SetCurrentDeviceMediaType"), flags, 3)
        this.vtbl.GetCurrentDeviceMediaType := CallbackCreate(GetMethod(implObj, "GetCurrentDeviceMediaType"), flags, 3)
        this.vtbl.GetDeviceStreamCount := CallbackCreate(GetMethod(implObj, "GetDeviceStreamCount"), flags, 2)
        this.vtbl.GetDeviceStreamCategory := CallbackCreate(GetMethod(implObj, "GetDeviceStreamCategory"), flags, 3)
        this.vtbl.GetMirrorState := CallbackCreate(GetMethod(implObj, "GetMirrorState"), flags, 3)
        this.vtbl.SetMirrorState := CallbackCreate(GetMethod(implObj, "SetMirrorState"), flags, 3)
        this.vtbl.GetStreamIndexFromFriendlyName := CallbackCreate(GetMethod(implObj, "GetStreamIndexFromFriendlyName"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCaptureDeviceSource)
        CallbackFree(this.vtbl.GetCaptureDeviceActivate)
        CallbackFree(this.vtbl.GetService)
        CallbackFree(this.vtbl.AddEffect)
        CallbackFree(this.vtbl.RemoveEffect)
        CallbackFree(this.vtbl.RemoveAllEffects)
        CallbackFree(this.vtbl.GetAvailableDeviceMediaType)
        CallbackFree(this.vtbl.SetCurrentDeviceMediaType)
        CallbackFree(this.vtbl.GetCurrentDeviceMediaType)
        CallbackFree(this.vtbl.GetDeviceStreamCount)
        CallbackFree(this.vtbl.GetDeviceStreamCategory)
        CallbackFree(this.vtbl.GetMirrorState)
        CallbackFree(this.vtbl.SetMirrorState)
        CallbackFree(this.vtbl.GetStreamIndexFromFriendlyName)
    }
}

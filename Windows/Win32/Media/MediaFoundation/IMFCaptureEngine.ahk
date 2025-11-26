#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCaptureSink.ahk
#Include .\IMFCaptureSource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls one or more capture devices.
 * @remarks
 * 
 * <b>IMFCaptureEngine</b> only supports one pass CBR encoding.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcaptureengine
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureEngine
     * @type {Guid}
     */
    static IID => Guid("{a6bba433-176b-48b2-b375-53aa03473207}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "StartPreview", "StopPreview", "StartRecord", "StopRecord", "TakePhoto", "GetSink", "GetSource"]

    /**
     * Initializes the capture engine.
     * @param {IMFCaptureEngineOnEventCallback} pEventCallback A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcaptureengineoneventcallback">IMFCaptureEngineOnEventCallback</a> interface. The caller must implement this interface. The capture engine uses this interface to send asynchronous events to the caller.
     * @param {IMFAttributes} pAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. This parameter can be <b>NULL</b>. 
     * 
     * You can use this parameter to configure the capture engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> to create an attribute store, and then set any of the following attributes.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-d3d-manager">MF_CAPTURE_ENGINE_D3D_MANAGER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-disable-dxva">MF_CAPTURE_ENGINE_DISABLE_DXVA</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-disable-hardware-transforms">MF_CAPTURE_ENGINE_DISABLE_HARDWARE_TRANSFORMS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-encoder-mft-fieldofuse-unlock-attribute">MF_CAPTURE_ENGINE_ENCODER_MFT_FIELDOFUSE_UNLOCK_Attribute</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-event-generator-guid">MF_CAPTURE_ENGINE_EVENT_GENERATOR_GUID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh162817(v=vs.85)">MF_CAPTURE_ENGINE_EVENT_STREAM_INDEX</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-mediasource-config">MF_CAPTURE_ENGINE_MEDIASOURCE_CONFIG</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-record-sink-audio-max-processed-samples">MF_CAPTURE_ENGINE_RECORD_SINK_AUDIO_MAX_PROCESSED_SAMPLES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-record-sink-audio-max-unprocessed-samples">MF_CAPTURE_ENGINE_RECORD_SINK_AUDIO_MAX_UNPROCESSED_SAMPLES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-record-sink-video-max-processed-samples">MF_CAPTURE_ENGINE_RECORD_SINK_VIDEO_MAX_PROCESSED_SAMPLES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-record-sink-video-max-unprocessed-samples">MF_CAPTURE_ENGINE_RECORD_SINK_VIDEO_MAX_UNPROCESSED_SAMPLES</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-use-audio-device-only">MF_CAPTURE_ENGINE_USE_AUDIO_DEVICE_ONLY</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-use-video-device-only">MF_CAPTURE_ENGINE_USE_VIDEO_DEVICE_ONLY</a>
     * </li>
     * </ul>
     * @param {IUnknown} pAudioSource An <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer that specifies an audio-capture device. This parameter can be <b>NULL</b>.
     * 
     * If you set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-use-video-device-only">MF_CAPTURE_ENGINE_USE_VIDEO_DEVICE_ONLY</a> attribute to <b>TRUE</b> in <i>pAttributes</i>, the capture engine does not use an audio device, and the <i>pAudioSource</i> parameter is ignored.
     * 
     * Otherwise, if <i>pAudioSource</i> is <b>NULL</b>, the capture engine selects the microphone that is built into the video camera specified by <i>pVideoSource</i>. If the video camera does not have a microphone, the capture engine enumerates the audio-capture devices on the system and selects the first one.
     * 
     * To override the default audio device, set <i>pAudioSource</i> to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer for the device. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/audio-video-capture-in-media-foundation">Audio/Video Capture in Media Foundation</a>.
     * @param {IUnknown} pVideoSource An <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointer that specifies a video-capture device. This parameter can be <b>NULL</b>.
     * 
     * If you set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-use-audio-device-only">MF_CAPTURE_ENGINE_USE_AUDIO_DEVICE_ONLY</a> attribute to <b>TRUE</b> in <i>pAttributes</i>, the capture engine does not use a video device, and the <i>pVideoSource</i> parameter is ignored.
     * 
     * Otherwise, if <i>pVideoSource</i> is <b>NULL</b>, the capture engine enumerates the video-capture devices on the system and selects the first one.
     * 
     * To override the default video device, set <i>pVideoSource</i> to an <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> pointer for the device. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/enumerating-video-capture-devices">Enumerating Video Capture Devices</a>.
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
     * The <a href="/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-initialize">Initialize</a> method was already called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NO_CAPTURE_DEVICES_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No capture devices are available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_CAPTURE_DEVICE_PRESENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unsupported capture device is present on the system. This error will only be returned if NULL is specified for the <i>pVideoSource</i> parameter, indicating that the system should pick the capture device, and if no supported capture device has already been attached. It is recommended that apps show users a specific unsupported capture device message if this error is returned, rather than a general failure message.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-initialize
     */
    Initialize(pEventCallback, pAttributes, pAudioSource, pVideoSource) {
        result := ComCall(3, this, "ptr", pEventCallback, "ptr", pAttributes, "ptr", pAudioSource, "ptr", pVideoSource, "HRESULT")
        return result
    }

    /**
     * Starts preview.
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
     * The preview sink was not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startpreview
     */
    StartPreview() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Stops preview.
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
     * The capture engine is not currently previewing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-stoppreview
     */
    StopPreview() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Starts recording audio and/or video to a file.
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
     * The recording sink was not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-startrecord
     */
    StartRecord() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Stops recording.
     * @param {BOOL} bFinalize A Boolean value that specifies whether to finalize the output file. To create a valid output file, specify <b>TRUE</b>. Specify <b>FALSE</b> only if you want to interrupt the recording and discard the output file. If the value is <b>FALSE</b>, the operation completes more quickly, but the file will not be playable.
     * @param {BOOL} bFlushUnprocessedSamples A Boolean value that specifies if the unprocessed samples waiting to be encoded should be flushed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-stoprecord
     */
    StopRecord(bFinalize, bFlushUnprocessedSamples) {
        result := ComCall(7, this, "int", bFinalize, "int", bFlushUnprocessedSamples, "HRESULT")
        return result
    }

    /**
     * Captures a still image from the video stream.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-takephoto
     */
    TakePhoto() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to one of the capture sink objects.
     * @param {Integer} mfCaptureEngineSinkType An <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/ne-mfcaptureengine-mf_capture_engine_sink_type">MF_CAPTURE_ENGINE_SINK_TYPE</a> value that specifies the capture sink to retrieve.
     * @returns {IMFCaptureSink} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturesink">IMFCaptureSink</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsink
     */
    GetSink(mfCaptureEngineSinkType) {
        result := ComCall(9, this, "int", mfCaptureEngineSinkType, "ptr*", &ppSink := 0, "HRESULT")
        return IMFCaptureSink(ppSink)
    }

    /**
     * Gets a pointer to the capture source object.
     * @returns {IMFCaptureSource} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturesource">IMFCaptureSource</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsource
     */
    GetSource() {
        result := ComCall(10, this, "ptr*", &ppSource := 0, "HRESULT")
        return IMFCaptureSource(ppSource)
    }
}

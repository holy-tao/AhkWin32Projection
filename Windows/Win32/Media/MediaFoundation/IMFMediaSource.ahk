#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPresentationDescriptor.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Implemented by media source objects.
 * @remarks
 * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasourceex">IMFMediaSourceEx</a>.
 * 
 * For some device sources, such as cameras or microphones, the **IMFMediaSource** also implements the [IKsControl](/windows-hardware/drivers/ddi/ksproxy/nn-ksproxy-ikscontrol) which can be used by user mode applications to issue KSPROPERTY, KSEVENT and KSMETHOD operations to the underlying device driver.
 * 
 * > [!NOTE] 
 * > This interface is optional and may not be available. If this interface is not available, [QueryInterface](../unknwn/nf-unknwn-iunknown-queryinterface(refiid_void).md) will return E_NOINTERFACE.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfmediasource
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSource extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSource
     * @type {Guid}
     */
    static IID => Guid("{279a808d-aec7-40c8-9c6b-a6b492c78a66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCharacteristics", "CreatePresentationDescriptor", "Start", "Stop", "Pause", "Shutdown"]

    /**
     * Retrieves the characteristics of the media source.
     * @remarks
     * The characteristics of a media source can change at any time. If this happens, the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcecharacteristicschanged">MESourceCharacteristicsChanged</a> event.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfmediasource_characteristics">MFMEDIASOURCE_CHARACTERISTICS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-getcharacteristics
     */
    GetCharacteristics() {
        result := ComCall(7, this, "uint*", &pdwCharacteristics := 0, "HRESULT")
        return pdwCharacteristics
    }

    /**
     * Retrieves a copy of the media source's presentation descriptor. Applications use the presentation descriptor to select streams and to get information about the source content.
     * @remarks
     * The presentation descriptor contains the media source's default settings for the presentation. The application can change these settings by selecting or deselecting streams, or by changing the media type on a stream. Do not modify the presentation descriptor unless the source is stopped. The changes take affect when the source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-start">IMFMediaSource::Start</a> method is called.
     * @returns {IMFPresentationDescriptor} Receives a pointer to the presentation descriptor's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor
     */
    CreatePresentationDescriptor() {
        result := ComCall(8, this, "ptr*", &ppPresentationDescriptor := 0, "HRESULT")
        return IMFPresentationDescriptor(ppPresentationDescriptor)
    }

    /**
     * Starts, seeks, or restarts the media source by specifying where to start playback.
     * @remarks
     * This method is asynchronous. If the operation succeeds, the media source sends the following events:
     * 
     * <ul>
     * <li>For each new stream, the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/menewstream">MENewStream</a> event. This event is sent for the first <b>Start</b> call in which the stream appears. The event data is a pointer to the stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediastream">IMFMediaStream</a> interface.
     *           </li>
     * <li>For each <i>updated</i> stream, the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/meupdatedstream">MEUpdatedStream</a> event. A stream is updated if the stream already existed when <b>Start</b> was called (for example, if the application seeks during playback). The event data is a pointer to the stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediastream">IMFMediaStream</a> interface.
     *           </li>
     * <li>If the previous state was stopped, the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcestarted">MESourceStarted</a> event.
     *           </li>
     * <li>If the previous state was started or paused and the starting position is the current position (<b>VT_EMPTY</b>), the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcestarted">MESourceStarted</a> event.
     *           </li>
     * <li>If the previous state was started or paused, and a new starting position is specified, the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourceseeked">MESourceSeeked</a> event.
     *           </li>
     * <li>If the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcestarted">MESourceStarted</a> event, each media stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamstarted">MEStreamStarted</a> event. If the source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourceseeked">MESourceSeeked</a> event, each stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamseeked">MEStreamSeeked</a> event.
     *           </li>
     * </ul>
     * If the start operation fails asynchronously (after the method returns <b>S_OK</b>), the media source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcestarted">MESourceStarted</a> event that contains a failure code, without sending any of the other events listed here. If the method fails synchronously (returns an error code), no events are raised.
     *       
     * 
     * A call to <b>Start</b> results in a <i>seek</i> if the previous state was started or paused, and the new starting position is not <b>VT_EMPTY</b>. Not every media source can seek. If a media source can seek, the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-getcharacteristics">IMFMediaSource::GetCharacteristics</a> method returns the <b>MFMEDIASOURCE_CAN_SEEK</b> flag.
     *       
     * 
     * Events from the media source are not synchronized with events from the media streams. If you seek a media source, therefore, you can still receive samples from the earlier position after getting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourceseeked">MESourceSeeked</a> event. If you need to synchronize the operations, wait for the stream event, <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamseeked">MEStreamSeeked</a>, which marks the exact point in the stream where the seek occurs.
     *       
     * 
     * <h3><a id="End_of_Stream"></a><a id="end_of_stream"></a><a id="END_OF_STREAM"></a>End of Stream</h3>
     * When a stream plays to the end, the stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/meendofstream">MEEndOfStream</a> event. When all of the selected streams have reached the end, the media source sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/meendofpresentation">MEEndOfPresentation</a> event.
     * 
     * If the starting position is past the end of a selected stream (but before the end of the presentation), the stream should send <a href="https://docs.microsoft.com/windows/desktop/medfound/meendofstream">MEEndOfStream</a> immediately after <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamstarted">MEStreamStarted</a>/<a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamseeked">MEStreamSeeked</a>. If playback reaches the end of the presentation and <b>Start</b> is called again from the current position, the streams re-send the MEEndOfStream event and the media source re-sends the <a href="https://docs.microsoft.com/windows/desktop/medfound/meendofpresentation">MEEndOfPresentation</a> event. These events inform the pipeline not to request any more data.
     * 
     * During reverse playback, the start of the file is considered the end of the stream. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/implementing-rate-control">Implementing Rate Control</a>.
     * 
     * <h3><a id="Implementing_Start"></a><a id="implementing_start"></a><a id="IMPLEMENTING_START"></a>Implementing Start</h3>
     * When a media source executes a seek, it should start at the first key frame before the seek time, so that the decoder can decode the samples for the target start time. The pipeline will discard any decoded samples that are too early.
     * 
     * If the start time is <b>VT_EMPTY</b> and the previous state was started or paused, the source should resume from its current position. In this case, it is not necessary to resend the previous key frame, because the decoder will still have the data that was previously sent.
     * 
     * When validating the  <i>pPresentationDescriptor</i> parameter, the media source should check only for the information that it needs to function correctly. In particular, the client can add private attributes to the presentation descriptor. The presence of additional attributes should not cause the <b>Start</b> method to fail.
     * 
     * After <b>Start</b> is called, each stream on the media source must do one of the following:
     * 
     * <ul>
     * <li>Deliver media data in response to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediastream-requestsample">IMFMediaStream::RequestSample</a> calls.</li>
     * <li>Send <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamtick">MEStreamTick</a> events to indicate a gap in the stream.</li>
     * <li>Send an <a href="https://docs.microsoft.com/windows/desktop/medfound/meendofstream">MEEndOfStream</a> event to indicate the end of the stream.</li>
     * </ul>
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/writing-a-custom-media-source">Writing a Custom Media Source</a>.
     * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the media source's presentation descriptor. To get the presentation descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor">IMFMediaSource::CreatePresentationDescriptor</a>. You can modify the presentation descriptor before calling <b>Start</b>, to select or deselect streams or change the media types.
     * @param {Pointer<Guid>} pguidTimeFormat Pointer to a GUID that specifies the time format. The time format defines the units for the <i>pvarStartPosition</i> parameter. If the value <i></i> is <b>GUID_NULL</b>, the time format is 100-nanosecond units. Some media sources might support additional time format GUIDs. This parameter can be <b>NULL</b>. If the value is <b>NULL</b>, it is equivalent to <b>GUID_NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvarStartPosition Specifies where to start playback. The units of this parameter are indicated by the time format given in <i>pguidTimeFormat</i>. If the time format is <b>GUID_NULL</b>, the variant type must be <b>VT_I8</b> or <b>VT_EMPTY</b>. Use <b>VT_I8</b> to specify a new starting position, in 100-nanosecond units. Use <b>VT_EMPTY</b> to start from the current position. Other time formats might use other <b>PROPVARIANT</b> types.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ASF_OUTOFRANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The start position is past the end of the presentation (ASF media source).
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_HW_MFT_FAILED_START_STREAMING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A hardware device was unable to start streaming. This error code can be returned by a media source that represents a hardware device, such as a camera. For example, if the camera is already being used by another application, the method might return this error code.
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
     * The start request is not valid. For example, the start position is past the end of the presentation.
     *               
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
     * The media source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_TIME_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source does not support the time format specified in <i>pguidTimeFormat</i>.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-start
     */
    Start(pPresentationDescriptor, pguidTimeFormat, pvarStartPosition) {
        result := ComCall(9, this, "ptr", pPresentationDescriptor, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "HRESULT")
        return result
    }

    /**
     * Stops all active streams in the media source.
     * @remarks
     * This method is asynchronous. When the operation completes, the media source sends and <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcestopped">MESourceStopped</a> event, and every active stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamstopped">MEStreamStopped</a> event. If the method returns a failure code, no events are raised.
     * 
     * When a media source is stopped, its current position reverts to zero. After that, if the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-start">Start</a> method is called with VT_EMPTY for the starting position, playback starts from the beginning of the presentation.
     * 
     * While the source is stopped, no streams produce data.
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
     * The media source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-stop
     */
    Stop() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Pauses all active streams in the media source.
     * @remarks
     * This method is asynchronous. When the operation completes, the media source sends and <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcepaused">MESourcePaused</a> event, and every active stream sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreampaused">MEStreamPaused</a> event. If the method returns a failure code, no events are raised.
     * 
     * The media source must be in the started state. The method fails if the media source is paused or stopped.
     * 
     * While the source is paused, calls to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediastream-requestsample">IMFMediaStream::RequestSample</a> succeed, but the streams will not deliver any samples until after the source is started again. Note that the source's event queue is not serialized with the stream event queues, so the client might receive some samples after the <a href="https://docs.microsoft.com/windows/desktop/medfound/mesourcepaused">MESourcePaused</a> event, due to multi-threading issues. But the client will not receive any samples from a stream after the <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreampaused">MEStreamPaused</a> event.
     * 
     * Not every media source can pause. If a media source can pause, the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-getcharacteristics">IMFMediaSource::GetCharacteristics</a> method returns the MFMEDIASOURCE_CAN_PAUSE flag.
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
     * <dt><b>MF_E_INVALID_STATE_TRANSITION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid state transition. The media source must be in the started state.
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
     * The media source's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-pause
     */
    Pause() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Shuts down the media source and releases the resources it is using.
     * @remarks
     * If the application creates the media source, either directly or through the source resolver, the application is responsible for calling <b>Shutdown</b> to avoid memory or resource leaks.
     * 
     * After this method is called, methods on the media source and all of its media streams return MF_E_SHUTDOWN (except for <b>IUnknown</b> methods).
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasource-shutdown
     */
    Shutdown() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}

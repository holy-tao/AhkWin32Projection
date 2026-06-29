#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFSTREAMSINK_MARKER_TYPE.ahk" { MFSTREAMSINK_MARKER_TYPE }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\IMFMediaSink.ahk" { IMFMediaSink }
#Import ".\IMFSample.ahk" { IMFSample }
#Import ".\IMFMediaEventGenerator.ahk" { IMFMediaEventGenerator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaTypeHandler.ahk" { IMFMediaTypeHandler }

/**
 * Represents a stream on a media sink object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfstreamsink
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFStreamSink extends IMFMediaEventGenerator {
    /**
     * The interface identifier for IMFStreamSink
     * @type {Guid}
     */
    static IID := Guid("{0a97b3cf-8e7c-4a3d-8f8c-0c843dc247fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFStreamSink interfaces
    */
    struct Vtbl extends IMFMediaEventGenerator.Vtbl {
        GetMediaSink        : IntPtr
        GetIdentifier       : IntPtr
        GetMediaTypeHandler : IntPtr
        ProcessSample       : IntPtr
        PlaceMarker         : IntPtr
        Flush               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFStreamSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the media sink that owns this stream sink.
     * @returns {IMFMediaSink} Receives a pointer to the media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-getmediasink
     */
    GetMediaSink() {
        result := ComCall(7, this, "ptr*", &ppMediaSink := 0, "HRESULT")
        return IMFMediaSink(ppMediaSink)
    }

    /**
     * Retrieves the stream identifier for this stream sink.
     * @returns {Integer} Receives the stream identifier. If this stream sink was added by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a>, the stream identifier is in the <i>dwStreamSinkIdentifier</i> parameter of that method. Otherwise, the media sink defines the identifier.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-getidentifier
     */
    GetIdentifier() {
        result := ComCall(8, this, "uint*", &pdwIdentifier := 0, "HRESULT")
        return pdwIdentifier
    }

    /**
     * Retrieves the media type handler for the stream sink. You can use the media type handler to find which formats the stream supports, and to set the media type on the stream.
     * @remarks
     * If the stream sink currently does not support any media types, this method returns a media type handler that fails any calls to <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-getcurrentmediatype">IMFMediaTypeHandler::GetCurrentMediaType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-ismediatypesupported">IMFMediaTypeHandler::IsMediaTypeSupported</a>.
     * @returns {IMFMediaTypeHandler} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediatypehandler">IMFMediaTypeHandler</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-getmediatypehandler
     */
    GetMediaTypeHandler() {
        result := ComCall(9, this, "ptr*", &ppHandler := 0, "HRESULT")
        return IMFMediaTypeHandler(ppHandler)
    }

    /**
     * Delivers a sample to the stream. The media sink processes the sample.
     * @remarks
     * Call this method when the stream sink sends an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkrequestsample">MEStreamSinkRequestSample</a> event.
     * 
     * This method can return MF_E_INVALID_TIMESTAMP for various reasons, depending on the implementation of the media sink:
     * 
     * <ul>
     * <li>
     * Negative time stamps.
     * 
     * </li>
     * <li>
     * Time stamps that jump backward (within the same stream).
     * 
     * </li>
     * <li>
     * The time stamps for one stream have drifted too far from the time stamps on another stream within the same media sink (for example, an archive sink that multiplexes the streams).
     * 
     * </li>
     * </ul>
     * Not every media sink returns an error code in these situations.
     * @param {IMFSample} pSample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of a sample that contains valid data for the stream.
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
     * The media sink is in the wrong state to receive a sample. For example, preroll is complete but the presentation clock has not started yet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_TIMESTAMP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample has an invalid time stamp. See Remarks.
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
     * The media sink is paused or stopped and cannot process the sample.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NO_CLOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presentation clock was not set. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-setpresentationclock">IMFMediaSink::SetPresentationClock</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NO_SAMPLE_TIMESTAMP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample does not have a time stamp.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream sink has not been initialized.
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
     * The media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_STREAMSINK_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This stream was removed from the media sink and is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-processsample
     */
    ProcessSample(pSample) {
        result := ComCall(10, this, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * Places a marker in the stream.
     * @remarks
     * This method causes the stream sink to send an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkmarker">MEStreamSinkMarker</a> event after the stream sink consumes all of the samples that were delivered up to this point (before the call to <b>PlaceMarker</b>).
     * @param {MFSTREAMSINK_MARKER_TYPE} eMarkerType Specifies the marker type, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfstreamsink_marker_type">MFSTREAMSINK_MARKER_TYPE</a> enumeration.
     * @param {Pointer<PROPVARIANT>} pvarMarkerValue Optional pointer to a <b>PROPVARIANT</b> that contains additional information related to the marker. The meaning of this value depends on the marker type. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvarContextValue Optional pointer to a <b>PROPVARIANT</b> that is attached to the <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkmarker">MEStreamSinkMarker</a> event. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediaevent-getvalue">IMFMediaEvent::GetValue</a> to get this value from the event. The caller can use this information for any purpose. This parameter can be <b>NULL</b>.
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
     * <dt><b><b>S_OK</b></b></dt>
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
     * <dt><b><b>MF_E_SHUTDOWN</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_STREAMSINK_REMOVED</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This stream was removed from the media sink and is no longer valid.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-placemarker
     */
    PlaceMarker(eMarkerType, pvarMarkerValue, pvarContextValue) {
        result := ComCall(11, this, MFSTREAMSINK_MARKER_TYPE, eMarkerType, PROPVARIANT.Ptr, pvarMarkerValue, PROPVARIANT.Ptr, pvarContextValue, "HRESULT")
        return result
    }

    /**
     * Causes the stream sink to drop any samples that it has received and has not rendered yet.
     * @remarks
     * If any samples are still queued from previous calls to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-processsample">IMFStreamSink::ProcessSample</a> method, the media sink immediately discards them, without processing them. This can cause a glitch in the rendered output. The running state of the sink (running, paused, or stopped) does not change.
     * 
     * Any pending marker events from the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-placemarker">IMFStreamSink::PlaceMarker</a> method are dispatched immediately, with the status code E_ABORT.
     * 
     * This method is synchronous. It does not return until the sink has discarded all pending samples.
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
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream sink has not been initialized yet. You might need to set a media type.
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
     * The media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_STREAMSINK_REMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This stream was removed from the media sink and is no longer valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamsink-flush
     */
    Flush() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFStreamSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMediaSink := CallbackCreate(GetMethod(implObj, "GetMediaSink"), flags, 2)
        this.vtbl.GetIdentifier := CallbackCreate(GetMethod(implObj, "GetIdentifier"), flags, 2)
        this.vtbl.GetMediaTypeHandler := CallbackCreate(GetMethod(implObj, "GetMediaTypeHandler"), flags, 2)
        this.vtbl.ProcessSample := CallbackCreate(GetMethod(implObj, "ProcessSample"), flags, 2)
        this.vtbl.PlaceMarker := CallbackCreate(GetMethod(implObj, "PlaceMarker"), flags, 4)
        this.vtbl.Flush := CallbackCreate(GetMethod(implObj, "Flush"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMediaSink)
        CallbackFree(this.vtbl.GetIdentifier)
        CallbackFree(this.vtbl.GetMediaTypeHandler)
        CallbackFree(this.vtbl.ProcessSample)
        CallbackFree(this.vtbl.PlaceMarker)
        CallbackFree(this.vtbl.Flush)
    }
}

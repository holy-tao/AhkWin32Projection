#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSink.ahk
#Include .\IMFMediaTypeHandler.ahk
#Include .\IMFMediaEventGenerator.ahk

/**
 * Represents a stream on a media sink object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfstreamsink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFStreamSink extends IMFMediaEventGenerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFStreamSink
     * @type {Guid}
     */
    static IID => Guid("{0a97b3cf-8e7c-4a3d-8f8c-0c843dc247fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaSink", "GetIdentifier", "GetMediaTypeHandler", "ProcessSample", "PlaceMarker", "Flush"]

    /**
     * Retrieves the media sink that owns this stream sink.
     * @returns {IMFMediaSink} Receives a pointer to the media sink's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasink">IMFMediaSink</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfstreamsink-getmediasink
     */
    GetMediaSink() {
        result := ComCall(7, this, "ptr*", &ppMediaSink := 0, "HRESULT")
        return IMFMediaSink(ppMediaSink)
    }

    /**
     * Retrieves the stream identifier for this stream sink.
     * @returns {Integer} Receives the stream identifier. If this stream sink was added by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a>, the stream identifier is in the <i>dwStreamSinkIdentifier</i> parameter of that method. Otherwise, the media sink defines the identifier.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfstreamsink-getidentifier
     */
    GetIdentifier() {
        result := ComCall(8, this, "uint*", &pdwIdentifier := 0, "HRESULT")
        return pdwIdentifier
    }

    /**
     * Retrieves the media type handler for the stream sink. You can use the media type handler to find which formats the stream supports, and to set the media type on the stream.
     * @returns {IMFMediaTypeHandler} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediatypehandler">IMFMediaTypeHandler</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfstreamsink-getmediatypehandler
     */
    GetMediaTypeHandler() {
        result := ComCall(9, this, "ptr*", &ppHandler := 0, "HRESULT")
        return IMFMediaTypeHandler(ppHandler)
    }

    /**
     * Delivers a sample to the stream. The media sink processes the sample.
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
     * The media sink is in the wrong state to receive a sample. For example, preroll is complete but the presenation clock has not started yet.
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
     * The presentation clock was not set. Call <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-setpresentationclock">IMFMediaSink::SetPresentationClock</a>.
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
     * The media sink's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfstreamsink-processsample
     */
    ProcessSample(pSample) {
        result := ComCall(10, this, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * Places a marker in the stream.
     * @param {Integer} eMarkerType Specifies the marker type, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfstreamsink_marker_type">MFSTREAMSINK_MARKER_TYPE</a> enumeration.
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
     * The media sink's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfstreamsink-placemarker
     */
    PlaceMarker(eMarkerType, pvarMarkerValue, pvarContextValue) {
        result := ComCall(11, this, "int", eMarkerType, "ptr", pvarMarkerValue, "ptr", pvarContextValue, "HRESULT")
        return result
    }

    /**
     * Causes the stream sink to drop any samples that it has received and has not rendered yet.
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
     * The media sink's <a href="/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-shutdown">Shutdown</a> method has been called.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfstreamsink-flush
     */
    Flush() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}

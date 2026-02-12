#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_SINK_WRITER_STATISTICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Microsoft Media Foundation sink writer object.
 * @remarks
 * To create the sink writer, call one of the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfrommediasink">MFCreateSinkWriterFromMediaSink</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesinkwriterfromurl">MFCreateSinkWriterFromURL</a>
 * </li>
 * </ul>
 * Alternatively, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfreadwriteclassfactory">IMFReadWriteClassFactory</a> interface.
 * 
 * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * 
 * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsinkwriterex">IMFSinkWriterEx</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nn-mfreadwrite-imfsinkwriter
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSinkWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSinkWriter
     * @type {Guid}
     */
    static IID => Guid("{3137f1cd-fe5e-4805-a5d8-fb477448cb3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddStream", "SetInputMediaType", "BeginWriting", "WriteSample", "SendStreamTick", "PlaceMarker", "NotifyEndOfSegment", "Flush", "Finalize", "GetServiceForStream", "GetStatistics"]

    /**
     * Adds a stream to the sink writer.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {IMFMediaType} pTargetMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a media type. This media type specifies the format of the samples that will be written to the file. It does not need to match the input format. To set the input format, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-setinputmediatype">IMFSinkWriter::SetInputMediaType</a>.
     * @returns {Integer} Receives the zero-based index of the new stream.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-addstream
     */
    AddStream(pTargetMediaType) {
        result := ComCall(3, this, "ptr", pTargetMediaType, "uint*", &pdwStreamIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwStreamIndex
    }

    /**
     * Sets the input format for a stream on the sink writer.
     * @remarks
     * The input format does not have to match the target format that is written to the media sink. If the formats do not match, the method attempts to load an encoder that can encode from the input format to the target format.
     * 
     * After streaming begins—that is, after the  first call to <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample">IMFSinkWriter::WriteSample</a>—you can call this method at any time to change the input format.  However, the underlying encoder and media sink must support dynamic format changes.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of the stream. The index is received by the <i>pdwStreamIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-addstream">IMFSinkWriter::AddStream</a> method.
     * @param {IMFMediaType} pInputMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a media type. The media type specifies the input format.
     * @param {IMFAttributes} pEncodingParameters A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store. Use the attribute store to configure the encoder. This parameter can be <b>NULL</b>.
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
     * <dt><b><b>MF_E_INVALIDMEDIATYPE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying media sink does not support the format, no conversion is possible, or a dynamic format change is not possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_INVALIDSTREAMNUMBER</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwStreamIndex</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_TOPO_CODEC_NOT_FOUND</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find an encoder for the encoded format.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-setinputmediatype
     */
    SetInputMediaType(dwStreamIndex, pInputMediaType, pEncodingParameters) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ptr", pInputMediaType, "ptr", pEncodingParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes the sink writer for writing.
     * @remarks
     * Call this method after you configure the input streams and before you send any data to the sink writer. 
     * 
     * You must call <b>BeginWriting</b> before calling any of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-finalize">IMFSinkWriter::Finalize</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-flush">IMFSinkWriter::Flush</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-notifyendofsegment">IMFSinkWriter::NotifyEndOfSegment</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-placemarker">IMFSinkWriter::PlaceMarker</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-sendstreamtick">IMFSinkWriter::SendStreamTick</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample">IMFSinkWriter::WriteSample</a>
     * </li>
     * </ul>
     * The underlying media sink must have at least one input stream. Otherwise, <b>BeginWriting</b> returns <b>MF_E_INVALIDREQUEST</b>. To add input streams, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-addstream">IMFSinkWriter::AddStream</a> method.
     * 
     * If <b>BeginWriting</b> succeeds, any further calls to <b>BeginWriting</b> return <b>MF_E_INVALIDREQUEST</b>.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
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
     * The request is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-beginwriting
     */
    BeginWriting() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delivers a sample to the sink writer.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-beginwriting">IMFSinkWriter::BeginWriting</a> before calling this method. Otherwise, the method returns <b>MF_E_INVALIDREQUEST</b>.
     * 
     * By default, the sink writer limits the rate of incoming data by blocking the calling thread inside the <b>WriteSample</b> method. This prevents the application from delivering samples too quickly. To disable this behavior, set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sink-writer-disable-throttling">MF_SINK_WRITER_DISABLE_THROTTLING</a> attribute when you create the sink writer.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of the stream for this sample.
     * @param {IMFSample} pSample A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the sample.
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
     * The request is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample
     */
    WriteSample(dwStreamIndex, pSample) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr", pSample, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates a gap in an input stream.
     * @remarks
     * For video, call this method once for each missing frame. For audio, call this method at least once per second during a gap in the audio. Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-discontinuity-attribute">MFSampleExtension_Discontinuity</a> attribute on the first media sample after the gap.
     * 
     * Internally, this method calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-placemarker">IMFStreamSink::PlaceMarker</a> on the media sink.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of the stream.
     * @param {Integer} llTimestamp The position in the stream where the gap in the data occurs. The value is given in 100-nanosecond units, relative to the start of the stream.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-sendstreamtick
     */
    SendStreamTick(dwStreamIndex, llTimestamp) {
        result := ComCall(7, this, "uint", dwStreamIndex, "int64", llTimestamp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Places a marker in the specified stream.
     * @remarks
     * To use this method, you must provide an asynchronous callback when you create the sink writer. Otherwise, the method returns <b>MF_E_INVALIDREQUEST</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sink-writer-async-callback">MF_SINK_WRITER_ASYNC_CALLBACK</a>.
     * 
     * Markers provide a way to be notified when the media sink consumes all of the samples in a stream up to a certain point. The media sink does not process the marker until it has processed all of the samples that came before the marker. When the media sink processes the marker, the sink writer calls the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onmarker">OnMarker</a> method. When the callback is invoked, you know that the sink has consumed all of the previous samples for that stream.
     * 
     * For example, to change the format midstream, call <b>PlaceMarker</b> at the point where the format changes. When <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onmarker">OnMarker</a> is called, it is safe to call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-setinputmediatype">IMFSinkWriter::SetInputMediaType</a> to change the input type (assuming that the media sink supports dynamic format changes).
     * 
     * Internally, this method calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-placemarker">IMFStreamSink::PlaceMarker</a> on the media sink.
     * 
     * 
     * <div class="alert"><b>Note</b>  The <i>pvContext</i> parameter of the <b>IMFSinkWriter::PlaceMarker</b> method is not passed to the <i>pvarContextValue</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-placemarker">IMFStreamSink::PlaceMarker</a> method. These two parameters are not directly related.</div>
     * <div> </div>
     * 
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of the stream.
     * @param {Pointer<Void>} pvContext Pointer to an application-defined value. The value of this parameter is returned to the caller in the <i>pvContext</i>  parameter of the caller's <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onmarker">IMFSinkWriterCallback::OnMarker</a> callback method. The application is responsible for any memory allocation associated with this data. This parameter can be <b>NULL</b>.
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
     * The request is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-placemarker
     */
    PlaceMarker(dwStreamIndex, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwStreamIndex, pvContextMarshal, pvContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the media sink that a stream has reached the end of a segment.
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-beginwriting">IMFSinkWriter::BeginWriting</a> before calling this method. Otherwise, the method returns <b>MF_E_INVALIDREQUEST</b>.
     * 
     * This method sends an <b>MFSTREAMSINK_MARKER_ENDOFSEGMENT</b> marker to the media sink for the specified streams. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-placemarker">IMFStreamSink::PlaceMarker</a>.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of a stream, or <b>MF_SINK_WRITER_ALL_STREAMS</b> to signal that all streams have reached the end of a segment.
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
     * The request is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-notifyendofsegment
     */
    NotifyEndOfSegment(dwStreamIndex) {
        result := ComCall(9, this, "uint", dwStreamIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Flushes one or more streams. (IMFSinkWriter.Flush)
     * @remarks
     * You must call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-beginwriting">IMFSinkWriter::BeginWriting</a> before calling this method. Otherwise, the method returns <b>MF_E_INVALIDREQUEST</b>.
     * 
     * For each stream that is flushed, the sink writer drops all pending samples, flushes the encoder, and sends an <b>MFSTREAMSINK_MARKER_ENDOFSEGMENT</b> marker to the media sink.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of the stream to flush, or <b>MF_SINK_WRITER_ALL_STREAMS</b> to flush all of the streams.
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
     * The request is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-flush
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes all writing operations on the sink writer.
     * @remarks
     * Call this method after you send all of the input samples to the sink writer. The method performs any operations needed to create the final output from the media sink.
     * 
     * If you provide a callback interface when you create the sink writer, this method completes asynchronously. When the operation completes, the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwritercallback-onfinalize">IMFSinkWriterCallback::OnFinalize</a> method of your callback is called. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sink-writer-async-callback">MF_SINK_WRITER_ASYNC_CALLBACK</a>.  Otherwise, if you do not provide a callback, the <b>Finalize</b> method blocks until the operation completes.
     * 
     * Internally, this method calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-placemarker">IMFStreamSink::PlaceMarker</a> to place end-of-segment markers for each stream on the media sink. It also calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imffinalizablemediasink-beginfinalize">IMFFinalizableMediaSink::BeginFinalize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imffinalizablemediasink-endfinalize">EndFinalize</a> if the media sink supports the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imffinalizablemediasink">IMFFinalizableMediaSink</a> interface.
     * 
     * After this method is called, the following methods will fail:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-placemarker">IMFSinkWriter::PlaceMarker</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-sendstreamtick">IMFSinkWriter::SendStreamTick</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample">IMFSinkWriter::WriteSample</a>
     * </li>
     * </ul>
     * If you do not call <b>Finalize</b>, the output from the media sink might be incomplete or invalid. For example, required file headers might be missing from the output file.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-finalize
     */
    Finalize() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Queries the underlying media sink or encoder for an interface.
     * @remarks
     * If the <i>dwStreamIndex</i> parameter equals <b>MF_SINK_WRITER_MEDIASINK</b>, the method attempts to get the interface from the media sink. Otherwise, it attempts to get the interface from the encoder for the stream at the specified index. If that fails, or if no encoder is present, the method attempts to get the interface from the stream on the media sink.
     * 
     * If the input and output types of the sink are identical and compressed,
     *           it's possible that no encoding is required and the video encoder will not be instantiated.
     *           In that case, <b>GetServiceForStream</b> will return MF_E_UNSUPPORTED_SERVICE.
     *         
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of a stream to query, or <b>MF_SINK_WRITER_MEDIASINK</b> to query the media sink itself.
     * @param {Pointer<Guid>} guidService A service identifier GUID, or <b>GUID_NULL</b>.  If the value is <b>GUID_NULL</b>, the method calls <b>QueryInterface</b> to get the requested interface. Otherwise, the method calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a>. For a list of service identifiers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/service-interfaces">Service Interfaces</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-getserviceforstream
     */
    GetServiceForStream(dwStreamIndex, guidService, riid) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr*", &ppvObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvObject
    }

    /**
     * Gets statistics about the performance of the sink writer.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The zero-based index of a stream to query, or <b>MF_SINK_WRITER_ALL_STREAMS </b> to query the media sink itself.
     * @returns {MF_SINK_WRITER_STATISTICS} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/ns-mfreadwrite-mf_sink_writer_statistics">MF_SINK_WRITER_STATISTICS</a> structure. Before calling the method, set the <b>cb</b> member to the size of the structure in bytes. The method fills the structure with statistics from the sink writer.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfreadwrite/nf-mfreadwrite-imfsinkwriter-getstatistics
     */
    GetStatistics(dwStreamIndex) {
        pStats := MF_SINK_WRITER_STATISTICS()
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pStats, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pStats
    }
}

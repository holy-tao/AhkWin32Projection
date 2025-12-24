#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MF_SINK_WRITER_STATISTICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Microsoft Media Foundation sink writer object.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsinkwriter
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
     * @param {IMFMediaType} pTargetMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a media type. This media type specifies the format of the samples that will be written to the file. It does not need to match the input format. To set the input format, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-setinputmediatype">IMFSinkWriter::SetInputMediaType</a>.
     * @returns {Integer} Receives the zero-based index of the new stream.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-addstream
     */
    AddStream(pTargetMediaType) {
        result := ComCall(3, this, "ptr", pTargetMediaType, "uint*", &pdwStreamIndex := 0, "HRESULT")
        return pdwStreamIndex
    }

    /**
     * Sets the input format for a stream on the sink writer.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-setinputmediatype
     */
    SetInputMediaType(dwStreamIndex, pInputMediaType, pEncodingParameters) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ptr", pInputMediaType, "ptr", pEncodingParameters, "HRESULT")
        return result
    }

    /**
     * Initializes the sink writer for writing.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-beginwriting
     */
    BeginWriting() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Delivers a sample to the sink writer.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample
     */
    WriteSample(dwStreamIndex, pSample) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr", pSample, "HRESULT")
        return result
    }

    /**
     * Indicates a gap in an input stream.
     * @param {Integer} dwStreamIndex The zero-based index of the stream.
     * @param {Integer} llTimestamp The position in the stream where the gap in the data occurs. The value is given in 100-nanosecond units, relative to the start of the stream.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-sendstreamtick
     */
    SendStreamTick(dwStreamIndex, llTimestamp) {
        result := ComCall(7, this, "uint", dwStreamIndex, "int64", llTimestamp, "HRESULT")
        return result
    }

    /**
     * Places a marker in the specified stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-placemarker
     */
    PlaceMarker(dwStreamIndex, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwStreamIndex, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * Notifies the media sink that a stream has reached the end of a segment.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-notifyendofsegment
     */
    NotifyEndOfSegment(dwStreamIndex) {
        result := ComCall(9, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Flushes one or more streams.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-flush
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Completes all writing operations on the sink writer.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-finalize
     */
    Finalize() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Queries the underlying media sink or encoder for an interface.
     * @param {Integer} dwStreamIndex The zero-based index of a stream to query, or <b>MF_SINK_WRITER_MEDIASINK</b> to query the media sink itself.
     * @param {Pointer<Guid>} guidService A service identifier GUID, or <b>GUID_NULL</b>.  If the value is <b>GUID_NULL</b>, the method calls <b>QueryInterface</b> to get the requested interface. Otherwise, the method calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a>. For a list of service identifiers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/service-interfaces">Service Interfaces</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-getserviceforstream
     */
    GetServiceForStream(dwStreamIndex, guidService, riid) {
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Gets statistics about the performance of the sink writer.
     * @param {Integer} dwStreamIndex The zero-based index of a stream to query, or <b>MF_SINK_WRITER_ALL_STREAMS </b> to query the media sink itself.
     * @returns {MF_SINK_WRITER_STATISTICS} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/ns-mfreadwrite-mf_sink_writer_statistics">MF_SINK_WRITER_STATISTICS</a> structure. Before calling the method, set the <b>cb</b> member to the size of the structure in bytes. The method fills the structure with statistics from the sink writer.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsinkwriter-getstatistics
     */
    GetStatistics(dwStreamIndex) {
        pStats := MF_SINK_WRITER_STATISTICS()
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pStats, "HRESULT")
        return pStats
    }
}

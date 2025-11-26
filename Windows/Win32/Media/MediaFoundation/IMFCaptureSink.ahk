#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls a capture sink, which is an object that receives one or more streams from a capture device.
 * @remarks
 * 
 * The capture engine creates the following capture sinks.
 * 
 * <ul>
 * <li>Photo sink. Encodes still image files.</li>
 * <li>Preview sink. Previews live audio or video.</li>
 * <li>Recording sink. Creates compressed audio/video files or compressed audio/video streams.</li>
 * </ul>
 * To get a pointer to a capture sink, call <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcaptureengine-getsink">IMFCaptureEngine::GetSink</a>. Each capture sink implements an interface that derives from <b>IMFCaptureSink</b>. Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> to get a pointer to the derived interface.<table>
 * <tr>
 * <th>Sink</th>
 * <th>Interface</th>
 * </tr>
 * <tr>
 * <td>Photo sink</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturephotosink">IMFCapturePhotoSink</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Preview sink</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturepreviewsink">IMFCapturePreviewSink</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Recording sink</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nn-mfcaptureengine-imfcapturerecordsink">IMFCaptureRecordSink</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * Applications cannot directly create the capture sinks.
 * 
 * If an image stream native media type is set to JPEG, the photo sink should be configured with a format identical to native source format. JPEG native type is passthrough only.
 * 
 * If an image stream native type is set to JPEG, to add an effect, change the native type on the image stream to an uncompressed video media type (such as NV12 or RGB32) and then add the effect.
 * 
 * If the native type is H.264 for the record stream, the record sink should be configured with the same media type. H.264 native type is passthrough only and cannot be decoded.
 * 
 * Record streams that expose H.264 do not  expose any other type. H.264 record streams cannot be used in conjunction with effects. To add effects, instead connect the preview stream to the recordsink using <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream">AddStream</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nn-mfcaptureengine-imfcapturesink
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCaptureSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCaptureSink
     * @type {Guid}
     */
    static IID => Guid("{72d6135b-35e9-412c-b926-fd5265f2a885}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOutputMediaType", "GetService", "AddStream", "Prepare", "RemoveAllStreams"]

    /**
     * Gets the output format for a stream on this capture sink.
     * @param {Integer} dwSinkStreamIndex The zero-based index of the stream to query. The index is returned in the <i>pdwSinkStreamIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream">IMFCaptureSink::AddStream</a> method.
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the pointer.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturesink-getoutputmediatype
     */
    GetOutputMediaType(dwSinkStreamIndex) {
        result := ComCall(3, this, "uint", dwSinkStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Queries the underlying Sink Writer object for an interface.
     * @param {Integer} dwSinkStreamIndex The zero-based index of the stream to query. The index is returned in the <i>pdwSinkStreamIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream">IMFCaptureSink::AddStream</a> method.
     * @param {Pointer<Guid>} rguidService A service identifier GUID. Currently, the value must be <b>GUID_NULL</b>.
     * @param {Pointer<Guid>} riid A service identifier GUID. Currently, the value must be <b>IID_IMFSinkWriter</b>.
     * @returns {IUnknown} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturesink-getservice
     */
    GetService(dwSinkStreamIndex, rguidService, riid) {
        result := ComCall(4, this, "uint", dwSinkStreamIndex, "ptr", rguidService, "ptr", riid, "ptr*", &ppUnknown := 0, "HRESULT")
        return IUnknown(ppUnknown)
    }

    /**
     * Connects a stream from the capture source to this capture sink.
     * @param {Integer} dwSourceStreamIndex The source stream to connect. The value can be any of the following.
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
     * @param {IMFMediaType} pMediaType An <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> pointer that specifies the desired format of the output stream. The details of the format will depend on the capture sink.
     * 
     * <ul>
     * <li>Photo sink: A still image format compatible with <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-lh">Windows Imaging Component</a> (WIC).</li>
     * <li>Preview sink: An uncompressed audio or video format.</li>
     * <li>Record sink: The audio or video format that will be written to the output file.</li>
     * </ul>
     * @param {IMFAttributes} pAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. For compressed streams, you can use this parameter to configure the encoder. This parameter can also be <b>NULL</b>.
     * 
     * For the preview sink, set this parameter to <b>NULL</b>.
     * @returns {Integer} Receives the index of the new stream on the capture sink. Note that this index will not necessarily match the value of <i>dwSourceStreamIndex</i>.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturesink-addstream
     */
    AddStream(dwSourceStreamIndex, pMediaType, pAttributes) {
        result := ComCall(5, this, "uint", dwSourceStreamIndex, "ptr", pMediaType, "ptr", pAttributes, "uint*", &pdwSinkStreamIndex := 0, "HRESULT")
        return pdwSinkStreamIndex
    }

    /**
     * Prepares the capture sink by loading any required pipeline components, such as encoders, video processors, and media sinks.
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
     * Invalid request.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturesink-prepare
     */
    Prepare() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Removes all streams from the capture sink.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfcaptureengine/nf-mfcaptureengine-imfcapturesink-removeallstreams
     */
    RemoveAllStreams() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}

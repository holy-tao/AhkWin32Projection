#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSourceReader.ahk

/**
 * Extends the IMFSourceReader interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nn-mfreadwrite-imfsourcereaderex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceReaderEx extends IMFSourceReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceReaderEx
     * @type {Guid}
     */
    static IID => Guid("{7b981cf0-560e-4116-9875-b099895f23d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNativeMediaType", "AddTransformForStream", "RemoveAllTransformsForStream", "GetTransformForStream"]

    /**
     * Sets the native media type for a stream on the media source.
     * @remarks
     * This method sets the output type that is produced by the media source. Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype">IMFSourceReader::SetCurrentMediaType</a> method, this method does not insert any decoders, video processors, or other transforms. The media source must support the specified media type natively. To get a list of supported types from the media source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getnativemediatype">IMFSourceReader::GetNativeMediaType</a>.
     * 
     * In asynchronous mode, this method fails if a sample request is pending. In that case, wait for the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onreadsample">OnReadSample</a> callback to be invoked before calling the method. For more information about using the Source Reader in asynchronous mode, see <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample">IMFSourceReader::ReadSample</a>.
     * 
     * This method can trigger a change in the output format for the stream. If so, the <b>MF_SOURCE_READERF_CURRENTMEDIATYPECHANGED</b> flag is returned in the  <i>pdwStreamFlags</i> parameter. The method might also cause the Source Reader to remove any effects that were added by the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-addtransformforstream">IMFSourceReaderEx::AddTransformForStream</a> method. If this occurs, the  <b>MF_SOURCE_READERF_ALLEFFECTSREMOVED</b> flag is returned in <i>pdwStreamFlags</i>. 
     * 
     * This method is useful with audio and video capture devices, because a device might support several output formats. This method enables the application to choose the device format before decoders and other transforms are added.
     * @param {Integer} dwStreamIndex 
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READERF_ALLEFFECTSREMOVED"></a><a id="mf_source_readerf_alleffectsremoved"></a><dl>
     * <dt><b>MF_SOURCE_READERF_ALLEFFECTSREMOVED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All effects were removed from the stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READERF_CURRENTMEDIATYPECHANGED"></a><a id="mf_source_readerf_currentmediatypechanged"></a><dl>
     * <dt><b>MF_SOURCE_READERF_CURRENTMEDIATYPECHANGED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current output type changed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-setnativemediatype
     */
    SetNativeMediaType(dwStreamIndex, pMediaType) {
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pMediaType, "uint*", &pdwStreamFlags := 0, "HRESULT")
        return pdwStreamFlags
    }

    /**
     * Adds a transform, such as an audio or video effect, to a stream.
     * @remarks
     * This method attempts to add the transform at the end of the current processing chain. 
     * 
     * To use this method, make the following sequence of calls:
     * 
     * <ol>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype">IMFSourceReader::SetCurrentMediaType</a> to set the output type that you want for the stream. In this step, you can specify a media type that contains only the major type and subtype GUIDs. For example, to get 32-bit RGB output, set a major type of <b>MFMediaType_Video</b> and a subtype of <b>MFVideoFormat_RGB32</b>. (For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Media Type GUIDs</a>.)</li>
     * <li>Call <b>AddTransformForStream</b>. If the Source Reader successfully connects the transform, it sets the output type on the transform.</li>
     * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getcurrentmediatype">IMFSourceReader::GetCurrentMediaType</a> to get the output type from the transform. This method returns a media type with a complete format description.</li>
     * <li>Optionally, if you want to modify the output type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype">IMFSourceReader::SetCurrentMediaType</a> again to set a complete media type on the transform.</li>
     * </ol>
     * The <b>AddTransformForStream</b> method will not insert a decoder into the processing chain. If the native stream format is encoded, and the transform requires an uncompressed format, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype">SetCurrentMediaType</a> to set the uncompressed format (step 1 in the previous list). However, the method will insert a video processor to convert between RGB and YUV formats, if required.
     * 
     * The method fails if the source reader was configured with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-readwrite-disable-converters">MF_READWRITE_DISABLE_CONVERTERS</a> or <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-enable-video-processing">MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING</a> attributes. 
     * 
     * In asynchronous mode, the method also fails if a sample request is pending. In that case, wait for the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onreadsample">OnReadSample</a> callback to be invoked before calling the method. For more information about using the Source Reader in asynchronous mode, see <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample">IMFSourceReader::ReadSample</a>.
     * 
     * You can add a transform at any time during streaming. However, the method does not flush or drain the pipeline before inserting the transform. Therefore, if data is already in the pipeline, the next sample is not guaranteed to have the transform applied.
     * @param {Integer} dwStreamIndex The stream to configure. The value can be any of the following.
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
     * The zero-based index of a stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_FIRST_VIDEO_STREAM"></a><a id="mf_source_reader_first_video_stream"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_FIRST_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_FIRST_AUDIO_STREAM"></a><a id="mf_source_reader_first_audio_stream"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_FIRST_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {IUnknown} pTransformOrActivate A pointer to one of the following:
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
     * The transform does not support the current stream format, and no conversion was possible. See Remarks for more information.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-addtransformforstream
     */
    AddTransformForStream(dwStreamIndex, pTransformOrActivate) {
        result := ComCall(14, this, "uint", dwStreamIndex, "ptr", pTransformOrActivate, "HRESULT")
        return result
    }

    /**
     * Removes all of the Media Foundation transforms (MFTs) for a specified stream, with the exception of the decoder.
     * @remarks
     * Calling this method can reset the current output type for the stream. To get the new output type, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getcurrentmediatype">IMFSourceReader::GetCurrentMediaType</a>.
     * 
     * In asynchronous mode, this method fails if a sample request is pending. In that case, wait for the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onreadsample">OnReadSample</a> callback to be invoked before calling the method. For more information about using the Source Reader in asynchronous mode, see <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample">IMFSourceReader::ReadSample</a>.
     * @param {Integer} dwStreamIndex The stream for which to remove the MFTs. The value can be any of the following.
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
     * The zero-based index of a stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_FIRST_VIDEO_STREAM"></a><a id="mf_source_reader_first_video_stream"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_FIRST_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_FIRST_AUDIO_STREAM"></a><a id="mf_source_reader_first_audio_stream"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_FIRST_AUDIO_STREAM</b></b></dt>
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
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid request.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-removealltransformsforstream
     */
    RemoveAllTransformsForStream(dwStreamIndex) {
        result := ComCall(15, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to a Media Foundation transform (MFT) for a specified stream. (IMFSourceReaderEx.GetTransformForStream)
     * @remarks
     * You can use this method to configure an MFT after it is inserted into the processing chain. Do not use the pointer returned in <i>ppTransform</i> to set media types on the MFT or to process data. In particular, calling any of the following <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> methods could have unexpected results.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-addinputstreams">AddInputStreams</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-deleteinputstream">DeleteInputStream</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processevent">ProcessEvent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">ProcessInput</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processmessage">ProcessMessage</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setinputtype">SetInputType</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setoutputtype">SetOutputType</a>
     * </li>
     * </ul>
     * If a decoder is present, it appears at index position zero.
     * 
     * To avoid losing any data, you should drain the source reader before calling this method. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/processing-media-data-with-the-source-reader">Draining the Data Pipeline</a>.
     * @param {Integer} dwStreamIndex The stream to query for the MFT. The value can be any of the following.
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
     * The zero-based index of a stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_FIRST_VIDEO_STREAM"></a><a id="mf_source_reader_first_video_stream"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_FIRST_VIDEO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first video stream.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_FIRST_AUDIO_STREAM"></a><a id="mf_source_reader_first_audio_stream"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_FIRST_AUDIO_STREAM</b></b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The first audio stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwTransformIndex The zero-based index of the MFT to retrieve.
     * @param {Pointer<Guid>} pGuidCategory Receives a GUID that specifies the category of the MFT. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-category">MFT_CATEGORY</a>.
     * @param {Pointer<IMFTransform>} ppTransform Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a> interface of the MFT. The caller must release the interface.
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
     * <dt><b>MF_E_INVALIDINDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>dwTransformIndex</i> parameter is out of range.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereaderex-gettransformforstream
     */
    GetTransformForStream(dwStreamIndex, dwTransformIndex, pGuidCategory, ppTransform) {
        result := ComCall(16, this, "uint", dwStreamIndex, "uint", dwTransformIndex, "ptr", pGuidCategory, "ptr*", ppTransform, "HRESULT")
        return result
    }
}

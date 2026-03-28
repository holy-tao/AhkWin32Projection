#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Microsoft Media Foundation source reader object.
 * @remarks
 * To create the source reader, call one of the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrombytestream">MFCreateSourceReaderFromByteStream</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfrommediasource">MFCreateSourceReaderFromMediaSource</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-mfcreatesourcereaderfromurl">MFCreateSourceReaderFromURL</a>
 * </li>
 * </ul>
 * Alternatively, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfreadwriteclassfactory">IMFReadWriteClassFactory</a> interface.
 * 
 * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
 * 
 * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereaderex">IMFSourceReaderEx</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nn-mfreadwrite-imfsourcereader
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSourceReader
     * @type {Guid}
     */
    static IID => Guid("{70ae66f2-c809-4e4f-8915-bdcb406b7993}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamSelection", "SetStreamSelection", "GetNativeMediaType", "GetCurrentMediaType", "SetCurrentMediaType", "SetCurrentPosition", "ReadSample", "Flush", "GetServiceForStream", "GetPresentationAttribute"]

    /**
     * Queries whether a stream is selected.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The stream to query. The value can be any of the following.
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
     * @returns {BOOL} Receives <b>TRUE</b> if the stream is selected and will generate data. Receives <b>FALSE</b> if the stream is not selected and will not generate data.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(3, this, "uint", dwStreamIndex, "int*", &pfSelected := 0, "HRESULT")
        return pfSelected
    }

    /**
     * Selects or deselects one or more streams.
     * @remarks
     * There are two common uses for this method:
     * 
     * <ul>
     * <li>To change the default stream selection. Some media files contain multiple streams of the same type. For example, a file might include audio streams for multiple languages. You can use this method to change which of the streams is selected. To get information about each stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getpresentationattribute">IMFSourceReader::GetPresentationAttribute</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getnativemediatype">IMFSourceReader::GetNativeMediaType</a>.</li>
     * <li>If you will not need data from one of the streams, it is a good idea to deselect that stream. If the stream is selected, the media source might hold onto a queue of unread data, and the queue might grow indefinitely, consuming memory. </li>
     * </ul>
     * For an example of deselecting a stream, see <a href="https://docs.microsoft.com/windows/desktop/medfound/tutorial--decoding-audio">Tutorial: Decoding Audio</a>.
     * 
     * If a stream is deselected, the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample">IMFSourceReader::ReadSample</a> method returns <b>MF_E_INVALIDREQUEST</b> for that stream. Other <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nn-mfreadwrite-imfsourcereader">IMFSourceReader</a> methods are valid for deselected streams.
     * 
     * Stream selection does not affect how the source reader loads or unloads decoders in memory. In particular, deselecting a stream does not force the source reader to unload the decoder for that stream.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The stream to set. The value can be any of the following.
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
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_ALL_STREAMS"></a><a id="mf_source_reader_all_streams"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_ALL_STREAMS</b></b></dt>
     * <dt>0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All streams.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} fSelected Specify <b>TRUE</b> to select streams or <b>FALSE</b> to deselect streams. If a stream is deselected, it will not generate data.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, fSelected) {
        result := ComCall(4, this, "uint", dwStreamIndex, "int", fSelected, "HRESULT")
        return result
    }

    /**
     * Gets a format that is supported natively by the media source.
     * @remarks
     * This method queries the underlying media source for its native output format. Potentially, each source stream can produce more than one output format. Use the <i>dwMediaTypeIndex</i> parameter to loop through the available formats. Generally, file sources offer just one format per stream, but capture devices might offer several formats.
     * 
     *  The method returns a copy of the media type, so it is safe to modify the object received in the <i> ppMediaType</i> parameter.
     * 
     * To set  the output type for a stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype">IMFSourceReader::SetCurrentMediaType</a> method.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex Specifies which stream to query. The value can be any of the following.
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
     * @param {Integer} dwMediaTypeIndex Specifies which media type to query. The value can be any of the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0–0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The zero-based index of a media type
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_CURRENT_TYPE_INDEX"></a><a id="mf_source_reader_current_type_index"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_CURRENT_TYPE_INDEX</b></b></dt>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current native media type.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getnativemediatype
     */
    GetNativeMediaType(dwStreamIndex, dwMediaTypeIndex) {
        result := ComCall(5, this, "uint", dwStreamIndex, "uint", dwMediaTypeIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Gets the current media type for a stream.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The stream to query. The value can be any of the following.
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
     * @returns {IMFMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getcurrentmediatype
     */
    GetCurrentMediaType(dwStreamIndex) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Sets the media type for a stream.
     * @remarks
     * For each stream, you can set the media type to any of the following:
     * 
     * <ul>
     * <li>One of the native types offered by the media source. To enumerate the native types, call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getnativemediatype">IMFSourceReader::GetNativeMediaType</a>.</li>
     * <li>If the native media type is compressed, you can specify a corresponding uncompressed format. The Source Reader will search for a decoder that can decode from the native format to the specified uncompressed format.</li>
     * </ul>
     * Audio resampling support was added to the source reader with Windows 8.  In versions of Windows prior to  Windows 8, the source reader does not support audio resampling. If you need to resample the audio in versions of Windows earlier than Windows 8, you can use the <a href="https://docs.microsoft.com/windows/desktop/medfound/audioresampler">Audio Resampler DSP</a>.
     * 
     * If you set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-enable-video-processing">MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING</a> attribute to <b>TRUE</b> when you create the Source Reader, the Source Reader will convert YUV video to RGB-32. This conversion is not optimized for real-time video playback.
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
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
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of the media type.
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
     * At least one decoder was found for the native stream type, but the type specified by <i>pMediaType</i> was rejected.
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
     * One or more sample requests are still pending.
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
     * Could not find a decoder for the native stream type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype
     */
    SetCurrentMediaType(dwStreamIndex, pMediaType) {
        static pdwReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(7, this, "uint", dwStreamIndex, "uint*", pdwReserved, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * Seeks to a new position in the media source.
     * @remarks
     * The <b>SetCurrentPosition</b> method does not guarantee exact seeking. The accuracy of the seek depends on the media content. If the media content contains a video stream, the <b>SetCurrentPosition</b> method typically seeks to the nearest key frame before the desired position. The distance between key frames depends on several factors, including the encoder implementation, the video content, and the particular encoding settings used to encode the content. The distance between key frame can vary within a single video file (for example, depending on scene complexity).
     * 
     * After seeking, the application should call <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample">IMFSourceReader::ReadSample</a> and advance to the desired position. 
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Pointer<Guid>} guidTimeFormat A GUID that specifies the <i>time format</i>. The time format defines the units for the <i>varPosition</i> parameter. The following value is defined for all media sources:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_NULL"></a><a id="guid_null"></a><dl>
     * <dt><b>GUID_NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 100-nanosecond units.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Some media sources might support additional values.
     * @param {Pointer<PROPVARIANT>} varPosition The position from which playback will be started. The units are specified by the <i>guidTimeFormat</i> parameter. If the <i>guidTimeFormat</i> parameter is <b>GUID_NULL</b>, set the variant type to <b>VT_I8</b>.
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
     * One or more sample requests are still pending.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentposition
     */
    SetCurrentPosition(guidTimeFormat, varPosition) {
        result := ComCall(8, this, "ptr", guidTimeFormat, "ptr", varPosition, "HRESULT")
        return result
    }

    /**
     * Reads the next sample from the media source.
     * @remarks
     * If the requested stream is not selected, the return code is <b>MF_E_INVALIDREQUEST</b>. See <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setstreamselection">IMFSourceReader::SetStreamSelection</a>.
     * 
     *  This method can complete synchronously or asynchronously. If you provide a callback pointer when you create the source reader, the method is asynchronous. Otherwise, the method is synchronous. For more information about setting the callback pointer, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-async-callback">MF_SOURCE_READER_ASYNC_CALLBACK</a>.
     * 
     * <h3><a id="Asynchronous_Mode"></a><a id="asynchronous_mode"></a><a id="ASYNCHRONOUS_MODE"></a>Asynchronous Mode</h3>
     * In asynchronous mode:
     * 
     * <ul>
     * <li>All of the <c>[out]</c> parameters must be <b>NULL</b>. Otherwise, the method returns <b>E_INVALIDARG</b>.</li>
     * <li>The method returns immediately.</li>
     * <li>When the operation completes, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onreadsample">IMFSourceReaderCallback::OnReadSample</a> method is called.</li>
     * <li>If an error occurs, the method can fail either synchronously or asynchronously. Check the return value of <b>ReadSample</b>, and also check the <i>hrStatus</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onreadsample">IMFSourceReaderCallback::OnReadSample</a>.</li>
     * </ul>
     * <h3><a id="Synchronous_Mode"></a><a id="synchronous_mode"></a><a id="SYNCHRONOUS_MODE"></a>Synchronous Mode</h3>
     * In synchronous mode:
     * 
     * <ul>
     * <li>The <i>pdwStreamFlags</i> and <i>ppSample</i> parameters cannot be <b>NULL</b>. Otherwise, the method returns <b>E_POINTER</b>.</li>
     * <li>The <i>pdwActualStreamIndex</i> and <i>pllTimestamp</i> parameters can be <b>NULL</b>.</li>
     * <li>The method blocks until the next sample is available.</li>
     * </ul>
     * In synchronous mode, if the <i>dwStreamIndex</i> parameter is <b>MF_SOURCE_READER_ANY_STREAM</b>, you should pass a non-<b>NULL</b> value for <i>pdwActualStreamIndex</i>, so that you know which stream delivered the sample.
     * 
     * This method can return flags in the <i>pdwStreamFlags</i> parameter without returning a media sample in <i>ppSample</i>. Therefore, the <i>ppSample</i> parameter can receive a <b>NULL</b> pointer even when the method succeeds. For example, when the source reader reaches the end of the stream, it returns the <b>MF_SOURCE_READERF_ENDOFSTREAM</b> flag in <i>pdwStreamFlags</i> and sets <i>ppSample</i> to <b>NULL</b>.
     * 
     * If there is a gap in the stream, <i>pdwStreamFlags</i> receives the MF_SOURCE_READERF_STREAMTICK flag, <i>ppSample</i> is <b>NULL</b>, and <i>pllTimestamp</i> indicates the time when the gap occurred. 
     * 
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The stream to pull data from. The value can be any of the following.
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
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_ANY_STREAM"></a><a id="mf_source_reader_any_stream"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_ANY_STREAM</b></b></dt>
     * <dt>0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Get the next available sample, regardless of which stream.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwControlFlags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/ne-mfreadwrite-mf_source_reader_control_flag">MF_SOURCE_READER_CONTROL_FLAG</a> enumeration.
     * @param {Pointer<Integer>} pdwActualStreamIndex Receives the zero-based index of the stream.
     * @param {Pointer<Integer>} pdwStreamFlags Receives a bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/ne-mfreadwrite-mf_source_reader_flag">MF_SOURCE_READER_FLAG</a> enumeration.
     * @param {Pointer<Integer>} pllTimestamp Receives the time stamp of the sample, or the time of the stream event indicated in <i>pdwStreamFlags</i>. The time is given in 100-nanosecond units.
     * @param {Pointer<IMFSample>} ppSample Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface or the value <b>NULL</b> (see Remarks). If this parameter receives a non-<b>NULL</b> pointer, the caller must release the interface.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>MF_E_NOTACCEPTING</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A flush operation is pending. See <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-flush">IMFSourceReader::Flush</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>E_INVALIDARG</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument. See Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample
     */
    ReadSample(dwStreamIndex, dwControlFlags, pdwActualStreamIndex, pdwStreamFlags, pllTimestamp, ppSample) {
        pdwActualStreamIndexMarshal := pdwActualStreamIndex is VarRef ? "uint*" : "ptr"
        pdwStreamFlagsMarshal := pdwStreamFlags is VarRef ? "uint*" : "ptr"
        pllTimestampMarshal := pllTimestamp is VarRef ? "int64*" : "ptr"

        result := ComCall(9, this, "uint", dwStreamIndex, "uint", dwControlFlags, pdwActualStreamIndexMarshal, pdwActualStreamIndex, pdwStreamFlagsMarshal, pdwStreamFlags, pllTimestampMarshal, pllTimestamp, "ptr*", ppSample, "HRESULT")
        return result
    }

    /**
     * Flushes one or more streams. (IMFSourceReader.Flush)
     * @remarks
     * The <b>Flush</b> method discards all queued samples and cancels all pending sample requests.
     * 
     * This method can complete either synchronously or asynchronously.
     * 
     * If you provide a callback pointer when you create the source reader, the method is asynchronous. Otherwise, the method is synchronous. For more information about the setting the callback pointer, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-async-callback">MF_SOURCE_READER_ASYNC_CALLBACK</a>.
     * 
     * In synchronous mode, the method blocks until the operation is complete.
     * 
     * In asynchronous mode, the application's <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onflush">IMFSourceReaderCallback::OnFlush</a> method is called when the flush operation completes. While a flush operation is pending, the <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample">IMFSourceReader::ReadSample</a> method returns <b>MF_E_NOTACCEPTING</b>.
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, there was a bug in the implementation of this method, which causes <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereadercallback-onflush">OnFlush</a> to be called before the flush operation completes. A hotfix used to be available that fixed that bug.</div>
     * <div> </div>
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The stream to flush. The value can be any of the following.
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
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_ALL_STREAMS"></a><a id="mf_source_reader_all_streams"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_ALL_STREAMS</b></b></dt>
     * <dt>0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All streams.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-flush
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Queries the underlying media source or decoder for an interface.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The stream or object to query. If the value is <b>MF_SOURCE_READER_MEDIASOURCE</b>, the method queries the media source. Otherwise, it queries the decoder that is associated with the specified stream. The following values are possible.
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
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_MEDIASOURCE"></a><a id="mf_source_reader_mediasource"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_MEDIASOURCE</b></b></dt>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} guidService A service identifier GUID.  If the value is <b>GUID_NULL</b>, the method calls <b>QueryInterface</b> to get the requested interface. Otherwise, the method calls the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfgetservice-getservice">IMFGetService::GetService</a> method. For a list of service identifiers, see <a href="https://docs.microsoft.com/windows/desktop/medfound/service-interfaces">Service Interfaces</a>.
     * @param {Pointer<Guid>} riid The interface identifier (IID) of the interface being requested.
     * @returns {Pointer<Void>} Receives a pointer to the requested interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getserviceforstream
     */
    GetServiceForStream(dwStreamIndex, guidService, riid) {
        result := ComCall(11, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Gets an attribute from the underlying media source.
     * @remarks
     * This interface is available on Windows Vista if Platform Update Supplement for Windows Vista is installed.
     * @param {Integer} dwStreamIndex The stream or object to query. The value can be any of the following.
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
     * <tr>
     * <td width="40%"><a id="MF_SOURCE_READER_MEDIASOURCE"></a><a id="mf_source_reader_mediasource"></a><dl>
     * <dt><b><b>MF_SOURCE_READER_MEDIASOURCE</b></b></dt>
     * <dt>0xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The media source.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} _guidAttribute 
     * @returns {PROPVARIANT} A pointer to a <b>PROPVARIANT</b> that receives the value of the attribute. Call the <b>PropVariantClear</b> function to free the <b>PROPVARIANT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getpresentationattribute
     */
    GetPresentationAttribute(dwStreamIndex, _guidAttribute) {
        pvarAttribute := PROPVARIANT()
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", _guidAttribute, "ptr", pvarAttribute, "HRESULT")
        return pvarAttribute
    }
}

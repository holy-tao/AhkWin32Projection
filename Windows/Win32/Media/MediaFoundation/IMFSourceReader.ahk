#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the Microsoft Media Foundation source reader object.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsourcereader
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(3, this, "uint", dwStreamIndex, "int*", &pfSelected := 0, "HRESULT")
        return pfSelected
    }

    /**
     * Selects or deselects one or more streams.
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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, fSelected) {
        result := ComCall(4, this, "uint", dwStreamIndex, "int", fSelected, "HRESULT")
        return result
    }

    /**
     * Gets a format that is supported natively by the media source.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-getnativemediatype
     */
    GetNativeMediaType(dwStreamIndex, dwMediaTypeIndex) {
        result := ComCall(5, this, "uint", dwStreamIndex, "uint", dwMediaTypeIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Gets the current media type for a stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-getcurrentmediatype
     */
    GetCurrentMediaType(dwStreamIndex) {
        result := ComCall(6, this, "uint", dwStreamIndex, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFMediaType(ppMediaType)
    }

    /**
     * Sets the media type for a stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype
     */
    SetCurrentMediaType(dwStreamIndex, pMediaType) {
        static pdwReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(7, this, "uint", dwStreamIndex, "uint*", pdwReserved, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * Seeks to a new position in the media source.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentposition
     */
    SetCurrentPosition(guidTimeFormat, varPosition) {
        result := ComCall(8, this, "ptr", guidTimeFormat, "ptr", varPosition, "HRESULT")
        return result
    }

    /**
     * Reads the next sample from the media source.
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
     * A flush operation is pending. See <a href="/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-flush">IMFSourceReader::Flush</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-readsample
     */
    ReadSample(dwStreamIndex, dwControlFlags, pdwActualStreamIndex, pdwStreamFlags, pllTimestamp, ppSample) {
        pdwActualStreamIndexMarshal := pdwActualStreamIndex is VarRef ? "uint*" : "ptr"
        pdwStreamFlagsMarshal := pdwStreamFlags is VarRef ? "uint*" : "ptr"
        pllTimestampMarshal := pllTimestamp is VarRef ? "int64*" : "ptr"

        result := ComCall(9, this, "uint", dwStreamIndex, "uint", dwControlFlags, pdwActualStreamIndexMarshal, pdwActualStreamIndex, pdwStreamFlagsMarshal, pdwStreamFlags, pllTimestampMarshal, pllTimestamp, "ptr*", ppSample, "HRESULT")
        return result
    }

    /**
     * Flushes one or more streams.
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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-flush
     */
    Flush(dwStreamIndex) {
        result := ComCall(10, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Queries the underlying media source or decoder for an interface.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-getserviceforstream
     */
    GetServiceForStream(dwStreamIndex, guidService, riid) {
        result := ComCall(11, this, "uint", dwStreamIndex, "ptr", guidService, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * Gets an attribute from the underlying media source.
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
     * @param {Pointer<Guid>} guidAttribute A GUID that identifies the attribute to retrieve. If the <i>dwStreamIndex</i> parameter equals  <b>MF_SOURCE_READER_MEDIASOURCE</b>, <i>guidAttribute</i> can specify one of the following:
     * 
     * <ul>
     * <li>A presentation descriptor attribute. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/presentation-descriptor-attributes">Presentation Descriptor Attributes</a>.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-source-reader-mediasource-characteristics">MF_SOURCE_READER_MEDIASOURCE_CHARACTERISTICS</a>. Use this value to get characteristics flags from the media source.</li>
     * </ul>
     * Otherwise, if the <i>dwStreamIndex</i> parameter specifies a stream, <i>guidAttribute</i> specifies a stream descriptor attribute. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/stream-descriptor-attributes">Stream Descriptor Attributes</a>.
     * @returns {PROPVARIANT} A pointer to a <b>PROPVARIANT</b> that receives the value of the attribute. Call the <b>PropVariantClear</b> function to free the <b>PROPVARIANT</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereader-getpresentationattribute
     */
    GetPresentationAttribute(dwStreamIndex, guidAttribute) {
        pvarAttribute := PROPVARIANT()
        result := ComCall(12, this, "uint", dwStreamIndex, "ptr", guidAttribute, "ptr", pvarAttribute, "HRESULT")
        return pvarAttribute
    }
}

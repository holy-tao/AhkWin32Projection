#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFSourceReader.ahk

/**
 * Extends the IMFSourceReader interface.
 * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nn-mfreadwrite-imfsourcereaderex
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereaderex-setnativemediatype
     */
    SetNativeMediaType(dwStreamIndex, pMediaType) {
        result := ComCall(13, this, "uint", dwStreamIndex, "ptr", pMediaType, "uint*", &pdwStreamFlags := 0, "HRESULT")
        return pdwStreamFlags
    }

    /**
     * Adds a transform, such as an audio or video effect, to a stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereaderex-addtransformforstream
     */
    AddTransformForStream(dwStreamIndex, pTransformOrActivate) {
        result := ComCall(14, this, "uint", dwStreamIndex, "ptr", pTransformOrActivate, "HRESULT")
        return result
    }

    /**
     * Removes all of the Media Foundation transforms (MFTs) for a specified stream, with the exception of the decoder.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereaderex-removealltransformsforstream
     */
    RemoveAllTransformsForStream(dwStreamIndex) {
        result := ComCall(15, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to a Media Foundation transform (MFT) for a specified stream.
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
     * @param {Integer} dwTransformIndex The zero-based index of the MFT to retreive.
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
     * @see https://docs.microsoft.com/windows/win32/api//mfreadwrite/nf-mfreadwrite-imfsourcereaderex-gettransformforstream
     */
    GetTransformForStream(dwStreamIndex, dwTransformIndex, pGuidCategory, ppTransform) {
        result := ComCall(16, this, "uint", dwStreamIndex, "uint", dwTransformIndex, "ptr", pGuidCategory, "ptr*", ppTransform, "HRESULT")
        return result
    }
}

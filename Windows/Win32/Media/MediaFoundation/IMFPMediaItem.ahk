#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPMediaPlayer.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk

/**
 * Represents a media item. (Deprecated.).
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/nn-mfplay-imfpmediaitem
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMediaItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPMediaItem
     * @type {Guid}
     */
    static IID => Guid("{90eb3e6b-ecbf-45cc-b1da-c6fe3ea70d57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaPlayer", "GetURL", "GetObject", "GetUserData", "SetUserData", "GetStartStopPosition", "SetStartStopPosition", "HasVideo", "HasAudio", "IsProtected", "GetDuration", "GetNumberOfStreams", "GetStreamSelection", "SetStreamSelection", "GetStreamAttribute", "GetPresentationAttribute", "GetCharacteristics", "SetStreamSink", "GetMetadata"]

    /**
     * Gets a pointer to the MFPlay player object that created the media item.
     * @returns {IMFPMediaPlayer} Receives a pointer to the player object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getmediaplayer
     */
    GetMediaPlayer() {
        result := ComCall(3, this, "ptr*", &ppMediaPlayer := 0, "HRESULT")
        return IMFPMediaPlayer(ppMediaPlayer)
    }

    /**
     * Gets the URL that was used to create the media item.
     * @returns {PWSTR} Receives a pointer to a null-terminated string that contains the URL. The caller must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-geturl
     */
    GetURL() {
        result := ComCall(4, this, "ptr*", &ppwszURL := 0, "HRESULT")
        return ppwszURL
    }

    /**
     * Gets the object that was used to create the media item.
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getobject
     */
    GetObject() {
        result := ComCall(5, this, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    /**
     * Gets the application-defined value stored in the media item.
     * @returns {Pointer} Receives the application-defined value for the media item.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getuserdata
     */
    GetUserData() {
        result := ComCall(6, this, "ptr*", &pdwUserData := 0, "HRESULT")
        return pdwUserData
    }

    /**
     * Stores an application-defined value in the media item.
     * @param {Pointer} dwUserData The application-defined value.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-setuserdata
     */
    SetUserData(dwUserData) {
        result := ComCall(7, this, "ptr", dwUserData, "HRESULT")
        return result
    }

    /**
     * Gets the start and stop times for the media item.
     * @param {Pointer<Guid>} pguidStartPositionType Receives the unit of time for the start position. See Remarks. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvStartValue Receives the start position. The meaning and data type of this parameter are indicated by the <i>pguidStartPositionType</i> parameter. The  <i>pvStartValue</i> parameter must be <b>NULL</b> if <i>pguidStartPositionType</i> is <b>NULL</b>, and cannot be <b>NULL</b> otherwise.
     * @param {Pointer<Guid>} pguidStopPositionType Receives the unit of time for the stop position. See Remarks. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvStopValue Stop position. The meaning and data type of this parameter are indicated by the <i>pguidStopPositionType</i> parameter. The <i>pvStopValue</i>  parameter must be <b>NULL</b> if <i>pguidStopPositionType</i> is <b>NULL</b>, and cannot be <b>NULL</b> otherwise.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getstartstopposition
     */
    GetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(8, this, "ptr", pguidStartPositionType, "ptr", pvStartValue, "ptr", pguidStopPositionType, "ptr", pvStopValue, "HRESULT")
        return result
    }

    /**
     * Sets the start and stop time for the media item.
     * @param {Pointer<Guid>} pguidStartPositionType Unit of time for the start position. See Remarks. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvStartValue Start position. The meaning and data type of this parameter are indicated by the <i>pguidStartPositionType</i> parameter. The  <i>pvStartValue</i> parameter must be <b>NULL</b> if <i>pguidStartPositionType</i> is <b>NULL</b>, and cannot be <b>NULL</b> otherwise.
     * @param {Pointer<Guid>} pguidStopPositionType Unit of time for the stop position. See Remarks. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvStopValue Stop position. The meaning and data type of this parameter are indicated by the <i>pguidStopPositionType</i> parameter. The <i>pvStopValue</i>  parameter must be <b>NULL</b> if <i>pguidStopPositionType</i> is <b>NULL</b>, and cannot be <b>NULL</b> otherwise.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_OUT_OF_RANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid start or stop time. Any of the following can cause this error:
     * 
     * <ul>
     * <li>Time less than zero.</li>
     * <li>Time greater than the total duration of the media item.</li>
     * <li>Stop time less than start time.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-setstartstopposition
     */
    SetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(9, this, "ptr", pguidStartPositionType, "ptr", pvStartValue, "ptr", pguidStopPositionType, "ptr", pvStopValue, "HRESULT")
        return result
    }

    /**
     * Queries whether the media item contains a video stream.
     * @param {Pointer<BOOL>} pfHasVideo Receives the value <b>TRUE</b> if the media item contains at least one video stream, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pfSelected Receives the value <b>TRUE</b> if at least one video stream is selected, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-hasvideo
     */
    HasVideo(pfHasVideo, pfSelected) {
        pfHasVideoMarshal := pfHasVideo is VarRef ? "int*" : "ptr"
        pfSelectedMarshal := pfSelected is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pfHasVideoMarshal, pfHasVideo, pfSelectedMarshal, pfSelected, "HRESULT")
        return result
    }

    /**
     * Queries whether the media item contains an audio stream.
     * @param {Pointer<BOOL>} pfHasAudio Receives the value <b>TRUE</b> if the media item contains at least one audio stream, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pfSelected Receives the value <b>TRUE</b> if at least one audio stream is selected, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-hasaudio
     */
    HasAudio(pfHasAudio, pfSelected) {
        pfHasAudioMarshal := pfHasAudio is VarRef ? "int*" : "ptr"
        pfSelectedMarshal := pfSelected is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pfHasAudioMarshal, pfHasAudio, pfSelectedMarshal, pfSelected, "HRESULT")
        return result
    }

    /**
     * Queries whether the media item contains protected content.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-isprotected
     */
    IsProtected() {
        result := ComCall(12, this, "int*", &pfProtected := 0, "HRESULT")
        return pfProtected
    }

    /**
     * Gets the duration of the media item.
     * @param {Pointer<Guid>} guidPositionType Specifies the unit of time for the duration value. The following value is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MFP_POSITIONTYPE_100NS"></a><a id="mfp_positiontype_100ns"></a><dl>
     * <dt><b>MFP_POSITIONTYPE_100NS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 100-nanosecond units. 
     *                
     * 
     * The value returned in <i>pvDurationValue</i> is a <b>LARGE_INTEGER</b>.
     * 
     * <ul>
     * <li>Variant type (<b>vt</b>): VT_I8</li>
     * <li>Variant member: <b>hVal</b></li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the duration.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getduration
     */
    GetDuration(guidPositionType) {
        pvDurationValue := PROPVARIANT()
        result := ComCall(13, this, "ptr", guidPositionType, "ptr", pvDurationValue, "HRESULT")
        return pvDurationValue
    }

    /**
     * Gets the number of streams (audio, video, and other) in the media item.
     * @returns {Integer} Receives the number of streams.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(14, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * Queries whether a stream is selected to play.
     * @param {Integer} dwStreamIndex Zero-based index of the stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getnumberofstreams">IMFPMediaItem::GetNumberOfStreams</a>.
     * @returns {BOOL} Receives a Boolean value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is selected. During playback, this stream will play.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is not selected. During playback, this stream will not play.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(15, this, "uint", dwStreamIndex, "int*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Selects or deselects a stream.
     * @param {Integer} dwStreamIndex Zero-based index of the stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getnumberofstreams">IMFPMediaItem::GetNumberOfStreams</a>.
     * @param {BOOL} fEnabled Specify whether to select or deselect the stream.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is selected. During playback, this stream will play.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream is not selected. During playback, this stream will not play.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, fEnabled) {
        result := ComCall(16, this, "uint", dwStreamIndex, "int", fEnabled, "HRESULT")
        return result
    }

    /**
     * Queries the media item for a stream attribute.
     * @param {Integer} dwStreamIndex Zero-based index of the stream. To get the number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getnumberofstreams">IMFPMediaItem::GetNumberOfStreams</a>.
     * @param {Pointer<Guid>} guidMFAttribute GUID that identifies the attribute value to query. Possible values are listed in the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/stream-descriptor-attributes">Stream Descriptor Attributes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-attributes">Media Type Attributes</a>
     * </li>
     * </ul>
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the value. The method fills the <b>PROPVARIANT</b> with a copy of the stored value. Call <b>PropVariantClear</b> to free the memory allocated by this method.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getstreamattribute
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(17, this, "uint", dwStreamIndex, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Queries the media item for a presentation attribute.
     * @param {Pointer<Guid>} guidMFAttribute GUID that identifies the attribute value to query.
     * 
     * For a list of presentation attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/presentation-descriptor-attributes">Presentation Descriptor Attributes</a>.
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the value. The method fills the <b>PROPVARIANT</b> with a copy of the stored value. Call <b>PropVariantClear</b> to free the memory allocated by the method.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getpresentationattribute
     */
    GetPresentationAttribute(guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(18, this, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Gets various flags that describe the media item.
     * @returns {Integer} Receives a bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfplay/ne-mfplay-_mfp_mediaitem_characteristics">_MFP_MEDIAITEM_CHARACTERISTICS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getcharacteristics
     */
    GetCharacteristics() {
        result := ComCall(19, this, "uint*", &pCharacteristics := 0, "HRESULT")
        return pCharacteristics
    }

    /**
     * Sets a media sink for the media item.
     * @param {Integer} dwStreamIndex Zero-based index of a stream on the media source. The media sink will receive the data from this stream.
     * @param {IUnknown} pMediaSink <b>IUnknown</b> pointer that specifies the media sink. Pass in one of the following:
     * 
     * <ul>
     * <li>A pointer to a stream sink. Every media sink contains one or more <i>stream sinks</i>. Each stream sink receives the data from one stream. The stream sink must expose the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamsink">IMFStreamSink</a> interface.</li>
     * <li>A pointer to an activation object that creates the media sink. The activation object must expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The media item uses the first stream sink on the media sink (that is, the stream sink at index 0).</li>
     * <li><b>NULL</b>. If you set <i>pMediaSink</i> to <b>NULL</b>, the default media sink for the stream type is used.</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-setstreamsink
     */
    SetStreamSink(dwStreamIndex, pMediaSink) {
        result := ComCall(20, this, "uint", dwStreamIndex, "ptr", pMediaSink, "HRESULT")
        return result
    }

    /**
     * Gets a property store that contains metadata for the source, such as author or title.
     * @returns {IPropertyStore} Receives a pointer to the <b>IPropertyStore</b> interface of a read-only property store. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfplay/nf-mfplay-imfpmediaitem-getmetadata
     */
    GetMetadata() {
        result := ComCall(21, this, "ptr*", &ppMetadataStore := 0, "HRESULT")
        return IPropertyStore(ppMetadataStore)
    }
}

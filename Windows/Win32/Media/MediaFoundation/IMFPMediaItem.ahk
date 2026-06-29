#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMFPMediaPlayer.ahk" { IMFPMediaPlayer }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a media item. (Deprecated.).
 * @see https://learn.microsoft.com/windows/win32/api/mfplay/nn-mfplay-imfpmediaitem
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPMediaItem extends IUnknown {
    /**
     * The interface identifier for IMFPMediaItem
     * @type {Guid}
     */
    static IID := Guid("{90eb3e6b-ecbf-45cc-b1da-c6fe3ea70d57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPMediaItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMediaPlayer           : IntPtr
        GetURL                   : IntPtr
        GetObject                : IntPtr
        GetUserData              : IntPtr
        SetUserData              : IntPtr
        GetStartStopPosition     : IntPtr
        SetStartStopPosition     : IntPtr
        HasVideo                 : IntPtr
        HasAudio                 : IntPtr
        IsProtected              : IntPtr
        GetDuration              : IntPtr
        GetNumberOfStreams       : IntPtr
        GetStreamSelection       : IntPtr
        SetStreamSelection       : IntPtr
        GetStreamAttribute       : IntPtr
        GetPresentationAttribute : IntPtr
        GetCharacteristics       : IntPtr
        SetStreamSink            : IntPtr
        GetMetadata              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPMediaItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a pointer to the MFPlay player object that created the media item.
     * @returns {IMFPMediaPlayer} Receives a pointer to the player object's <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nn-mfplay-imfpmediaplayer">IMFPMediaPlayer</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getmediaplayer
     */
    GetMediaPlayer() {
        result := ComCall(3, this, "ptr*", &ppMediaPlayer := 0, "HRESULT")
        return IMFPMediaPlayer(ppMediaPlayer)
    }

    /**
     * Gets the URL that was used to create the media item.
     * @remarks
     * This method applies when the application calls  <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a> to create a media item. If the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">IMFPMediaPlayer::CreateMediaItemFromObject</a> to create a media item, the  <b>GetURL</b> method for that media item returns  <b>MF_E_NOTFOUND</b>.
     * @returns {PWSTR} Receives a pointer to a null-terminated string that contains the URL. The caller must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-geturl
     */
    GetURL() {
        result := ComCall(4, this, PWSTR.Ptr, &ppwszURL := 0, "HRESULT")
        return ppwszURL
    }

    /**
     * Gets the object that was used to create the media item.
     * @remarks
     * The object pointer is set if the application uses <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">IMFPMediaPlayer::CreateMediaItemFromObject</a> to create the media item. Otherwise, <b>GetObject</b> returns  MF_E_NOTFOUND.
     * @returns {IUnknown} Receives a pointer to the object's <b>IUnknown</b> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getobject
     */
    GetObject() {
        result := ComCall(5, this, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    /**
     * Gets the application-defined value stored in the media item.
     * @remarks
     * You can assign this value when you first create the media item, by specifying it in the <i>dwUserData</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl">IMFPMediaPlayer::CreateMediaItemFromURL</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject">IMFPMediaPlayer::CreateMediaItemFromObject</a> method. To update the value, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setuserdata">IMFPMediaItem::SetUserData</a>.
     * 
     * This method can be called after the player object is shut down.
     * @returns {Pointer} Receives the application-defined value for the media item.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getuserdata
     */
    GetUserData() {
        result := ComCall(6, this, "ptr*", &pdwUserData := 0, "HRESULT")
        return pdwUserData
    }

    /**
     * Stores an application-defined value in the media item.
     * @remarks
     * This method can be called after the player object is shut down.
     * @param {Pointer} dwUserData The application-defined value.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setuserdata
     */
    SetUserData(dwUserData) {
        result := ComCall(7, this, "ptr", dwUserData, "HRESULT")
        return result
    }

    /**
     * Gets the start and stop times for the media item.
     * @remarks
     * The <i>pguidStartPositionType</i> and <i>pguidStopPositionType</i> parameters receive the units of time that are used. Currently, the only supported value is <b>MFP_POSITIONTYPE_100NS</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>MFP_POSITIONTYPE_100NS</td>
     * <td>100-nanosecond units. The time parameter (<i>pvStartValue</i> or <i>pvStopValue</i>) uses the following data type:<ul>
     * <li>Variant type (<b>vt</b>): VT_I8</li>
     * <li>Variant member: <b>hVal</b></li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pguidStartPositionType Receives the unit of time for the start position. See Remarks. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvStartValue Receives the start position. The meaning and data type of this parameter are indicated by the <i>pguidStartPositionType</i> parameter. The  <i>pvStartValue</i> parameter must be <b>NULL</b> if <i>pguidStartPositionType</i> is <b>NULL</b>, and cannot be <b>NULL</b> otherwise.
     * @param {Pointer<Guid>} pguidStopPositionType Receives the unit of time for the stop position. See Remarks. This parameter can be <b>NULL</b>.
     * @param {Pointer<PROPVARIANT>} pvStopValue Stop position. The meaning and data type of this parameter are indicated by the <i>pguidStopPositionType</i> parameter. The <i>pvStopValue</i>  parameter must be <b>NULL</b> if <i>pguidStopPositionType</i> is <b>NULL</b>, and cannot be <b>NULL</b> otherwise.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstartstopposition
     */
    GetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(8, this, Guid.Ptr, pguidStartPositionType, PROPVARIANT.Ptr, pvStartValue, Guid.Ptr, pguidStopPositionType, PROPVARIANT.Ptr, pvStopValue, "HRESULT")
        return result
    }

    /**
     * Sets the start and stop time for the media item.
     * @remarks
     * By default, a media item plays from the beginning to the end of the file. This method adjusts the start time and/or  the stop time:
     * 
     * <ul>
     * <li>To set the start time, pass non-<b>NULL</b> values for <i>pguidStartPositionType</i> and <i>pvStartValue</i>.</li>
     * <li>To set the stop time, pass non-<b>NULL</b> values for <i>pguidStopPositionType</i> and <i>pvStopValue</i>.</li>
     * </ul>
     * The <i>pguidStartPositionType</i> and <i>pguidStopPositionType</i> parameters give the units of time that are used. Currently, the only supported value is <b>MFP_POSITIONTYPE_100NS</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>MFP_POSITIONTYPE_100NS</b></td>
     * <td>100-nanosecond units. The time parameter (<i>pvStartValue</i> or <i>pvStopValue</i>) uses the following data type:<ul>
     * <li>Variant type (<b>vt</b>): <b>VT_I8</b></li>
     * <li>Variant member: <b>hVal</b></li>
     * </ul>
     * To clear a previously set time, use an empty <b>PROPVARIANT</b> (<b>VT_EMPTY</b>).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The adjusted start and stop times are used the next time that <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem">IMFPMediaPlayer::SetMediaItem</a> is called with this media item. If the media item is already set on the player, the change does not happen unless you call <b>SetMediaItem</b> again.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setstartstopposition
     */
    SetStartStopPosition(pguidStartPositionType, pvStartValue, pguidStopPositionType, pvStopValue) {
        result := ComCall(9, this, Guid.Ptr, pguidStartPositionType, PROPVARIANT.Ptr, pvStartValue, Guid.Ptr, pguidStopPositionType, PROPVARIANT.Ptr, pvStopValue, "HRESULT")
        return result
    }

    /**
     * Queries whether the media item contains a video stream.
     * @remarks
     * To select or deselect streams before playback starts, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstreamselection">IMFPMediaItem::SetStreamSelection</a>.
     * @param {Pointer<BOOL>} pfHasVideo Receives the value <b>TRUE</b> if the media item contains at least one video stream, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pfSelected Receives the value <b>TRUE</b> if at least one video stream is selected, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-hasvideo
     */
    HasVideo(pfHasVideo, pfSelected) {
        pfHasVideoMarshal := pfHasVideo is VarRef ? "int*" : "ptr"
        pfSelectedMarshal := pfSelected is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pfHasVideoMarshal, pfHasVideo, pfSelectedMarshal, pfSelected, "HRESULT")
        return result
    }

    /**
     * Queries whether the media item contains an audio stream.
     * @remarks
     * To select or deselect streams before playback starts, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstreamselection">IMFPMediaItem::SetStreamSelection</a>.
     * @param {Pointer<BOOL>} pfHasAudio Receives the value <b>TRUE</b> if the media item contains at least one audio stream, or <b>FALSE</b> otherwise.
     * @param {Pointer<BOOL>} pfSelected Receives the value <b>TRUE</b> if at least one audio stream is selected, or <b>FALSE</b> otherwise.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-hasaudio
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
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-isprotected
     */
    IsProtected() {
        result := ComCall(12, this, BOOL.Ptr, &pfProtected := 0, "HRESULT")
        return pfProtected
    }

    /**
     * Gets the duration of the media item.
     * @remarks
     * The method returns the total duration of the content, regardless of any values set through <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstartstopposition">IMFPMediaItem::SetStartStopPosition</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getduration
     */
    GetDuration(guidPositionType) {
        pvDurationValue := PROPVARIANT()
        result := ComCall(13, this, Guid.Ptr, guidPositionType, PROPVARIANT.Ptr, pvDurationValue, "HRESULT")
        return pvDurationValue
    }

    /**
     * Gets the number of streams (audio, video, and other) in the media item.
     * @returns {Integer} Receives the number of streams.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(14, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * Queries whether a stream is selected to play. (IMFPMediaItem.GetStreamSelection)
     * @remarks
     * To select or deselect a stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-setstreamselection">IMFPMediaItem::SetStreamSelection</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(15, this, "uint", dwStreamIndex, BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Selects or deselects a stream.
     * @remarks
     * You can use this method to change which streams are selected. The change goes into effect the next time that <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem">IMFPMediaPlayer::SetMediaItem</a> is called with this media item. If the media item is already set on the player, the change does not happen unless you call <b>SetMediaItem</b> again with this media item.
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, fEnabled) {
        result := ComCall(16, this, "uint", dwStreamIndex, BOOL, fEnabled, "HRESULT")
        return result
    }

    /**
     * Queries the media item for a stream attribute.
     * @remarks
     * Stream attributes describe an individual stream (audio, video, or other) within the presentation. To get an attribute that applies to the entire presentation, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getpresentationattribute">IMFPMediaItem::GetPresentationAttribute</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getstreamattribute
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(17, this, "uint", dwStreamIndex, Guid.Ptr, guidMFAttribute, PROPVARIANT.Ptr, pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Queries the media item for a presentation attribute.
     * @remarks
     * Presentation attributes describe the presentation as a whole. To get an attribute that applies to an individual stream within the presentation, call <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaitem-getstreamattribute">IMFPMediaItem::GetStreamAttribute</a>.
     * @param {Pointer<Guid>} guidMFAttribute GUID that identifies the attribute value to query.
     * 
     * For a list of presentation attributes, see <a href="https://docs.microsoft.com/windows/desktop/medfound/presentation-descriptor-attributes">Presentation Descriptor Attributes</a>.
     * @returns {PROPVARIANT} Pointer to a <b>PROPVARIANT</b> that receives the value. The method fills the <b>PROPVARIANT</b> with a copy of the stored value. Call <b>PropVariantClear</b> to free the memory allocated by the method.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getpresentationattribute
     */
    GetPresentationAttribute(guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(18, this, Guid.Ptr, guidMFAttribute, PROPVARIANT.Ptr, pvValue, "HRESULT")
        return pvValue
    }

    /**
     * Gets various flags that describe the media item.
     * @returns {Integer} Receives a bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/win32/api/mfplay/ne-mfplay-_mfp_mediaitem_characteristics">_MFP_MEDIAITEM_CHARACTERISTICS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getcharacteristics
     */
    GetCharacteristics() {
        result := ComCall(19, this, "uint*", &pCharacteristics := 0, "HRESULT")
        return pCharacteristics
    }

    /**
     * Sets a media sink for the media item.
     * @remarks
     * By default, the MFPlay player object renders audio streams to the <a href="https://docs.microsoft.com/windows/desktop/medfound/streaming-audio-renderer">Streaming Audio Renderer</a> (SAR) and video streams to the <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer">Enhanced Video Renderer</a> (EVR). You can use the <b>SetStreamSink</b> method to provide a different media sink for an audio or video stream; or to support other stream types besides audio and video. You can also use it to configure the SAR or EVR before they are used.
     * 
     * Call this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem">IMFPMediaPlayer::SetMediaItem</a>. Calling this method after <b>SetMediaItem</b> has no effect, unless you stop playback and call <b>SetMediaItem</b> again.
     * 
     * To reset the media item to use the default media sink, set <i>pMediaSink</i> to <b>NULL</b>.
     * 
     * <h3><a id="Remote_Playback_Optimizations"></a><a id="remote_playback_optimizations"></a><a id="REMOTE_PLAYBACK_OPTIMIZATIONS"></a>Remote Playback Optimizations</h3>
     * If the application is running over Remote Desktop, and you call this method with a non-NULL value for an audio or video stream, MFPlay disables remote playback optimizations. This remark applies only to audio and video streams. It does not apply to streams that contain some other data type, such as text.
     * @param {Integer} dwStreamIndex Zero-based index of a stream on the media source. The media sink will receive the data from this stream.
     * @param {IUnknown} pMediaSink <b>IUnknown</b> pointer that specifies the media sink. Pass in one of the following:
     * 
     * <ul>
     * <li>A pointer to a stream sink. Every media sink contains one or more <i>stream sinks</i>. Each stream sink receives the data from one stream. The stream sink must expose the  <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfstreamsink">IMFStreamSink</a> interface.</li>
     * <li>A pointer to an activation object that creates the media sink. The activation object must expose the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfactivate">IMFActivate</a> interface. The media item uses the first stream sink on the media sink (that is, the stream sink at index 0).</li>
     * <li><b>NULL</b>. If you set <i>pMediaSink</i> to <b>NULL</b>, the default media sink for the stream type is used.</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-setstreamsink
     */
    SetStreamSink(dwStreamIndex, pMediaSink) {
        result := ComCall(20, this, "uint", dwStreamIndex, "ptr", pMediaSink, "HRESULT")
        return result
    }

    /**
     * Gets a property store that contains metadata for the source, such as author or title.
     * @returns {IPropertyStore} Receives a pointer to the <b>IPropertyStore</b> interface of a read-only property store. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaitem-getmetadata
     */
    GetMetadata() {
        result := ComCall(21, this, "ptr*", &ppMetadataStore := 0, "HRESULT")
        return IPropertyStore(ppMetadataStore)
    }

    Query(iid) {
        if (IMFPMediaItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMediaPlayer := CallbackCreate(GetMethod(implObj, "GetMediaPlayer"), flags, 2)
        this.vtbl.GetURL := CallbackCreate(GetMethod(implObj, "GetURL"), flags, 2)
        this.vtbl.GetObject := CallbackCreate(GetMethod(implObj, "GetObject"), flags, 2)
        this.vtbl.GetUserData := CallbackCreate(GetMethod(implObj, "GetUserData"), flags, 2)
        this.vtbl.SetUserData := CallbackCreate(GetMethod(implObj, "SetUserData"), flags, 2)
        this.vtbl.GetStartStopPosition := CallbackCreate(GetMethod(implObj, "GetStartStopPosition"), flags, 5)
        this.vtbl.SetStartStopPosition := CallbackCreate(GetMethod(implObj, "SetStartStopPosition"), flags, 5)
        this.vtbl.HasVideo := CallbackCreate(GetMethod(implObj, "HasVideo"), flags, 3)
        this.vtbl.HasAudio := CallbackCreate(GetMethod(implObj, "HasAudio"), flags, 3)
        this.vtbl.IsProtected := CallbackCreate(GetMethod(implObj, "IsProtected"), flags, 2)
        this.vtbl.GetDuration := CallbackCreate(GetMethod(implObj, "GetDuration"), flags, 3)
        this.vtbl.GetNumberOfStreams := CallbackCreate(GetMethod(implObj, "GetNumberOfStreams"), flags, 2)
        this.vtbl.GetStreamSelection := CallbackCreate(GetMethod(implObj, "GetStreamSelection"), flags, 3)
        this.vtbl.SetStreamSelection := CallbackCreate(GetMethod(implObj, "SetStreamSelection"), flags, 3)
        this.vtbl.GetStreamAttribute := CallbackCreate(GetMethod(implObj, "GetStreamAttribute"), flags, 4)
        this.vtbl.GetPresentationAttribute := CallbackCreate(GetMethod(implObj, "GetPresentationAttribute"), flags, 3)
        this.vtbl.GetCharacteristics := CallbackCreate(GetMethod(implObj, "GetCharacteristics"), flags, 2)
        this.vtbl.SetStreamSink := CallbackCreate(GetMethod(implObj, "SetStreamSink"), flags, 3)
        this.vtbl.GetMetadata := CallbackCreate(GetMethod(implObj, "GetMetadata"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMediaPlayer)
        CallbackFree(this.vtbl.GetURL)
        CallbackFree(this.vtbl.GetObject)
        CallbackFree(this.vtbl.GetUserData)
        CallbackFree(this.vtbl.SetUserData)
        CallbackFree(this.vtbl.GetStartStopPosition)
        CallbackFree(this.vtbl.SetStartStopPosition)
        CallbackFree(this.vtbl.HasVideo)
        CallbackFree(this.vtbl.HasAudio)
        CallbackFree(this.vtbl.IsProtected)
        CallbackFree(this.vtbl.GetDuration)
        CallbackFree(this.vtbl.GetNumberOfStreams)
        CallbackFree(this.vtbl.GetStreamSelection)
        CallbackFree(this.vtbl.SetStreamSelection)
        CallbackFree(this.vtbl.GetStreamAttribute)
        CallbackFree(this.vtbl.GetPresentationAttribute)
        CallbackFree(this.vtbl.GetCharacteristics)
        CallbackFree(this.vtbl.SetStreamSink)
        CallbackFree(this.vtbl.GetMetadata)
    }
}

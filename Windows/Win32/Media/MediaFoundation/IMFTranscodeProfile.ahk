#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by the transcode profile object.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftranscodeprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTranscodeProfile extends IUnknown {
    /**
     * The interface identifier for IMFTranscodeProfile
     * @type {Guid}
     */
    static IID := Guid("{4adfdba3-7ab0-4953-a62b-461e7ff3da1e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTranscodeProfile interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetAudioAttributes     : IntPtr
        GetAudioAttributes     : IntPtr
        SetVideoAttributes     : IntPtr
        GetVideoAttributes     : IntPtr
        SetContainerAttributes : IntPtr
        GetContainerAttributes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTranscodeProfile.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets audio stream configuration settings in the transcode profile.
     * @param {IMFAttributes} pAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store that contains the configuration settings for the audio stream. The specified attribute values overwrite any existing values stored in the transcode profile. 
     * 
     * The following audio attributes can be set:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/audio-media-types">Audio Media Types</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-donot-insert-encoder">MF_TRANSCODE_DONOT_INSERT_ENCODER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-encodingprofile">MF_TRANSCODE_ENCODINGPROFILE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-qualityvsspeed">MF_TRANSCODE_QUALITYVSSPEED</a>
     * </li>
     * </ul>
     * To create the attribute store, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a>. To set a specific attribute value in the attribute store, the caller must call the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> methods depending on the data type of the attribute.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-setaudioattributes
     */
    SetAudioAttributes(pAttrs) {
        result := ComCall(3, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the audio stream settings that are currently set in the transcode profile.
     * @remarks
     * If there are no audio attributes set in the transcode profile, the call to <b>GetAudioAttributes</b> succeeds and  <i>ppAttrs</i> receives <b>NULL</b>.
     * 
     * To get a specific attribute value, the caller must call the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> method depending on the data type of the attribute, and specify the attribute name. The following topics describe the audio attributes:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/audio-media-types">Audio Media Types</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-encodingprofile">MF_TRANSCODE_ENCODINGPROFILE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-qualityvsspeed">MF_TRANSCODE_QUALITYVSSPEED</a>
     * </li>
     * </ul>
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store containing the current audio stream settings. Caller must release the interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-getaudioattributes
     */
    GetAudioAttributes() {
        result := ComCall(4, this, "ptr*", &ppAttrs := 0, "HRESULT")
        return IMFAttributes(ppAttrs)
    }

    /**
     * Sets video stream configuration settings in the transcode profile.
     * @param {IMFAttributes} pAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store that contains contains the configuration settings for the video stream. The specified attribute values overwrites any existing values stored in the transcode profile. 
     * 
     * The following video attributes can be set:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/video-media-types">Video Media Types</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-donot-insert-encoder">MF_TRANSCODE_DONOT_INSERT_ENCODER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-encodingprofile">MF_TRANSCODE_ENCODINGPROFILE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-qualityvsspeed">MF_TRANSCODE_QUALITYVSSPEED</a>
     * </li>
     * </ul>
     * To create the attribute store, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a>. To set a specific attribute value in the attribute store, the caller must call the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> methods depending on the data type of the attribute.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-setvideoattributes
     */
    SetVideoAttributes(pAttrs) {
        result := ComCall(5, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the video stream settings that are currently set in the transcode profile.
     * @remarks
     * If there are no container attributes set in the transcode profile, the <b>GetVideoAttributes</b> method  succeeds and  <i>ppAttrs</i> receives <b>NULL</b>.
     * 
     * To get a specific attribute value, the caller must call the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> method depending on the data type of the attribute, and specify the attribute name. The following list shows the video attributes:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/video-media-types">Video Media Types</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-encodingprofile">MF_TRANSCODE_ENCODINGPROFILE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-qualityvsspeed">MF_TRANSCODE_QUALITYVSSPEED</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-donot-insert-encoder">MF_TRANSCODE_DONOT_INSERT_ENCODER</a>
     * </li>
     * </ul>
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store containing the current video stream settings. Caller must release the interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-getvideoattributes
     */
    GetVideoAttributes() {
        result := ComCall(6, this, "ptr*", &ppAttrs := 0, "HRESULT")
        return IMFAttributes(ppAttrs)
    }

    /**
     * Sets container configuration settings in the transcode profile.
     * @param {IMFAttributes} pAttrs Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of an attribute store that contains the configuration settings for the container in which the transcoded file will be stored. The specified attribute values overwrite any existing values stored in the transcode profile. 
     * 
     * The following list shows the container attributes that can be set:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-adjust-profile">MF_TRANSCODE_ADJUST_PROFILE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-skip-metadata-transfer">MF_TRANSCODE_SKIP_METADATA_TRANSFER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-topologymode">MF_TRANSCODE_TOPOLOGYMODE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-fieldofuse-unlock-attribute">MFT_FIELDOFUSE_UNLOCK</a>
     * </li>
     * </ul>
     * To create the attribute store, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a>. To set a specific attribute value in the attribute store, the caller must call the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> methods depending on the data type of the attribute.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-setcontainerattributes
     */
    SetContainerAttributes(pAttrs) {
        result := ComCall(7, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the container settings that are currently set in the transcode profile.
     * @remarks
     * If there are no container attributes set in the transcode profile, the call to <b>GetContainerAttributes</b>  succeeds and  <i>ppAttrs</i> receives <b>NULL</b>.
     * 
     *  To get a specific attribute value, the caller must call the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> method depending on the data type of the attribute. The following list shows the container attributes:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-containertype">MF_TRANSCODE_CONTAINERTYPE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-skip-metadata-transfer">MF_TRANSCODE_SKIP_METADATA_TRANSFER</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-transcode-topologymode">MF_TRANSCODE_TOPOLOGYMODE</a>
     * </li>
     * </ul>
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store containing the current container type for the output file. Caller must release the interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftranscodeprofile-getcontainerattributes
     */
    GetContainerAttributes() {
        result := ComCall(8, this, "ptr*", &ppAttrs := 0, "HRESULT")
        return IMFAttributes(ppAttrs)
    }

    Query(iid) {
        if (IMFTranscodeProfile.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetAudioAttributes := CallbackCreate(GetMethod(implObj, "SetAudioAttributes"), flags, 2)
        this.vtbl.GetAudioAttributes := CallbackCreate(GetMethod(implObj, "GetAudioAttributes"), flags, 2)
        this.vtbl.SetVideoAttributes := CallbackCreate(GetMethod(implObj, "SetVideoAttributes"), flags, 2)
        this.vtbl.GetVideoAttributes := CallbackCreate(GetMethod(implObj, "GetVideoAttributes"), flags, 2)
        this.vtbl.SetContainerAttributes := CallbackCreate(GetMethod(implObj, "SetContainerAttributes"), flags, 2)
        this.vtbl.GetContainerAttributes := CallbackCreate(GetMethod(implObj, "GetContainerAttributes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetAudioAttributes)
        CallbackFree(this.vtbl.GetAudioAttributes)
        CallbackFree(this.vtbl.SetVideoAttributes)
        CallbackFree(this.vtbl.GetVideoAttributes)
        CallbackFree(this.vtbl.SetContainerAttributes)
        CallbackFree(this.vtbl.GetContainerAttributes)
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the transcode profile object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftranscodeprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTranscodeProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTranscodeProfile
     * @type {Guid}
     */
    static IID => Guid("{4adfdba3-7ab0-4953-a62b-461e7ff3da1e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAudioAttributes", "GetAudioAttributes", "SetVideoAttributes", "GetVideoAttributes", "SetContainerAttributes", "GetContainerAttributes"]

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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftranscodeprofile-setaudioattributes
     */
    SetAudioAttributes(pAttrs) {
        result := ComCall(3, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the audio stream settings that are currently set in the transcode profile.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store containing the current audio stream settings. Caller must release the interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftranscodeprofile-getaudioattributes
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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftranscodeprofile-setvideoattributes
     */
    SetVideoAttributes(pAttrs) {
        result := ComCall(5, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the video stream settings that are currently set in the transcode profile.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store containing the current video stream settings. Caller must release the interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftranscodeprofile-getvideoattributes
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
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftranscodeprofile-setcontainerattributes
     */
    SetContainerAttributes(pAttrs) {
        result := ComCall(7, this, "ptr", pAttrs, "HRESULT")
        return result
    }

    /**
     * Gets the container settings that are currently set in the transcode profile.
     * @returns {IMFAttributes} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface of the attribute store containing the current container type for the output file. Caller must release the interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imftranscodeprofile-getcontainerattributes
     */
    GetContainerAttributes() {
        result := ComCall(8, this, "ptr*", &ppAttrs := 0, "HRESULT")
        return IMFAttributes(ppAttrs)
    }
}

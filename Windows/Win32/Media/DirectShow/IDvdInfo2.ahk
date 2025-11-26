#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DVD_PLAYBACK_LOCATION2.ahk
#Include .\DVD_MenuAttributes.ahk
#Include .\DVD_VideoAttributes.ahk
#Include .\DVD_AudioAttributes.ahk
#Include .\DVD_KaraokeAttributes.ahk
#Include .\DVD_SubpictureAttributes.ahk
#Include .\IDvdState.ahk
#Include .\IDvdCmd.ahk
#Include .\DVD_DECODER_CAPS.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdInfo2 interface reports attributes of a DVD disc or the current state of DVD playback and navigation.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdinfo2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdInfo2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdInfo2
     * @type {Guid}
     */
    static IID => Guid("{34151510-eec0-11d2-8201-00a0c9d74842}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentDomain", "GetCurrentLocation", "GetTotalTitleTime", "GetCurrentButton", "GetCurrentAngle", "GetCurrentAudio", "GetCurrentSubpicture", "GetCurrentUOPS", "GetAllSPRMs", "GetAllGPRMs", "GetAudioLanguage", "GetSubpictureLanguage", "GetTitleAttributes", "GetVMGAttributes", "GetCurrentVideoAttributes", "GetAudioAttributes", "GetKaraokeAttributes", "GetSubpictureAttributes", "GetDVDVolumeInfo", "GetDVDTextNumberOfLanguages", "GetDVDTextLanguageInfo", "GetDVDTextStringAsNative", "GetDVDTextStringAsUnicode", "GetPlayerParentalLevel", "GetNumberOfChapters", "GetTitleParentalLevels", "GetDVDDirectory", "IsAudioStreamEnabled", "GetDiscID", "GetState", "GetMenuLanguages", "GetButtonAtPosition", "GetCmdFromEvent", "GetDefaultMenuLanguage", "GetDefaultAudioLanguage", "GetDefaultSubpictureLanguage", "GetDecoderCaps", "GetButtonRect", "IsSubpictureStreamEnabled"]

    /**
     * The GetCurrentDomain method retrieves the domain in which the DVD Navigator is currently located.
     * @returns {Integer} Pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a> that receives the current domain.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentdomain
     */
    GetCurrentDomain() {
        result := ComCall(3, this, "int*", &pDomain := 0, "HRESULT")
        return pDomain
    }

    /**
     * The GetCurrentLocation method retrieves the current playback location.
     * @returns {DVD_PLAYBACK_LOCATION2} Pointer to a variable of type [DVD_PLAYBACK_LOCATION2](/windows/desktop/api/strmif/ns-strmif-dvd_playback_location2) that receives the playback location information.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentlocation
     */
    GetCurrentLocation() {
        pLocation := DVD_PLAYBACK_LOCATION2()
        result := ComCall(4, this, "ptr", pLocation, "HRESULT")
        return pLocation
    }

    /**
     * The GetTotalTitleTime method retrieves the total playback time for the current title.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pTotalTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that receives the total time in hours, minutes, seconds, and frames.
     * @param {Pointer<Integer>} ulTimeCodeFlags Receives a [DVD_TIMECODE_FLAGS](/windows/desktop/api/strmif/ne-strmif-dvd_timecode_flags) value indicating the frame rate at which the disc was authored to play. Specify <b>NULL</b> if you don't want to receive the timecode information.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not in the title domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_S_DVD_NON_ONE_SEQUENTIAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The title is not a one sequential video title, so the timing information might not be continuous.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-gettotaltitletime
     */
    GetTotalTitleTime(pTotalTime, ulTimeCodeFlags) {
        ulTimeCodeFlagsMarshal := ulTimeCodeFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pTotalTime, ulTimeCodeFlagsMarshal, ulTimeCodeFlags, "HRESULT")
        return result
    }

    /**
     * The GetCurrentButton method retrieves the number of available buttons and the number of the currently selected button.
     * @param {Pointer<Integer>} pulButtonsAvailable Receives the number of buttons available.
     * @param {Pointer<Integer>} pulCurrentButton Receives the number (from 1 through 36) of the currently selected button.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the pointer arguments is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentbutton
     */
    GetCurrentButton(pulButtonsAvailable, pulCurrentButton) {
        pulButtonsAvailableMarshal := pulButtonsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentButtonMarshal := pulCurrentButton is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulButtonsAvailableMarshal, pulButtonsAvailable, pulCurrentButtonMarshal, pulCurrentButton, "HRESULT")
        return result
    }

    /**
     * The GetCurrentAngle method retrieves the number of available angles in the current angle block and the currently selected angle number.
     * @param {Pointer<Integer>} pulAnglesAvailable Receives the number of available angles. There are up to nine angles in an angle block, numbered 1 through 9. If the value equals 1, then the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not in an angle block.
     * @param {Pointer<Integer>} pulCurrentAngle Receives the current angle number.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD Navigator is not initialized or not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentangle
     */
    GetCurrentAngle(pulAnglesAvailable, pulCurrentAngle) {
        pulAnglesAvailableMarshal := pulAnglesAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentAngleMarshal := pulCurrentAngle is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulAnglesAvailableMarshal, pulAnglesAvailable, pulCurrentAngleMarshal, pulCurrentAngle, "HRESULT")
        return result
    }

    /**
     * The GetCurrentAudio method retrieves the number of available audio streams and the number of the currently selected audio stream.
     * @param {Pointer<Integer>} pulStreamsAvailable Receives the number of available audio streams.
     * @param {Pointer<Integer>} pulCurrentStream Receives the currently selected audio stream number in the current title.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Input arguments are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized or not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentaudio
     */
    GetCurrentAudio(pulStreamsAvailable, pulCurrentStream) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, "HRESULT")
        return result
    }

    /**
     * The GetCurrentSubpicture method retrieves the number of available subpicture streams in the current title, the currently selected subpicture stream number, and the state of the subpicture.
     * @param {Pointer<Integer>} pulStreamsAvailable Receives the number of available subpicture streams.
     * @param {Pointer<Integer>} pulCurrentStream Receives the number of the currently selected subpicture stream.
     * @param {Pointer<BOOL>} pbIsDisabled Receives a Boolean value that indicates whether the subpicture display is disabled; <b>TRUE</b> means it is disabled.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized or not in the Title domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentsubpicture
     */
    GetCurrentSubpicture(pulStreamsAvailable, pulCurrentStream, pbIsDisabled) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"
        pbIsDisabledMarshal := pbIsDisabled is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, pbIsDisabledMarshal, pbIsDisabled, "HRESULT")
        return result
    }

    /**
     * The GetCurrentUOPS method retrieves a set of flags indicating which navigation commands, if any, the content authors have explicitly disabled for the current disc location.
     * @returns {Integer} Receives a bitwise [VALID_UOP_FLAG](/windows/desktop/api/strmif/ne-strmif-valid_uop_flag) values. Each bit represents the state (valid or not valid) of a user operation (UOP). If the bit is set, then that user operation is prohibited. See Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentuops
     */
    GetCurrentUOPS() {
        result := ComCall(10, this, "uint*", &pulUOPs := 0, "HRESULT")
        return pulUOPs
    }

    /**
     * The GetAllSPRMs method retrieves the current contents of all system parameter registers (SPRMs).
     * @returns {Pointer<Integer>} Pointer to an array of type <a href="https://docs.microsoft.com/windows/desktop/DirectShow/sprmarray">SPRMARRAY</a> that receives the address of an array of SPRMs.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getallsprms
     */
    GetAllSPRMs() {
        result := ComCall(11, this, "ptr*", &pRegisterArray := 0, "HRESULT")
        return pRegisterArray
    }

    /**
     * The GetAllGPRMs method retrieves the current contents of all general parameter registers (GPRMs).
     * @returns {Pointer<Integer>} Pointer to an array of type <a href="https://docs.microsoft.com/windows/desktop/DirectShow/gprmarray">GPRMARRAY</a> that receives all 16 current GPRM values.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getallgprms
     */
    GetAllGPRMs() {
        result := ComCall(12, this, "ptr*", &pRegisterArray := 0, "HRESULT")
        return pRegisterArray
    }

    /**
     * The GetAudioLanguage method retrieves the language of the specified audio stream within the current title.
     * @param {Integer} ulStream Audio stream number for the language being retrieved.
     * @returns {Integer} Receives the language information.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getaudiolanguage
     */
    GetAudioLanguage(ulStream) {
        result := ComCall(13, this, "uint", ulStream, "uint*", &pLanguage := 0, "HRESULT")
        return pLanguage
    }

    /**
     * The GetSubpictureLanguage method retrieves the language of the specified subpicture stream within the current title.
     * @param {Integer} ulStream Number of the subpicture stream for which the language is being retrieved.
     * @returns {Integer} Pointer to an LCID that receives the locale information. The language information can then be extracted from the LCID by using the Win32 <b>MAKELANGID</b> macro.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getsubpicturelanguage
     */
    GetSubpictureLanguage(ulStream) {
        result := ComCall(14, this, "uint", ulStream, "uint*", &pLanguage := 0, "HRESULT")
        return pLanguage
    }

    /**
     * The GetTitleAttributes method retrieves attributes of all video, audio, and subpicture streams for the specified title and its menus.
     * @param {Integer} ulTitle Variable of type ULONG, from 1 through 99, specifying the requested title number. Specify 0xFFFFFFFF for the current title.
     * @param {Pointer<DVD_MenuAttributes>} pMenu Pointer to a [DVD_MenuAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_menuattributes) structure that receives the attributes of the menu associated with the specified title.
     * @param {Pointer<DVD_TitleAttributes>} pTitle Pointer to a [DVD_TitleAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_titleattributes) structure that receives the attributes of the specified title.
     * @returns {HRESULT} Returns one of the following <code>HRESULT</code> values.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>nTitle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not in the title domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pMenu</i> or <i>pTitle</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD Navigator is not initialized or some other internal error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-gettitleattributes
     */
    GetTitleAttributes(ulTitle, pMenu, pTitle) {
        result := ComCall(15, this, "uint", ulTitle, "ptr", pMenu, "ptr", pTitle, "HRESULT")
        return result
    }

    /**
     * The GetVMGAttributes method retrieves attributes of all video, audio, and subpicture streams for the Video Manager Menu.
     * @returns {DVD_MenuAttributes} Pointer to a [DVD_MenuAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_menuattributes) structure that receives the attributes.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getvmgattributes
     */
    GetVMGAttributes() {
        pATR := DVD_MenuAttributes()
        result := ComCall(16, this, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetCurrentVideoAttributes method retrieves the video attributes of the current title or menu.
     * @returns {DVD_VideoAttributes} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_videoattributes">DVD_VideoAttributes</a> structure that receives the attributes.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcurrentvideoattributes
     */
    GetCurrentVideoAttributes() {
        pATR := DVD_VideoAttributes()
        result := ComCall(17, this, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetAudioAttributes method retrieves the attributes of the specified audio stream in the current title or menu.
     * @param {Integer} ulStream Variable of type ULONG specifying the audio stream whose attributes you wish to query. See Remarks.
     * @returns {DVD_AudioAttributes} Pointer to a [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure that is filled with the attributes of the specified audio stream.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getaudioattributes
     */
    GetAudioAttributes(ulStream) {
        pATR := DVD_AudioAttributes()
        result := ComCall(18, this, "uint", ulStream, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetKaraokeAttributes method retrieves the karaoke attributes of the specified audio stream in the current title or menu.
     * @param {Integer} ulStream Specifies the index of the audio stream whose attributes you want to query. See Remarks.
     * @returns {DVD_KaraokeAttributes} Pointer to a [DVD_KaraokeAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_karaokeattributes) structure that is filled with the karaoke attributes.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getkaraokeattributes
     */
    GetKaraokeAttributes(ulStream) {
        pAttributes := DVD_KaraokeAttributes()
        result := ComCall(19, this, "uint", ulStream, "ptr", pAttributes, "HRESULT")
        return pAttributes
    }

    /**
     * The GetSubpictureAttributes method retrieves the attributes of the specified subpicture stream in the specified title or menu.
     * @param {Integer} ulStream Index number, from 0 through 31, of the subpicture stream to query. See Remarks.
     * @returns {DVD_SubpictureAttributes} Pointer to a [DVD_SubpictureAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_subpictureattributes) structure that receives the subpicture attributes.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getsubpictureattributes
     */
    GetSubpictureAttributes(ulStream) {
        pATR := DVD_SubpictureAttributes()
        result := ComCall(20, this, "uint", ulStream, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetDVDVolumeInfo method retrieves the current DVD volume information.
     * @param {Pointer<Integer>} pulNumOfVolumes Receives the number of volumes in the volume set.
     * @param {Pointer<Integer>} pulVolume Receives the volume number for this root directory.
     * @param {Pointer<Integer>} pSide Pointer to a variable of type [DVD_DISC_SIDE](/windows/desktop/api/strmif/ne-strmif-dvd_disc_side) that receives the current disc side.
     * @param {Pointer<Integer>} pulNumOfTitles Pointer to a variable of type ULONG that receives the number of titles available in this volume.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdvdvolumeinfo
     */
    GetDVDVolumeInfo(pulNumOfVolumes, pulVolume, pSide, pulNumOfTitles) {
        pulNumOfVolumesMarshal := pulNumOfVolumes is VarRef ? "uint*" : "ptr"
        pulVolumeMarshal := pulVolume is VarRef ? "uint*" : "ptr"
        pSideMarshal := pSide is VarRef ? "int*" : "ptr"
        pulNumOfTitlesMarshal := pulNumOfTitles is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pulNumOfVolumesMarshal, pulNumOfVolumes, pulVolumeMarshal, pulVolume, pSideMarshal, pSide, pulNumOfTitlesMarshal, pulNumOfTitles, "HRESULT")
        return result
    }

    /**
     * The GetDVDTextNumberOfLanguages method retrieves the number of languages in which DVD text strings appear.
     * @returns {Integer} Receives the number of text languages.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdvdtextnumberoflanguages
     */
    GetDVDTextNumberOfLanguages() {
        result := ComCall(22, this, "uint*", &pulNumOfLangs := 0, "HRESULT")
        return pulNumOfLangs
    }

    /**
     * The GetDVDTextLanguageInfo method retrieves information about the text strings for a specified language. The method retrieves the number of strings for that language, the locale identifier, and the character set.
     * @param {Integer} ulLangIndex Zero-based index of the language to query. To find the number of text-string languages on the DVD, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextnumberoflanguages">IDvdInfo2::GetDVDTextNumberOfLanguages</a>.
     * @param {Pointer<Integer>} pulNumOfStrings Receives the number of text strings for the specified language.
     * @param {Pointer<Integer>} pLangCode Receives a <i>locale identifier</i> (LCID) that specifies the language in which the text is written. For example, the LCID for "en-us" is 0x0409.
     * @param {Pointer<Integer>} pbCharacterSet Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_textcharset">DVD_TextCharSet</a> enumeration. The value specifies the character set of the text string.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This DVD does not have any text strings, or the <i>ulLangIndex</i> parameter is out of bounds.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected internal error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdvdtextlanguageinfo
     */
    GetDVDTextLanguageInfo(ulLangIndex, pulNumOfStrings, pLangCode, pbCharacterSet) {
        pulNumOfStringsMarshal := pulNumOfStrings is VarRef ? "uint*" : "ptr"
        pLangCodeMarshal := pLangCode is VarRef ? "uint*" : "ptr"
        pbCharacterSetMarshal := pbCharacterSet is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, "uint", ulLangIndex, pulNumOfStringsMarshal, pulNumOfStrings, pLangCodeMarshal, pLangCode, pbCharacterSetMarshal, pbCharacterSet, "HRESULT")
        return result
    }

    /**
     * The GetDVDTextStringAsNative method retrieves a DVD text string for a specified language, and returns the text string as an array of bytes.
     * @param {Integer} ulLangIndex Zero-based index of the language. To find the number of text-string languages on the DVD, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextnumberoflanguages">IDvdInfo2::GetDVDTextNumberOfLanguages</a>.
     * @param {Integer} ulStringIndex Zero-based index of the string to retrieve. To find the number of strings for a given language, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextlanguageinfo">IDvdInfo2::GetDVDTextLanguageInfo</a>.
     * @param {Pointer<Integer>} pbBuffer Pointer to a buffer that receives the text string. If <i>pchBuffer</i> is <b>NULL</b>, this method returns the size of the string in <i>pulActualSize</i>.
     * @param {Integer} ulMaxBufferSize Size of the <i>pchBuffer</i> in bytes
     * @param {Pointer<Integer>} pulActualSize Receives the actual length of the string in bytes, including the terminating <b>NULL</b>.
     * @param {Pointer<Integer>} pType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_textstringtype">DVD_TextStringType</a> enumeration. The value indicates the type of text string, such as movie title or song name. This parameter can also receive values that are not defined in the <b>DVD_TextStringType</b> enumeration.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected internal error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdvdtextstringasnative
     */
    GetDVDTextStringAsNative(ulLangIndex, ulStringIndex, pbBuffer, ulMaxBufferSize, pulActualSize, pType) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pulActualSizeMarshal := pulActualSize is VarRef ? "uint*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "uint", ulLangIndex, "uint", ulStringIndex, pbBufferMarshal, pbBuffer, "uint", ulMaxBufferSize, pulActualSizeMarshal, pulActualSize, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * The GetDVDTextStringAsUnicode method retrieves a DVD text string for a specified language, and returns the text string as a Unicode string.
     * @param {Integer} ulLangIndex Zero-based index of the language. To find the number of text-string languages on the DVD, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextnumberoflanguages">IDvdInfo2::GetDVDTextNumberOfLanguages</a>.
     * @param {Integer} ulStringIndex Zero-based index of the string to retrieve. To find the number of strings for a given language, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextlanguageinfo">IDvdInfo2::GetDVDTextLanguageInfo</a>.
     * @param {PWSTR} pchwBuffer Pointer to a buffer that receives the text string. If <i>pchBuffer</i> is <b>NULL</b>, this method returns the size of the string in <i>pulActualSize</i>.
     * @param {Integer} ulMaxBufferSize Size of the <i>pchBuffer</i> buffer, in <b>WCHARs</b>.
     * @param {Pointer<Integer>} pulActualSize Receives the actual length of the string in characters, including the terminating <b>NULL</b>.
     * @param {Pointer<Integer>} pType Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_textstringtype">DVD_TextStringType</a> enumeration. The value indicates the type of text string, such as movie title or song name. This parameter can also receive values that are not defined in the <b>DVD_TextStringType</b> enumeration.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unsupported te
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected internal error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdvdtextstringasunicode
     */
    GetDVDTextStringAsUnicode(ulLangIndex, ulStringIndex, pchwBuffer, ulMaxBufferSize, pulActualSize, pType) {
        pchwBuffer := pchwBuffer is String ? StrPtr(pchwBuffer) : pchwBuffer

        pulActualSizeMarshal := pulActualSize is VarRef ? "uint*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "uint", ulLangIndex, "uint", ulStringIndex, "ptr", pchwBuffer, "uint", ulMaxBufferSize, pulActualSizeMarshal, pulActualSize, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * The GetPlayerParentalLevel method retrieves the current parental level and ISO 3166 country/region code settings for the DVD Navigator.
     * @param {Pointer<Integer>} pulParentalLevel Receives a value indicating the current parental level. Valid parental levels are 1 through 8 if parental management is enabled, 0xFFFFFFFF if parental management is disabled.
     * @param {Pointer<Integer>} pbCountryCode Address of a two-byte array that receives the current country/region code (ISO 3166 Alpha-2 Code).
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getplayerparentallevel
     */
    GetPlayerParentalLevel(pulParentalLevel, pbCountryCode) {
        pulParentalLevelMarshal := pulParentalLevel is VarRef ? "uint*" : "ptr"
        pbCountryCodeMarshal := pbCountryCode is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, pulParentalLevelMarshal, pulParentalLevel, pbCountryCodeMarshal, pbCountryCode, "HRESULT")
        return result
    }

    /**
     * The GetNumberOfChapters method retrieves the number of chapters in a given title.
     * @param {Integer} ulTitle Specifies the title.
     * @returns {Integer} Receives the number of chapters for the specified title.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getnumberofchapters
     */
    GetNumberOfChapters(ulTitle) {
        result := ComCall(27, this, "uint", ulTitle, "uint*", &pulNumOfChapters := 0, "HRESULT")
        return pulNumOfChapters
    }

    /**
     * The GetTitleParentalLevels method retrieves the parental levels that are defined for a particular title.
     * @param {Integer} ulTitle Title for which parental levels are requested. Specify 0xfffffff to return the parental levels for the current title.
     * @returns {Integer} Pointer to a variable of type ULONG that receives a bitwise OR combination of [DVD_PARENTAL_LEVEL](/windows/desktop/api/strmif/ne-strmif-dvd_parental_level) values defined for the title.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-gettitleparentallevels
     */
    GetTitleParentalLevels(ulTitle) {
        result := ComCall(28, this, "uint", ulTitle, "uint*", &pulParentalLevels := 0, "HRESULT")
        return pulParentalLevels
    }

    /**
     * The GetDVDDirectory method retrieves the root directory that is set in the DVD Navigator.
     * @param {PWSTR} pszwPath Pointer to a buffer that receives the path string.
     * @param {Integer} ulMaxSize Size of the buffer, in WCHARs.
     * @returns {Integer} Pointer to a variable that receives the size of actual data returned, in WCHARs.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdvddirectory
     */
    GetDVDDirectory(pszwPath, ulMaxSize) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(29, this, "ptr", pszwPath, "uint", ulMaxSize, "uint*", &pulActualSize := 0, "HRESULT")
        return pulActualSize
    }

    /**
     * The IsAudioStreamEnabled method determines if the specified audio stream is enabled in the current title.
     * @param {Integer} ulStreamNum Audio stream number to test.
     * @returns {BOOL} Pointer to a variable of type BOOL that receives a value of <b>TRUE</b> if the audio stream is enabled, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-isaudiostreamenabled
     */
    IsAudioStreamEnabled(ulStreamNum) {
        result := ComCall(30, this, "uint", ulStreamNum, "int*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * The GetDiscID method retrieves a system-generated 64-bit identification number for the specified DVD.
     * @param {PWSTR} pszwPath Path of the volume to use for the disc ID. Specify <b>NULL</b> to use the current or default DVD volume.
     * @returns {Integer} Receives the 64-bit disc ID.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdiscid
     */
    GetDiscID(pszwPath) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(31, this, "ptr", pszwPath, "uint*", &pullDiscID := 0, "HRESULT")
        return pullDiscID
    }

    /**
     * The GetState method retrieves a bookmark containing the disc location and DVD Navigator state information.
     * @returns {IDvdState} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdstate">IDvdState</a> interface of a <b>DvdState</b> object allocated by the DVD Navigator.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getstate
     */
    GetState() {
        result := ComCall(32, this, "ptr*", &pStateData := 0, "HRESULT")
        return IDvdState(pStateData)
    }

    /**
     * The GetMenuLanguages method retrieves all the languages available for all menus on the disc.
     * @param {Pointer<Integer>} pLanguages Pointer to an <b>LCID</b> array that receives the languages returned. To retrieve only the number of languages available for menus, and not the actual languages themselves, specify <b>NULL</b> for <i>pLanguages</i>.
     * @param {Integer} ulMaxLanguages Maximum number of languages to retrieve.
     * @param {Pointer<Integer>} pulActualLanguages Receives the actual number of languages retrieved.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getmenulanguages
     */
    GetMenuLanguages(pLanguages, ulMaxLanguages, pulActualLanguages) {
        pLanguagesMarshal := pLanguages is VarRef ? "uint*" : "ptr"
        pulActualLanguagesMarshal := pulActualLanguages is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, pLanguagesMarshal, pLanguages, "uint", ulMaxLanguages, pulActualLanguagesMarshal, pulActualLanguages, "HRESULT")
        return result
    }

    /**
     * The GetButtonAtPosition method retrieves the button located at the specified point within the display window.
     * @param {POINT} point Current mouse pointer position as retrieved through the Win32 WM_MOUSEMOVE message.
     * @returns {Integer} Receives the index (from 1 through 36) of the button at the current mouse pointer position.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getbuttonatposition
     */
    GetButtonAtPosition(point) {
        result := ComCall(34, this, "ptr", point, "uint*", &pulButtonIndex := 0, "HRESULT")
        return pulButtonIndex
    }

    /**
     * The GetCmdFromEvent method retrieves an IDvdCmd object from an EC_DVD_CMD_START or EC_DVD_CMD_END event.
     * @param {Pointer} lParam1 Event notification's <i>lParam1</i> parameter.
     * @returns {IDvdCmd} Receives a pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> interface that is associated with the command that fired the event.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getcmdfromevent
     */
    GetCmdFromEvent(lParam1) {
        result := ComCall(35, this, "ptr", lParam1, "ptr*", &pCmdObj := 0, "HRESULT")
        return IDvdCmd(pCmdObj)
    }

    /**
     * The GetDefaultMenuLanguage method retrieves the default menu language.
     * @returns {Integer} Receives the language information.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdefaultmenulanguage
     */
    GetDefaultMenuLanguage() {
        result := ComCall(36, this, "uint*", &pLanguage := 0, "HRESULT")
        return pLanguage
    }

    /**
     * The GetDefaultAudioLanguage method retrieves the default audio language.
     * @param {Pointer<Integer>} pLanguage Receives the default language information.
     * @param {Pointer<Integer>} pAudioExtension Pointer to a variable of type [DVD_AUDIO_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_audio_lang_ext) that receives a value indicating the default DVD audio language extension.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pLanguage</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD Navigator is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdefaultaudiolanguage
     */
    GetDefaultAudioLanguage(pLanguage, pAudioExtension) {
        pLanguageMarshal := pLanguage is VarRef ? "uint*" : "ptr"
        pAudioExtensionMarshal := pAudioExtension is VarRef ? "int*" : "ptr"

        result := ComCall(37, this, pLanguageMarshal, pLanguage, pAudioExtensionMarshal, pAudioExtension, "HRESULT")
        return result
    }

    /**
     * The GetDefaultSubpictureLanguage method retrieves the default subpicture language.
     * @param {Pointer<Integer>} pLanguage Receives the language information.
     * @param {Pointer<Integer>} pSubpictureExtension Pointer to a variable of type [DVD_SUBPICTURE_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_lang_ext) that receives one of the allowable values indicating the default language extension.
     * @returns {HRESULT} Returns one of the following <b>HRESULT</b> values.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pLanguage</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD Navigator is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdefaultsubpicturelanguage
     */
    GetDefaultSubpictureLanguage(pLanguage, pSubpictureExtension) {
        pLanguageMarshal := pLanguage is VarRef ? "uint*" : "ptr"
        pSubpictureExtensionMarshal := pSubpictureExtension is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, pLanguageMarshal, pLanguage, pSubpictureExtensionMarshal, pSubpictureExtension, "HRESULT")
        return result
    }

    /**
     * The GetDecoderCaps method retrieves the DVD decoder's maximum data rate for video, audio, and subpicture (in forward and reverse) as well as support for various types of audio (AC-3, MPEG-2, DTS, SDDS, LPCM).
     * @returns {DVD_DECODER_CAPS} Pointer to a variable of type [DVD_DECODER_CAPS](/windows/desktop/api/strmif/ns-strmif-dvd_decoder_caps) that receives the information about the decoder.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getdecodercaps
     */
    GetDecoderCaps() {
        pCaps := DVD_DECODER_CAPS()
        result := ComCall(39, this, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * The GetButtonRect method retrieves the rectangle coordinates for the specified menu button. Note  This method is currently not implemented. .
     * @param {Integer} ulButton Specifies the menu button.
     * @returns {RECT} Pointer to a variable of type RECT that receives the coordinates of the button's rectangle.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-getbuttonrect
     */
    GetButtonRect(ulButton) {
        pRect := RECT()
        result := ComCall(40, this, "uint", ulButton, "ptr", pRect, "HRESULT")
        return pRect
    }

    /**
     * The IsSubpictureStreamEnabled method determines if the specified subpicture stream is enabled in the current title.
     * @param {Integer} ulStreamNum Subpicture stream number to test.
     * @returns {BOOL} Pointer to a variable of type BOOL that receives a value of <b>TRUE</b> if the audio stream is enabled, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo2-issubpicturestreamenabled
     */
    IsSubpictureStreamEnabled(ulStreamNum) {
        result := ComCall(41, this, "uint", ulStreamNum, "int*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }
}

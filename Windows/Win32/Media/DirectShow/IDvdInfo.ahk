#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DVD_PLAYBACK_LOCATION.ahk
#Include .\DVD_ATR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdInfo
     * @type {Guid}
     */
    static IID => Guid("{a70efe60-e2a3-11d0-a9be-00aa0061be93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentDomain", "GetCurrentLocation", "GetTotalTitleTime", "GetCurrentButton", "GetCurrentAngle", "GetCurrentAudio", "GetCurrentSubpicture", "GetCurrentUOPS", "GetAllSPRMs", "GetAllGPRMs", "GetAudioLanguage", "GetSubpictureLanguage", "GetTitleAttributes", "GetVMGAttributes", "GetCurrentVideoAttributes", "GetCurrentAudioAttributes", "GetCurrentSubpictureAttributes", "GetCurrentVolumeInfo", "GetDVDTextInfo", "GetPlayerParentalLevel", "GetNumberOfChapters", "GetTitleParentalLevels", "GetRoot"]

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current DVD domain of the DVD player.
     * @returns {Integer} Pointer to the current domain that is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a> enumerated type.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentdomain
     */
    GetCurrentDomain() {
        result := ComCall(3, this, "int*", &pDomain := 0, "HRESULT")
        return pDomain
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current playback location.
     * @returns {DVD_PLAYBACK_LOCATION} Pointer to the retrieved playback location information in a [DVD_PLAYBACK_LOCATION](/windows/desktop/api/strmif/ns-strmif-dvd_playback_location) structure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentlocation
     */
    GetCurrentLocation() {
        pLocation := DVD_PLAYBACK_LOCATION()
        result := ComCall(4, this, "ptr", pLocation, "HRESULT")
        return pLocation
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the total playback time for the current title.
     * @returns {Integer} Pointer to the total time in [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) format, which includes hours, minutes, seconds, and frames.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-gettotaltitletime
     */
    GetTotalTitleTime() {
        result := ComCall(5, this, "uint*", &pulTotalTime := 0, "HRESULT")
        return pulTotalTime
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available buttons and the currently selected button number.
     * @param {Pointer<Integer>} pulButtonsAvailable Pointer to the number of buttons available.
     * @param {Pointer<Integer>} pulCurrentButton Pointer to the number of the current button.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
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
     * <dt><b>VFW_E_DVD_OPERATION_INHIBITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action cannot occur at this point in the movie due to the authoring of the current DVD-Video disc.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentbutton
     */
    GetCurrentButton(pulButtonsAvailable, pulCurrentButton) {
        pulButtonsAvailableMarshal := pulButtonsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentButtonMarshal := pulCurrentButton is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulButtonsAvailableMarshal, pulButtonsAvailable, pulCurrentButtonMarshal, pulCurrentButton, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available angles and the currently selected angle number.
     * @param {Pointer<Integer>} pulAnglesAvailable Pointer to the retrieved number of available angles. If the value pointed to equals 1, then the current video does not contain multiple angles.
     * @param {Pointer<Integer>} pulCurrentAngle Pointer to the retrieved current angle number.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD is not initialized or domain is not DVD_DOMAIN_Title.
     * 
     * </td>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action is not supported on this domain (<a href="/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_OPERATION_INHIBITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action cannot occur at this point in the movie due to the authoring of the current DVD-Video disc.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentangle
     */
    GetCurrentAngle(pulAnglesAvailable, pulCurrentAngle) {
        pulAnglesAvailableMarshal := pulAnglesAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentAngleMarshal := pulCurrentAngle is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulAnglesAvailableMarshal, pulAnglesAvailable, pulCurrentAngleMarshal, pulCurrentAngle, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available audio streams and the number of the currently selected audio stream.
     * @param {Pointer<Integer>} pulStreamsAvailable Pointer to the retrieved number of available audio streams
     * @param {Pointer<Integer>} pulCurrentStream Pointer to the current stream number.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD is not initialized or domain is not DVD_DOMAIN_Title.
     * 
     * </td>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action is not supported on this domain (<a href="/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_OPERATION_INHIBITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action cannot occur at this point in the movie due to the authoring of the current DVD-Video disc.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentaudio
     */
    GetCurrentAudio(pulStreamsAvailable, pulCurrentStream) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available subpicture streams, the currently selected subpicture stream number, and whether the subpicture display is disabled.
     * @param {Pointer<Integer>} pulStreamsAvailable Pointer to the retrieved number of available subpicture streams.
     * @param {Pointer<Integer>} pulCurrentStream Pointer to the retrieved number of the currently selected subpicture stream.
     * @param {Pointer<BOOL>} pIsDisabled Pointer to a value indicating whether the subpicture display is disabled.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD is not initialized or domain is not DVD_DOMAIN_Title.
     * 
     * </td>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action is not supported on this domain (<a href="/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_OPERATION_INHIBITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action cannot occur at this point in the movie due to the authoring of the current DVD-Video disc.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentsubpicture
     */
    GetCurrentSubpicture(pulStreamsAvailable, pulCurrentStream, pIsDisabled) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"
        pIsDisabledMarshal := pIsDisabled is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, pIsDisabledMarshal, pIsDisabled, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves which IDvdControl methods are currently valid.
     * @returns {Integer} Pointer to a <b>DWORD</b> value containing bits for all user operations (UOP). Each bit in the <b>DWORD</b> represents the state (valid or not valid) of a user operation. If the bit corresponding to a user operation is set, then that user operation is prohibited. For more information, see Remarks.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentuops
     */
    GetCurrentUOPS() {
        result := ComCall(10, this, "uint*", &pUOP := 0, "HRESULT")
        return pUOP
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current contents of all system parameter registers (SPRMs).
     * @returns {Pointer<Integer>} Pointer to the retrieved array of system parameter registers.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getallsprms
     */
    GetAllSPRMs() {
        result := ComCall(11, this, "ptr*", &pRegisterArray := 0, "HRESULT")
        return pRegisterArray
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current contents of all general parameter registers (GPRMs).
     * @returns {Pointer<Integer>} Pointer to the retrieved array of general parameter registers.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getallgprms
     */
    GetAllGPRMs() {
        result := ComCall(12, this, "ptr*", &pRegisterArray := 0, "HRESULT")
        return pRegisterArray
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the language of the specified audio stream within the current title.
     * @param {Integer} ulStream Stream number.
     * @returns {Integer} Pointer to the retrieved language.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getaudiolanguage
     */
    GetAudioLanguage(ulStream) {
        result := ComCall(13, this, "uint", ulStream, "uint*", &pLanguage := 0, "HRESULT")
        return pLanguage
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the language of the specified subpicture stream within the current title.
     * @param {Integer} ulStream Stream number.
     * @returns {Integer} Pointer to the retrieved language.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getsubpicturelanguage
     */
    GetSubpictureLanguage(ulStream) {
        result := ComCall(14, this, "uint", ulStream, "uint*", &pLanguage := 0, "HRESULT")
        return pLanguage
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves attributes of all video, audio, and subpicture streams for the specified title, including menus.
     * @param {Integer} ulTitle Requested title number. Specify 0xFFFFFFFF for the current title.
     * @returns {DVD_ATR} Pointer to the retrieved attributes structure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-gettitleattributes
     */
    GetTitleAttributes(ulTitle) {
        pATR := DVD_ATR()
        result := ComCall(15, this, "uint", ulTitle, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves attributes of all video, audio, and subpicture streams for video manager (VMG) menus.
     * @returns {DVD_ATR} Pointer to the retrieved attributes structure.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getvmgattributes
     */
    GetVMGAttributes() {
        pATR := DVD_ATR()
        result := ComCall(16, this, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current video attributes for the current title or menu.
     * @returns {Pointer<Integer>} Pointer to the retrieved video attributes.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentvideoattributes
     */
    GetCurrentVideoAttributes() {
        result := ComCall(17, this, "ptr*", &pATR := 0, "HRESULT")
        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the attributes for the current audio stream in the current title or menu.
     * @returns {Pointer<Integer>} Pointer to the retrieved audio attributes.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentaudioattributes
     */
    GetCurrentAudioAttributes() {
        result := ComCall(18, this, "ptr*", &pATR := 0, "HRESULT")
        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the attributes for the current subpicture stream in the current title or menu.
     * @returns {Pointer<Integer>} Pointer to the retrieved subpicture attributes.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentsubpictureattributes
     */
    GetCurrentSubpictureAttributes() {
        result := ComCall(19, this, "ptr*", &pATR := 0, "HRESULT")
        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current DVD volume information.
     * @param {Pointer<Integer>} pulNumOfVol Pointer to the retrieved number of volumes in the volume set.
     * @param {Pointer<Integer>} pulThisVolNum Pointer to the retrieved volume number for this root directory.
     * @param {Pointer<Integer>} pSide Pointer to the retrieved current disc side ([DVD_DISC_SIDE](/windows/desktop/api/strmif/ne-strmif-dvd_disc_side)).
     * @param {Pointer<Integer>} pulNumOfTitles Pointer to the retrieved number of titles available in this volume.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value .
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD is not initialized or domain is not DVD_DOMAIN_Title.
     * 
     * </td>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action is not supported on this domain (<a href="/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_OPERATION_INHIBITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action cannot occur at this point in the movie due to the authoring of the current DVD-Video disc.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getcurrentvolumeinfo
     */
    GetCurrentVolumeInfo(pulNumOfVol, pulThisVolNum, pSide, pulNumOfTitles) {
        pulNumOfVolMarshal := pulNumOfVol is VarRef ? "uint*" : "ptr"
        pulThisVolNumMarshal := pulThisVolNum is VarRef ? "uint*" : "ptr"
        pSideMarshal := pSide is VarRef ? "int*" : "ptr"
        pulNumOfTitlesMarshal := pulNumOfTitles is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pulNumOfVolMarshal, pulNumOfVol, pulThisVolNumMarshal, pulThisVolNum, pSideMarshal, pSide, pulNumOfTitlesMarshal, pulNumOfTitles, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the TXTDT_MG structure, which can contain text descriptions for title name, volume name, producer name, vocalist name, and so on, in various languages.
     * @param {Pointer} pTextManager Pointer to the retrieved text manager.
     * @param {Integer} ulBufSize Size of the buffer for <i>pTextManager</i>, in bytes.
     * @returns {Integer} Pointer to a value containing the number of bytes of data returned.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getdvdtextinfo
     */
    GetDVDTextInfo(pTextManager, ulBufSize) {
        result := ComCall(21, this, "ptr", pTextManager, "uint", ulBufSize, "uint*", &pulActualSize := 0, "HRESULT")
        return pulActualSize
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current parental level and country/region code settings for the DVD player.
     * @param {Pointer<Integer>} pulParentalLevel Pointer to a value indicating the current parental level.
     * @param {Pointer<Integer>} pulCountryCode Pointer to a value indicating the current country/region code.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * DVD is not initialized or domain is not DVD_DOMAIN_Title.
     * 
     * </td>
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action is not supported on this domain (<a href="/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_OPERATION_INHIBITED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Requested action cannot occur at this point in the movie due to the authoring of the current DVD-Video disc.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getplayerparentallevel
     */
    GetPlayerParentalLevel(pulParentalLevel, pulCountryCode) {
        pulParentalLevelMarshal := pulParentalLevel is VarRef ? "uint*" : "ptr"
        pulCountryCodeMarshal := pulCountryCode is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pulParentalLevelMarshal, pulParentalLevel, pulCountryCodeMarshal, pulCountryCode, "HRESULT")
        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of chapters that are defined for a given title.
     * @param {Integer} ulTitle Title for which to retrieve the number of chapters.
     * @returns {Integer} Pointer to the retrieved number of chapters for the specified title.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getnumberofchapters
     */
    GetNumberOfChapters(ulTitle) {
        result := ComCall(23, this, "uint", ulTitle, "uint*", &pulNumberOfChapters := 0, "HRESULT")
        return pulNumberOfChapters
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the parental levels that are defined for a particular title.
     * @param {Integer} ulTitle Title for which parental levels are requested.
     * @returns {Integer} Pointer to a logical OR combination of the parental levels defined for the title. A higher setting will block out more content than a lower setting. Valid parental levels are the following:
     * 
     * <ul>
     * <li>DVD_PARENTAL_LEVEL_1</li>
     * <li>DVD_PARENTAL_LEVEL_2</li>
     * <li>DVD_PARENTAL_LEVEL_3</li>
     * <li>DVD_PARENTAL_LEVEL_4</li>
     * <li>DVD_PARENTAL_LEVEL_5</li>
     * <li>DVD_PARENTAL_LEVEL_6</li>
     * <li>DVD_PARENTAL_LEVEL_7</li>
     * <li>DVD_PARENTAL_LEVEL_8</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-gettitleparentallevels
     */
    GetTitleParentalLevels(ulTitle) {
        result := ComCall(24, this, "uint", ulTitle, "uint*", &pulParentalLevels := 0, "HRESULT")
        return pulParentalLevels
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the root directory that is set in the player.
     * @param {PSTR} pRoot Pointer to the buffer to receive the root string. Note that the root string uses ANSI characters.
     * @param {Integer} ulBufSize Size of buffer passed in, in bytes.
     * @returns {Integer} Pointer to a value containing the size of the actual data returned.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdinfo-getroot
     */
    GetRoot(pRoot, ulBufSize) {
        pRoot := pRoot is String ? StrPtr(pRoot) : pRoot

        result := ComCall(25, this, "ptr", pRoot, "uint", ulBufSize, "uint*", &pulActualSize := 0, "HRESULT")
        return pulActualSize
    }
}

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
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idvdinfo2
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
     * @remarks
     * You can use this method to test whether the DVD Navigator is finished playing in a particular title domain. An application doesn't have to test for the current domain before calling an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcontrol2">IDvdControl2</a> method such as <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playtitle">PlayTitle</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playforwards">PlayForwards</a>, and so on. The DVD Navigator tests for the domain and simply does nothing, returning VFW_E_DVD_INVALIDDOMAIN, if the current command is invalid for the domain.
     * @returns {Integer} Pointer to a variable of type <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a> that receives the current domain.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentdomain
     */
    GetCurrentDomain() {
        result := ComCall(3, this, "int*", &pDomain := 0, "HRESULT")
        return pDomain
    }

    /**
     * The GetCurrentLocation method retrieves the current playback location.
     * @remarks
     * This method retrieves information sufficient to restart playback of a video from the current playback location in titles that don't explicitly disable seeking to the current location. After the disc has been ejected, the information returned by this method will not necessarily be sufficient to restart playback. To save the current location and state information to disc so that the user can return to the same location at any later time, use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getstate">GetState</a>.
     * @returns {DVD_PLAYBACK_LOCATION2} Pointer to a variable of type [DVD_PLAYBACK_LOCATION2](/windows/desktop/api/strmif/ns-strmif-dvd_playback_location2) that receives the playback location information.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentlocation
     */
    GetCurrentLocation() {
        pLocation := DVD_PLAYBACK_LOCATION2()
        result := ComCall(4, this, "ptr", pLocation, "HRESULT")
        return pLocation
    }

    /**
     * The GetTotalTitleTime method retrieves the total playback time for the current title.
     * @remarks
     * The total title time is the time required to play the title sequentially, not counting any stills, pauses, and so on.
     * 
     * This method is for use only with <i>one sequential video titles</i>, which are titles such as movies in which each chapter automatically branches to the next chapter so that the entire title plays continuously without stopping. <i>Nonsequential video titles</i> are titles whose chapters do not automatically play one after another. Because of variations in how DVD authors encode time information on nonsequential video titles, do not use this method to determine the total time for such titles.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not in the title domain.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-gettotaltitletime
     */
    GetTotalTitleTime(pTotalTime, ulTimeCodeFlags) {
        ulTimeCodeFlagsMarshal := ulTimeCodeFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pTotalTime, ulTimeCodeFlagsMarshal, ulTimeCodeFlags, "HRESULT")
        return result
    }

    /**
     * The GetCurrentButton method retrieves the number of available buttons and the number of the currently selected button.
     * @remarks
     * If buttons are not present, both <i>pulButtonsAvailable</i> and <i>pulCurrentButton</i> are set to zero.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentbutton
     */
    GetCurrentButton(pulButtonsAvailable, pulCurrentButton) {
        pulButtonsAvailableMarshal := pulButtonsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentButtonMarshal := pulCurrentButton is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulButtonsAvailableMarshal, pulButtonsAvailable, pulCurrentButtonMarshal, pulCurrentButton, "HRESULT")
        return result
    }

    /**
     * The GetCurrentAngle method retrieves the number of available angles in the current angle block and the currently selected angle number.
     * @remarks
     * Note that angle and menu button indexes are 1-based, while audio and subpicture stream indexes are 0-based. When the DVD Navigator is about to enter an angle block, it sends the application an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-dvd-angles-available">EC_DVD_ANGLES_AVAILABLE</a> event notification with the <i>lParam</i> set to 1. Applications will typically call <c>GetCurrentAngle</c> and <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-selectangle">IDvdControl2::SelectAngle</a> within their event handler for EC_DVD_ANGLES_AVAILABLE.
     * 
     * This method is demonstrated in the DVDSample application in <b>CAngleDlg::MakeAngleList</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentangle
     */
    GetCurrentAngle(pulAnglesAvailable, pulCurrentAngle) {
        pulAnglesAvailableMarshal := pulAnglesAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentAngleMarshal := pulCurrentAngle is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulAnglesAvailableMarshal, pulAnglesAvailable, pulCurrentAngleMarshal, pulCurrentAngle, "HRESULT")
        return result
    }

    /**
     * The GetCurrentAudio method retrieves the number of available audio streams and the number of the currently selected audio stream.
     * @remarks
     * To get the available audio languages on the disc, call <c>GetCurrentAudio</c> and then call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getaudiolanguage">GetAudioLanguage</a> for each stream, starting from zero through (<i>pulStreamsAvailable</i> - 1) to get the language content.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized or not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentaudio
     */
    GetCurrentAudio(pulStreamsAvailable, pulCurrentStream) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, "HRESULT")
        return result
    }

    /**
     * The GetCurrentSubpicture method retrieves the number of available subpicture streams in the current title, the currently selected subpicture stream number, and the state of the subpicture.
     * @remarks
     * DVD content authors can specify that any particular subpicture stream on a disc is <i>forcedly activated</i>, meaning that the DVD authors require this stream to display whether the viewer wants to watch it or not. The DVD Navigator complies with all such commands from the disc, meaning that forcedly activated streams are displayed even if the application has disabled subpicture display with the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setsubpicturestate">IDvdControl2::SetSubpictureState</a> method.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized or not in the Title domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentsubpicture
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
     * @remarks
     * DVD authors can insert UOP commands at almost any place on the disc to disallow a navigation command that would otherwise be permitted within the current DVD domain. In other words, UOP commands enable disc authors to override the usual navigation permissions.
     * 
     * A DVD player application should normally never have to use this method because the DVD Navigator automatically checks all UOP permissions before proceeding with any command, and will return VFW_E_DVD_OPERATION_INHIBITED from any method if the command is invalid under the current UOP. If your application needs to track the current UOP permissions itself, you can call <c>GetCurrentUOPS</c> whenever the current UOP permissions are required, or you can handle the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-dvd-valid-uops-change">EC_DVD_VALID_UOPS_CHANGE</a> event notification in your message loop and retrieve the UOP information from the <i>lParam1</i> parameter. The latter approach is generally more efficient.
     * @returns {Integer} Receives a bitwise [VALID_UOP_FLAG](/windows/desktop/api/strmif/ne-strmif-valid_uop_flag) values. Each bit represents the state (valid or not valid) of a user operation (UOP). If the bit is set, then that user operation is prohibited. See Remarks.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentuops
     */
    GetCurrentUOPS() {
        result := ComCall(10, this, "uint*", &pulUOPs := 0, "HRESULT")
        return pulUOPs
    }

    /**
     * The GetAllSPRMs method retrieves the current contents of all system parameter registers (SPRMs).
     * @remarks
     * The 24 SPRMs are used to hold information on current language, subpicture, and other navigation data.
     * 
     * <div class="alert"><b>Note</b>  A player application does not need to access these read-only registers for any standard navigation functionality. To use these registers effectively, you will probably need a more detailed knowledge of the DVD navigation commands than is provided in this documentation. The following table lists the contents of each register. Bits within the word are referred to as b0 (low order bit) through b15 (high order bit).</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Register
     *             </th>
     * <th>Contents
     *             </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>ISO-639 language code (two lowercase ASCII letters). Default value is undefined.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Low 4 bits (b0-b3) contain audio stream number (0 to 7) or 15 (none). Default value is 15.</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Low 6 bits (b0-b5) contain subpicture stream number (0 to 31) or 62 (none) or 63 (dummy stream for forced subpicture). 7th bit (b6) contains subpicture display flag (0 = don't display subpicture). Default value is 62.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Low 4 bits (b0-b3) contain angle number (1 to 9). Default value is 1.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>Low 7 bits (b0-b6) contain title number (1 to 99). Default value is 1.</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>Low 7 bits (b0-b6) contain title number within current VTS (1 to 99). Default value is 1.</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>Low 15 bits (b0-b14) contain PGC number in current title (1 to 32767). Default value is undefined.</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>Low 10 bits (b0-b9) contain chapter number (1 to 99). Default value is 1. Value undefined unless title is one_sequential_PGC_title.</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>High 6 bits (b10-b15) contain button number (1 to 36). Default value is 1024 (button 1).</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>Timer count, in seconds (0 to 65535). Default value is 0.</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>Low 15 bits (b0-b14) contain PGC number in current title (1 to 32767). Default value is undefined.</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>Six flags (b2: mix ch2 to ch1, b3: mix ch3 to ch1, b4: mix ch4 to ch1, b10 mix ch2 to ch0, b11: mix ch3 to ch0, b12: mix ch4 to ch0). Flag value of 0 means don't mix. Default value for all flags is 0. Value undefined if not playing Karaoke stream.</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>ISO-3166 country/region code (two uppercase ASCII letters) or 65535 (not specified). Default value is undefined.</td>
     * </tr>
     * <tr>
     * <td>13</td>
     * <td>Low 4 bits (b0-b3) contain parental level (1 to 8) or 15 (none). Default value is undefined.</td>
     * </tr>
     * <tr>
     * <td>14</td>
     * <td>b8-b9 contain current video output mode (0 = normal [4:3 or 16:9], 1 = panscan, 2 = letterbox). b10-b11 contain preferred display mode (0 = 4:3, 3 = 16:9). Default value is undefined.</td>
     * </tr>
     * <tr>
     * <td>15</td>
     * <td>Nine flags (b2: SDDS karaoke, b3: DTS karaoke, b4: MPEG karaoke, b6: Dolby Digital karaoke, b7: PCM karaoke, b10: SDDS playback, b11: DTS playback, b12: MPEG playback, b14: Dolby Digital playback). Flag value of 0 means incapable, 1 means capable. Default value is undefined.</td>
     * </tr>
     * <tr>
     * <td>16</td>
     * <td>ISO-639 language code (two lowercase ASCII letters) or 65535 (not specified). Default value is 65535.</td>
     * </tr>
     * <tr>
     * <td>17</td>
     * <td>Language extension code (0 = not specified, 1 = normal audio, 2 = audio for visually impaired, 3 = director comments #1, 4 = director comments #2). Default value is 0.</td>
     * </tr>
     * <tr>
     * <td>18</td>
     * <td>ISO-639 language code (two lowercase ASCII letters) or 65535 (not specified). Default value is 65535.</td>
     * </tr>
     * <tr>
     * <td>19</td>
     * <td>Language extension code (0 = not specified, 1 = normal subtitles, 2 = large subtitles, 3 = subtitles for children, 5 = normal Closed Captions, 6 = large Closed Captions, 7 = Closed Captions for children, 9 = forced subtitles, 13 = director comments, 14 = large director comments, 15 = director comments for children). Default value is 0.</td>
     * </tr>
     * <tr>
     * <td>20</td>
     * <td>Low 8 bits (b0-b7) contain region code (1 to 8).</td>
     * </tr>
     * </table>
     * @returns {Pointer<Integer>} Pointer to an array of type <a href="https://docs.microsoft.com/windows/desktop/DirectShow/sprmarray">SPRMARRAY</a> that receives the address of an array of SPRMs.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getallsprms
     */
    GetAllSPRMs() {
        result := ComCall(11, this, "ptr*", &pRegisterArray := 0, "HRESULT")
        return pRegisterArray
    }

    /**
     * The GetAllGPRMs method retrieves the current contents of all general parameter registers (GPRMs).
     * @remarks
     * GPRMs are 16-bit registers that each disc can use in unique ways for temporary data storage. 
     * 
     * <div class="alert"><b>Note</b>  A player application using the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter does not need to access these registers for any Annex J playback or navigation control. This method is provided for player applications implementing advanced functionality. Do not attempt to modify the GPRMs directly unless you have a thorough knowledge of the DVD specification, and the ways in which the GPRMs are used on the particular discs to be played.</div>
     * <div> </div>
     * @returns {Pointer<Integer>} Pointer to an array of type <a href="https://docs.microsoft.com/windows/desktop/DirectShow/gprmarray">GPRMARRAY</a> that receives all 16 current GPRM values.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getallgprms
     */
    GetAllGPRMs() {
        result := ComCall(12, this, "ptr*", &pRegisterArray := 0, "HRESULT")
        return pRegisterArray
    }

    /**
     * The GetAudioLanguage method retrieves the language of the specified audio stream within the current title.
     * @remarks
     * This method does not return languages for menus. It sets the value pointed to by <i>pLanguage</i> to zero if the stream contains an unknown language. Call the <b>GetLocaleInfo</b> function to create a human-readable string name from <i>pLanguage</i>:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * LCID Language;
     * hr = pDvdInfo-&gt;GetAudioLanguage(ulStream, &amp;Language);
     * if (SUCCEEDED(hr))
     * {
     *     int cchSize = GetLocaleInfo(Language, LOCALE_SENGLANGUAGE, 0, 0);
     *     TCHAR *szString = new TCHAR[cchSize];
     *     if (szString)
     *     {
     *         GetLocaleInfo(Language, LOCALE_SENGLANGUAGE, szString, cchSize);
     *         // ... 
     *         delete [] szString;
     *     }
     * }
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @param {Integer} ulStream Audio stream number for the language being retrieved.
     * @returns {Integer} Receives the language information.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getaudiolanguage
     */
    GetAudioLanguage(ulStream) {
        result := ComCall(13, this, "uint", ulStream, "uint*", &pLanguage := 0, "HRESULT")
        return pLanguage
    }

    /**
     * The GetSubpictureLanguage method retrieves the language of the specified subpicture stream within the current title.
     * @remarks
     * To get the text languages available for a menu, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getmenulanguages">GetMenuLanguages</a>. <c>GetSubpictureLanguage</c> sets the value pointed to by <i>pLanguage</i> to zero if the stream contains an unknown language. Call the Win32 <b>GetLocaleInfo</b> function as follows to create a human-readable string name from <i>pLanguage</i>:
     * 
     * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * LCID Language;
     * hr = pDvdInfo-&gt;GetSubpictureLanguage(ulStream, &amp;Language);
     * if (SUCCEEDED(hr))
     * {
     *     int cchSize = GetLocaleInfo(Language, LOCALE_SENGLANGUAGE, 0, 0);
     *     TCHAR *szString = new TCHAR[cchSize];
     *     if (szString)
     *     {
     *         GetLocaleInfo(Language, LOCALE_SENGLANGUAGE, szString, cchSize);
     *         // ... 
     *         delete [] szString;
     *     }
     * }
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @param {Integer} ulStream Number of the subpicture stream for which the language is being retrieved.
     * @returns {Integer} Pointer to an LCID that receives the locale information. The language information can then be extracted from the LCID by using the Win32 <b>MAKELANGID</b> macro.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getsubpicturelanguage
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
     * @returns {HRESULT} Returns one of the following <c>HRESULT</c> values.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not in the title domain.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-gettitleattributes
     */
    GetTitleAttributes(ulTitle, pMenu, pTitle) {
        result := ComCall(15, this, "uint", ulTitle, "ptr", pMenu, "ptr", pTitle, "HRESULT")
        return result
    }

    /**
     * The GetVMGAttributes method retrieves attributes of all video, audio, and subpicture streams for the Video Manager Menu.
     * @remarks
     * The Video Manager Menu is not associated with any particular title number.
     * @returns {DVD_MenuAttributes} Pointer to a [DVD_MenuAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_menuattributes) structure that receives the attributes.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getvmgattributes
     */
    GetVMGAttributes() {
        pATR := DVD_MenuAttributes()
        result := ComCall(16, this, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetCurrentVideoAttributes method retrieves the video attributes of the current title or menu.
     * @remarks
     * The use of this method is demonstrated in the DVDSample application in <b>CDvdCore::GetVideoAttributes()</b>.
     * @returns {DVD_VideoAttributes} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-dvd_videoattributes">DVD_VideoAttributes</a> structure that receives the attributes.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentvideoattributes
     */
    GetCurrentVideoAttributes() {
        pATR := DVD_VideoAttributes()
        result := ComCall(17, this, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetAudioAttributes method retrieves the attributes of the specified audio stream in the current title or menu.
     * @remarks
     * <i>ulStream</i> can be any index number from 0 through 7 or one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>DVD_DEFAULT_AUDIO_STREAM</td>
     * <td>To query for the attributes of the default audio stream.</td>
     * </tr>
     * <tr>
     * <td>DVD_STREAM_DATA_CURRENT</td>
     * <td>To query the current stream.</td>
     * </tr>
     * <tr>
     * <td>DVD_STREAM_DATA_VMGM</td>
     * <td>To query for the VMGM's audio attributes.</td>
     * </tr>
     * <tr>
     * <td>DVD_STREAM_DATA_VTSM</td>
     * <td>To query for the VTSM's audio attributes.</td>
     * </tr>
     * </table>
     *  
     * 
     * The use of this method is demonstrated in the DVDSample application in <b>CDvdCore::GetAudioAttributes</b> and <b>CAudioLangDlg::GetAudioLang</b>.
     * @param {Integer} ulStream Variable of type ULONG specifying the audio stream whose attributes you wish to query. See Remarks.
     * @returns {DVD_AudioAttributes} Pointer to a [DVD_AudioAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_audioattributes) structure that is filled with the attributes of the specified audio stream.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getaudioattributes
     */
    GetAudioAttributes(ulStream) {
        pATR := DVD_AudioAttributes()
        result := ComCall(18, this, "uint", ulStream, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetKaraokeAttributes method retrieves the karaoke attributes of the specified audio stream in the current title or menu.
     * @remarks
     * This method does not explicitly return the number of channels in the stream. You can obtain that information through a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getaudioattributes">IDvdInfo2::GetAudioAttributes</a>. This method is demonstrated in the DVDSample application in <b>CKaraokeDlg::DoModal</b>.
     * 
     * The <i>ulStream</i> parameter may be a value from 0 through 7, or one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>DVD_STREAM_DATA_CURRENT (0x800)</td>
     * <td>To query the currently selected audio stream.</td>
     * </tr>
     * <tr>
     * <td>DVD_DEFAULT_AUDIO_STREAM</td>
     * <td>To query the default audio stream.</td>
     * </tr>
     * </table>
     * @param {Integer} ulStream Specifies the index of the audio stream whose attributes you want to query. See Remarks.
     * @returns {DVD_KaraokeAttributes} Pointer to a [DVD_KaraokeAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_karaokeattributes) structure that is filled with the karaoke attributes.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getkaraokeattributes
     */
    GetKaraokeAttributes(ulStream) {
        pAttributes := DVD_KaraokeAttributes()
        result := ComCall(19, this, "uint", ulStream, "ptr", pAttributes, "HRESULT")
        return pAttributes
    }

    /**
     * The GetSubpictureAttributes method retrieves the attributes of the specified subpicture stream in the specified title or menu.
     * @remarks
     * The index numbers 0-31 are valid only for titles. Menus have only one subpicture stream, which must be specified using one of the constants in the table below:
     * 
     * <table>
     * <tr>
     * <th>Value
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>DVD_STREAM_DATA_CURRENT (0x800)</td>
     * <td>To query the currently selected subpicture stream.</td>
     * </tr>
     * <tr>
     * <td>DVD_STREAM_DATA_VMGM (0x400)</td>
     * <td>To query the subpicture attributes for the Video Manager or "Top" Menu.</td>
     * </tr>
     * <tr>
     * <td>DVD_STREAM_DATA_VTSM (0x401)</td>
     * <td>To query the subpicture attributes for the currently selected Video Title Set Menu.</td>
     * </tr>
     * </table>
     *  
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::GetSPAttributes()</b> and <b>CSPLangDlg::GetSPLang</b>.
     * @param {Integer} ulStream Index number, from 0 through 31, of the subpicture stream to query. See Remarks.
     * @returns {DVD_SubpictureAttributes} Pointer to a [DVD_SubpictureAttributes](/windows/desktop/api/strmif/ns-strmif-dvd_subpictureattributes) structure that receives the subpicture attributes.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getsubpictureattributes
     */
    GetSubpictureAttributes(ulStream) {
        pATR := DVD_SubpictureAttributes()
        result := ComCall(20, this, "uint", ulStream, "ptr", pATR, "HRESULT")
        return pATR
    }

    /**
     * The GetDVDVolumeInfo method retrieves the current DVD volume information.
     * @remarks
     * Some discs can be distributed as part of multidisc set. "Volume" in this context can mean either "disc" or "disc side", depending on how the disc was authored.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdvolumeinfo
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
     * @remarks
     * Depending on how the disc is authored, the number of languages will be valid either for the entire disc, or only for the current side of the disc.
     * 
     * If the DVD does not contain any text strings, the method succeeds, but <i>pulNumOfLangs</i> receives the value zero.
     * @returns {Integer} Receives the number of text languages.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextnumberoflanguages
     */
    GetDVDTextNumberOfLanguages() {
        result := ComCall(22, this, "uint*", &pulNumOfLangs := 0, "HRESULT")
        return pulNumOfLangs
    }

    /**
     * The GetDVDTextLanguageInfo method retrieves information about the text strings for a specified language. The method retrieves the number of strings for that language, the locale identifier, and the character set.
     * @remarks
     * To get a particular text string, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasunicode">IDvdInfo2::GetDVDTextStringAsUnicode</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasnative">IDvdInfo2::GetDVDTextStringAsNative</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextlanguageinfo
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
     * @remarks
     * This method returns a DVD text string as a raw byte array, with no conversions. You can use this method to get text strings that are encoded using character sets other than Unicode or 7-bit ASCII (ISO/IEC 646), such as JIS Roman Kanji. To find the character set, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextlanguageinfo">IDvdInfo2::GetDVDTextLanguageInfo</a>.
     * 
     * For Unicode and ASCII text strings, you can use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasunicode">IDvdInfo2::GetDVDTextStringAsUnicode</a> method, which returns a wide-character string.
     * 
     * The returned string always includes a single terminating <b>NULL</b> byte. If the buffer is smaller than the length of the DVD text string, the string is truncated. To find the required size of the buffer, call the method once with <i>pchBuffer</i> equal to <b>NULL</b> and <i>ulMaxBufferSize</i> equal to zero. The size is returned in <i>pulActualSize</i>. Then allocate a buffer and call the method again.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasnative
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
     * @remarks
     * This method supports text strings that are encoded as Unicode or 7-bit ASCII (ISO/IEC 646). If the text string uses ASCII encoding, the method converts the string to a wide-character string. If the text string uses any other character set, the method returns E_FAIL. In that case, you can call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasnative">IDvdInfo2::GetDVDTextStringAsNative</a> to retrieve the string as a raw byte array. To find the character set, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdinfo2-getdvdtextlanguageinfo">IDvdInfo2::GetDVDTextLanguageInfo</a>.
     * 
     * The returned string always includes a terminating <b>NULL</b>. If the buffer is smaller than the length of the DVD text string, the string is truncated. To find the required size of the buffer, call the method once with <i>pchBuffer</i> equal to <b>NULL</b> and <i>ulMaxBufferSize</i> equal to zero. The size is returned in <i>pulActualSize</i>. Then allocate a buffer and call the method again.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasunicode
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
     * @remarks
     * Parental management is disabled by default in the DVD Navigator. This method is demonstrated in the DVDSample application in <b>CDvdCore::GetParentalLevel</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getplayerparentallevel
     */
    GetPlayerParentalLevel(pulParentalLevel, pbCountryCode) {
        pulParentalLevelMarshal := pulParentalLevel is VarRef ? "uint*" : "ptr"
        pbCountryCodeMarshal := pbCountryCode is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, pulParentalLevelMarshal, pulParentalLevel, pbCountryCodeMarshal, pbCountryCode, "HRESULT")
        return result
    }

    /**
     * The GetNumberOfChapters method retrieves the number of chapters in a given title.
     * @remarks
     * Call this method to get the number of chapters before calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playchapter">IDvdControl2::PlayChapter</a>, to ensure that you specify a valid chapter number.
     * @param {Integer} ulTitle Specifies the title.
     * @returns {Integer} Receives the number of chapters for the specified title.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getnumberofchapters
     */
    GetNumberOfChapters(ulTitle) {
        result := ComCall(27, this, "uint", ulTitle, "uint*", &pulNumOfChapters := 0, "HRESULT")
        return pulNumOfChapters
    }

    /**
     * The GetTitleParentalLevels method retrieves the parental levels that are defined for a particular title.
     * @remarks
     * A title can contain different parental levels for different sections.
     * @param {Integer} ulTitle Title for which parental levels are requested. Specify 0xfffffff to return the parental levels for the current title.
     * @returns {Integer} Pointer to a variable of type ULONG that receives a bitwise OR combination of [DVD_PARENTAL_LEVEL](/windows/desktop/api/strmif/ne-strmif-dvd_parental_level) values defined for the title.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-gettitleparentallevels
     */
    GetTitleParentalLevels(ulTitle) {
        result := ComCall(28, this, "uint", ulTitle, "uint*", &pulParentalLevels := 0, "HRESULT")
        return pulParentalLevels
    }

    /**
     * The GetDVDDirectory method retrieves the root directory that is set in the DVD Navigator.
     * @remarks
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::GetDriveLetter</b>.
     * @param {PWSTR} pszwPath Pointer to a buffer that receives the path string.
     * @param {Integer} ulMaxSize Size of the buffer, in WCHARs.
     * @returns {Integer} Pointer to a variable that receives the size of actual data returned, in WCHARs.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvddirectory
     */
    GetDVDDirectory(pszwPath, ulMaxSize) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(29, this, "ptr", pszwPath, "uint", ulMaxSize, "uint*", &pulActualSize := 0, "HRESULT")
        return pulActualSize
    }

    /**
     * The IsAudioStreamEnabled method determines if the specified audio stream is enabled in the current title.
     * @remarks
     * A DVD can have up to eight separate audio streams, although typically not all the streams will be enabled for each title. Use <c>IsAudioStreamEnabled</c> to determine whether a particular stream is enabled for the current title, and then call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-selectaudiostream">IDvdControl2::SelectAudioStream</a> to select one of the enabled streams.
     * @param {Integer} ulStreamNum Audio stream number to test.
     * @returns {BOOL} Pointer to a variable of type BOOL that receives a value of <b>TRUE</b> if the audio stream is enabled, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-isaudiostreamenabled
     */
    IsAudioStreamEnabled(ulStreamNum) {
        result := ComCall(30, this, "uint", ulStreamNum, "int*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * The GetDiscID method retrieves a system-generated 64-bit identification number for the specified DVD.
     * @remarks
     * The DVD Navigator calculates an identifier ID based on file sizes, dates, and other information, and not the BCA (burst cutting area) value. This number is guaranteed to be the same each time the disc is played. The ID applies to all replicated copies of a disc. In other words, all copies of a specific movie will have the same ID. The odds that two separate titles will have the same ID is sufficiently remote that this ID can be considered "unique" for all practical purposes.
     * @param {PWSTR} pszwPath Path of the volume to use for the disc ID. Specify <b>NULL</b> to use the current or default DVD volume.
     * @returns {Integer} Receives the 64-bit disc ID.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdiscid
     */
    GetDiscID(pszwPath) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(31, this, "ptr", pszwPath, "uint*", &pullDiscID := 0, "HRESULT")
        return pullDiscID
    }

    /**
     * The GetState method retrieves a bookmark containing the disc location and DVD Navigator state information.
     * @remarks
     * When this method is called, the DVD Navigator creates a new state object and saves the current location into it, as well as the current parental level and other state information. The <b>DVDState</b> object can be used to restore the DVD Navigator to the saved location at a later time through a call to <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setstate">IDvdControl2::SetState</a>. This enables viewers to stop viewing in the middle of a disc, save the location, and come back at some later time to begin viewing where they left off, with all the internal settings restored as they were before.
     * 
     * The DVD Navigator calls <b>AddRef</b> on the <b>DvdState</b> object before returning it to the application. The application must call <b>Release</b> on the object when it is finished with it.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::RestoreBookmark</b>.
     * @returns {IDvdState} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdstate">IDvdState</a> interface of a <b>DvdState</b> object allocated by the DVD Navigator.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getstate
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getmenulanguages
     */
    GetMenuLanguages(pLanguages, ulMaxLanguages, pulActualLanguages) {
        pLanguagesMarshal := pLanguages is VarRef ? "uint*" : "ptr"
        pulActualLanguagesMarshal := pulActualLanguages is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, pLanguagesMarshal, pLanguages, "uint", ulMaxLanguages, pulActualLanguagesMarshal, pulActualLanguages, "HRESULT")
        return result
    }

    /**
     * The GetButtonAtPosition method retrieves the button located at the specified point within the display window.
     * @remarks
     * This method is typically called in response to a mouse pointer move within a DVD menu display window. Be sure to check for success in the <b>HRESULT</b> before trying to retrieve the button number; this method only sets the value of <i>puButtonIndex</i> if a button is found at the specified point. DVD buttons do not necessarily have highlighted rectangles, button rectangles can overlap, and button rectangles do not always correspond to the visual representation of the buttons.
     * @param {POINT} point Current mouse pointer position as retrieved through the Win32 WM_MOUSEMOVE message.
     * @returns {Integer} Receives the index (from 1 through 36) of the button at the current mouse pointer position.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getbuttonatposition
     */
    GetButtonAtPosition(point) {
        result := ComCall(34, this, "ptr", point, "uint*", &pulButtonIndex := 0, "HRESULT")
        return pulButtonIndex
    }

    /**
     * The GetCmdFromEvent method retrieves an IDvdCmd object from an EC_DVD_CMD_START or EC_DVD_CMD_END event.
     * @remarks
     * This method maps the <i>lParam1</i> parameter of an EC_DVD_CMD_START or EC_DVD_CMD_END event into an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that is associated with the command that fired the event. You can then call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcmd-waitforstart">WaitForStart</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcmd-waitforend">WaitForEnd</a> to control the blocking behavior of the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> with respect to that command. The IDvdCmd object is created by the DVD Navigator and the returned pointer has already had its reference count incremented, so you must release it after <b>WaitForStart</b> or <b>WaitForEnd</b> returns.
     * @param {Pointer} lParam1 Event notification's <i>lParam1</i> parameter.
     * @returns {IDvdCmd} Receives a pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> interface that is associated with the command that fired the event.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcmdfromevent
     */
    GetCmdFromEvent(lParam1) {
        result := ComCall(35, this, "ptr", lParam1, "ptr*", &pCmdObj := 0, "HRESULT")
        return IDvdCmd(pCmdObj)
    }

    /**
     * The GetDefaultMenuLanguage method retrieves the default menu language.
     * @returns {Integer} Receives the language information.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdefaultmenulanguage
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdefaultaudiolanguage
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not initialized.
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdefaultsubpicturelanguage
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdecodercaps
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getbuttonrect
     */
    GetButtonRect(ulButton) {
        pRect := RECT()
        result := ComCall(40, this, "uint", ulButton, "ptr", pRect, "HRESULT")
        return pRect
    }

    /**
     * The IsSubpictureStreamEnabled method determines if the specified subpicture stream is enabled in the current title.
     * @remarks
     * A DVD can have up to 32 separate subpicture streams, although typically not all the streams will be enabled for each title. Use <c>IsSubpictureStreamEnabled</c> to determine whether a particular stream is enabled for the current title, and then call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-selectsubpicturestream">IDvdControl2::SelectSubpictureStream</a> to select one of the enabled streams.
     * @param {Integer} ulStreamNum Subpicture stream number to test.
     * @returns {BOOL} Pointer to a variable of type BOOL that receives a value of <b>TRUE</b> if the audio stream is enabled, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-issubpicturestreamenabled
     */
    IsSubpictureStreamEnabled(ulStreamNum) {
        result := ComCall(41, this, "uint", ulStreamNum, "int*", &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }
}

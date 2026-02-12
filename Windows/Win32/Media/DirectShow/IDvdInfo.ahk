#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DVD_PLAYBACK_LOCATION.ahk
#Include .\DVD_ATR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated. (IDvdInfo)
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-idvdinfo
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
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {Integer} Pointer to the current domain that is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a> enumerated type.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentdomain
     */
    GetCurrentDomain() {
        result := ComCall(3, this, "int*", &pDomain := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDomain
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current playback location.
     * @remarks
     * This method retrieves information sufficient to restart playback of a video from the current playback location in titles that don't explicitly disable seeking to the current location.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @returns {DVD_PLAYBACK_LOCATION} Pointer to the retrieved playback location information in a [DVD_PLAYBACK_LOCATION](/windows/desktop/api/strmif/ns-strmif-dvd_playback_location) structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentlocation
     */
    GetCurrentLocation() {
        pLocation := DVD_PLAYBACK_LOCATION()
        result := ComCall(4, this, "ptr", pLocation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pLocation
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the total playback time for the current title.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * The method is restricted to simple linear movies by design.
     * @returns {Integer} Pointer to the total time in [DVD_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_timecode) format, which includes hours, minutes, seconds, and frames.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-gettotaltitletime
     */
    GetTotalTitleTime() {
        result := ComCall(5, this, "uint*", &pulTotalTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulTotalTime
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available buttons and the currently selected button number.
     * @remarks
     * If buttons are not present this method returns zero for both <i>pnButtonsAvailable</i> and <i>pnCurrentButton</i>.
     * 
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentbutton
     */
    GetCurrentButton(pulButtonsAvailable, pulCurrentButton) {
        pulButtonsAvailableMarshal := pulButtonsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentButtonMarshal := pulCurrentButton is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulButtonsAvailableMarshal, pulButtonsAvailable, pulCurrentButtonMarshal, pulCurrentButton, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available angles and the currently selected angle number.
     * @remarks
     * Angles are interleaved video streams that presumably contain the same scene shot from different camera angles.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
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
     * Requested action is not supported on this domain (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentangle
     */
    GetCurrentAngle(pulAnglesAvailable, pulCurrentAngle) {
        pulAnglesAvailableMarshal := pulAnglesAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentAngleMarshal := pulCurrentAngle is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulAnglesAvailableMarshal, pulAnglesAvailable, pulCurrentAngleMarshal, pulCurrentAngle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available audio streams and the number of the currently selected audio stream.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
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
     * Requested action is not supported on this domain (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentaudio
     */
    GetCurrentAudio(pulStreamsAvailable, pulCurrentStream) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of available subpicture streams, the currently selected subpicture stream number, and whether the subpicture display is disabled.
     * @remarks
     * Subpicture streams authored as forcedly activated streams will be displayed even if the application has disabled subpicture display with the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-subpicturestreamchange">IDvdControl::SubpictureStreamChange</a> method.
     * 
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
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
     * Requested action is not supported on this domain (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentsubpicture
     */
    GetCurrentSubpicture(pulStreamsAvailable, pulCurrentStream, pIsDisabled) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"
        pIsDisabledMarshal := pIsDisabled is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, pIsDisabledMarshal, pIsDisabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves which IDvdControl methods are currently valid.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * The value of <i>pUOP</i> is a bit field defined as follows.
     * 
     * <table>
     * <tr>
     * <th>Bit
     *             </th>
     * <th>Flag
     *             </th>
     * <th>User function
     *             </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>UOP_FLAG_Title_Or_Time_Play</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-titleplay">TitlePlay</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-timeplay">TimePlay</a>
     * </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>UOP_FLAG_Chapter_Search_Or_Play</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-chaptersearch">ChapterSearch</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-chapterplay">ChapterPlay</a>
     * </td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>UOP_FLAG_Title_Play</td>
     * <td>TitlePlay</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>UOP_FLAG_Stop</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-stopforresume">StopForResume</a>
     * </td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>UOP_FLAG_GoUp</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-goup">GoUp</a>
     * </td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>UOP_FLAG_Time_Or_Chapter_Search</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-timesearch">TimeSearch</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-chaptersearch">ChapterSearch</a>
     * </td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>UOP_FLAG_Prev_Or_Top_PG_Search</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-prevpgsearch">PrevPGSearch</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-toppgsearch">TopPGSearch</a>
     * </td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>UOP_FLAG_Next_PG_Search</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-nextpgsearch">NextPGSearch</a>
     * </td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>UOP_FLAG_Forward_Scan</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-forwardscan">ForwardScan</a>
     * </td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>UOP_FLAG_Backward_Scan</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-backwardscan">BackwardScan</a>
     * </td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>UOP_FLAG_Title_Menu_Call</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menucall">MenuCall</a> with a parameter value of 2 (DVD_MENU_Title)</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>UOP_FLAG_Root_Menu_Call</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menucall">MenuCall</a> with a parameter value of 3 (DVD_MENU_Root)</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>UOP_FLAG_SubPic_Menu_Call</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menucall">MenuCall</a> with a parameter value of 4 (DVD_MENU_Subpicture)</td>
     * </tr>
     * <tr>
     * <td>13</td>
     * <td>UOP_FLAG_Audio_Menu_Call</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menucall">MenuCall</a> with a parameter value of 5 (DVD_MENU_Audio)</td>
     * </tr>
     * <tr>
     * <td>14</td>
     * <td>UOP_FLAG_Angle_Menu_Call</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menucall">MenuCall</a> with a parameter value of 6 (DVD_MENU_Angle)</td>
     * </tr>
     * <tr>
     * <td>15</td>
     * <td>UOP_FLAG_Chapter_Menu_Call</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menucall">MenuCall</a> with a parameter value of 7 (DVD_MENU_Chapter)</td>
     * </tr>
     * <tr>
     * <td>16</td>
     * <td>UOP_FLAG_Resume</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-resume">Resume</a>
     * </td>
     * </tr>
     * <tr>
     * <td>17</td>
     * <td>UOP_FLAG_Button_Select_Or_Activate</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-upperbuttonselect">UpperButtonSelect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-lowerbuttonselect">LowerButtonSelect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-leftbuttonselect">LeftButtonSelect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-rightbuttonselect">RightButtonSelect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-buttonactivate">ButtonActivate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-buttonselectandactivate">ButtonSelectAndActivate</a>
     * </td>
     * </tr>
     * <tr>
     * <td>18</td>
     * <td>UOP_FLAG_Still_Off</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-stilloff">StillOff</a>
     * </td>
     * </tr>
     * <tr>
     * <td>19</td>
     * <td>UOP_FLAG_Pause_On</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-pauseon">PauseOn</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-menulanguageselect">MenuLanguageSelect</a>
     * </td>
     * </tr>
     * <tr>
     * <td>20</td>
     * <td>UOP_FLAG_Audio_Stream_Change</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-audiostreamchange">AudioStreamChange</a>
     * </td>
     * </tr>
     * <tr>
     * <td>21</td>
     * <td>UOP_FLAG_SubPic_Stream_Change</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-subpicturestreamchange">SubpictureStreamChange</a>
     * </td>
     * </tr>
     * <tr>
     * <td>22</td>
     * <td>UOP_FLAG_Angle_Change</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-anglechange">AngleChange</a>, <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-parentallevelselect">ParentalLevelSelect</a>
     * </td>
     * </tr>
     * <tr>
     * <td>23</td>
     * <td>UOP_FLAG_Karaoke_Audio_Pres_Mode_Change</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-karaokeaudiopresentationmodechange">KaraokeAudioPresentationModeChange</a>
     * </td>
     * </tr>
     * <tr>
     * <td>24</td>
     * <td>UOP_FLAG_Video_Pres_Mode_Change</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol-videomodepreferrence">VideoModePreferrence</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This method is useful because DVD titles can enable or disable individual user operations at almost any point during playback.
     * @returns {Integer} Pointer to a <b>DWORD</b> value containing bits for all user operations (UOP). Each bit in the <b>DWORD</b> represents the state (valid or not valid) of a user operation. If the bit corresponding to a user operation is set, then that user operation is prohibited. For more information, see Remarks.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentuops
     */
    GetCurrentUOPS() {
        result := ComCall(10, this, "uint*", &pUOP := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pUOP
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current contents of all system parameter registers (SPRMs).
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * For use of individual registers, see the DVD-Video specification.
     * @returns {Pointer<Integer>} Pointer to the retrieved array of system parameter registers.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getallsprms
     */
    GetAllSPRMs() {
        result := ComCall(11, this, "ptr*", &pRegisterArray := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRegisterArray
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current contents of all general parameter registers (GPRMs).
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * Use of GPRMs is title specific. GPRMs are general parameter registers. For an explanation of GPRMs, see the DVD specifications.
     * @returns {Pointer<Integer>} Pointer to the retrieved array of general parameter registers.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getallgprms
     */
    GetAllGPRMs() {
        result := ComCall(12, this, "ptr*", &pRegisterArray := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pRegisterArray
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the language of the specified audio stream within the current title.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * This method does not return languages for menus. This method sets the value pointed to by <i>pLanguage</i> to zero if the stream does not include language. Call the Win32 <b>GetLocaleInfo</b> function as follows to create a human-readable string name from <i>pLanguage</i>. LOCALE_SENGLANGUAGE is the locale information type, pszString is a pointer to a buffer to receive the requested data, and cbSize specifies the size of pszString.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * GetLocaleInfo(*pLanguage, LOCALE_SENGLANGUAGE, pszString, cbSize);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @param {Integer} ulStream Stream number.
     * @returns {Integer} Pointer to the retrieved language.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getaudiolanguage
     */
    GetAudioLanguage(ulStream) {
        result := ComCall(13, this, "uint", ulStream, "uint*", &pLanguage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pLanguage
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the language of the specified subpicture stream within the current title.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * This method does not return languages for menus. This method sets the value pointed to by <i>pLanguage</i> to zero if the stream does not include language. Call the Win32 <b>GetLocaleInfo</b> function as follows to create a human-readable string name from <i>pLanguage</i>. LOCALE_SENGLANGUAGE is the locale information type, pszString is a pointer to a buffer to receive the requested data, and cbSize specifies the size of pszString.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * GetLocaleInfo(*pLanguage, LOCALE_SENGLANGUAGE, pszString, cbSize);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @param {Integer} ulStream Stream number.
     * @returns {Integer} Pointer to the retrieved language.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getsubpicturelanguage
     */
    GetSubpictureLanguage(ulStream) {
        result := ComCall(14, this, "uint", ulStream, "uint*", &pLanguage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pLanguage
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves attributes of all video, audio, and subpicture streams for the specified title, including menus.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulTitle Requested title number. Specify 0xFFFFFFFF for the current title.
     * @returns {DVD_ATR} Pointer to the retrieved attributes structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-gettitleattributes
     */
    GetTitleAttributes(ulTitle) {
        pATR := DVD_ATR()
        result := ComCall(15, this, "uint", ulTitle, "ptr", pATR, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves attributes of all video, audio, and subpicture streams for video manager (VMG) menus.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * The video manager contains a separate group of streams, such as the DVD_MENU_Title menus (see [DVD_MENU_ID](/windows/desktop/api/strmif/ne-strmif-dvd_menu_id)), and the streams are not associated with any particular title number.
     * @returns {DVD_ATR} Pointer to the retrieved attributes structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getvmgattributes
     */
    GetVMGAttributes() {
        pATR := DVD_ATR()
        result := ComCall(16, this, "ptr", pATR, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current video attributes for the current title or menu.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * For information about DVD_VideoATR, see the DVD-Video specification.
     * @returns {Pointer<Integer>} Pointer to the retrieved video attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentvideoattributes
     */
    GetCurrentVideoAttributes() {
        result := ComCall(17, this, "ptr*", &pATR := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the attributes for the current audio stream in the current title or menu.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * For information about the DVD_AudioATR data type, consult the DVD-Video specification.
     * @returns {Pointer<Integer>} Pointer to the retrieved audio attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentaudioattributes
     */
    GetCurrentAudioAttributes() {
        result := ComCall(18, this, "ptr*", &pATR := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the attributes for the current subpicture stream in the current title or menu.
     * @remarks
     * This method returns an error unless the domain is DVD_DOMAIN_VideoManagerMenu, DVD_DOMAIN_VideoTitleSetMenu, or DVD_DOMAIN_Title. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * For information about DVD_SubpictureATR, see the DVD-Video specification.
     * @returns {Pointer<Integer>} Pointer to the retrieved subpicture attributes.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentsubpictureattributes
     */
    GetCurrentSubpictureAttributes() {
        result := ComCall(19, this, "ptr*", &pATR := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pATR
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current DVD volume information.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
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
     * Requested action is not supported on this domain (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getcurrentvolumeinfo
     */
    GetCurrentVolumeInfo(pulNumOfVol, pulThisVolNum, pSide, pulNumOfTitles) {
        pulNumOfVolMarshal := pulNumOfVol is VarRef ? "uint*" : "ptr"
        pulThisVolNumMarshal := pulThisVolNum is VarRef ? "uint*" : "ptr"
        pSideMarshal := pSide is VarRef ? "int*" : "ptr"
        pulNumOfTitlesMarshal := pulNumOfTitles is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, pulNumOfVolMarshal, pulNumOfVol, pulThisVolNumMarshal, pulThisVolNum, pSideMarshal, pSide, pulNumOfTitlesMarshal, pulNumOfTitles, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the TXTDT_MG structure, which can contain text descriptions for title name, volume name, producer name, vocalist name, and so on, in various languages.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * If the supplied buffer size in <i>cbBufSize</i> is too small for the data, (for example if <i>cbBufSize</i> equals zero), then this method returns E_OUTOFMEMORY and sets the value pointed to by <i>pcbActualSize</i> to the required size.
     * 
     * For more information, refer to Section 4.1.6 and Annex A of the DVD-Video specification.
     * @param {Pointer} pTextManager Pointer to the retrieved text manager.
     * @param {Integer} ulBufSize Size of the buffer for <i>pTextManager</i>, in bytes.
     * @returns {Integer} Pointer to a value containing the number of bytes of data returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getdvdtextinfo
     */
    GetDVDTextInfo(pTextManager, ulBufSize) {
        result := ComCall(21, this, "ptr", pTextManager, "uint", ulBufSize, "uint*", &pulActualSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulActualSize
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the current parental level and country/region code settings for the DVD player.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * 
     * For the defined parental levels, see Table 3.3.4-1 of the DVD-Video specification.
     * 
     * Valid parental levels are 1 through 8 if parental management is enabled, 0xffffffff if parental management is disabled.
     * 
     * For the country/region codes, see ISO3166 : Alpha-2 Code.
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
     * Requested action is not supported on this domain (<a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>).
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getplayerparentallevel
     */
    GetPlayerParentalLevel(pulParentalLevel, pulCountryCode) {
        pulParentalLevelMarshal := pulParentalLevel is VarRef ? "uint*" : "ptr"
        pulCountryCodeMarshal := pulCountryCode is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pulParentalLevelMarshal, pulParentalLevel, pulCountryCodeMarshal, pulCountryCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the number of chapters that are defined for a given title.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
     * @param {Integer} ulTitle Title for which to retrieve the number of chapters.
     * @returns {Integer} Pointer to the retrieved number of chapters for the specified title.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getnumberofchapters
     */
    GetNumberOfChapters(ulTitle) {
        result := ComCall(23, this, "uint", ulTitle, "uint*", &pulNumberOfChapters := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulNumberOfChapters
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the parental levels that are defined for a particular title.
     * @remarks
     * This method is valid in any domain. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_domain">DVD_DOMAIN</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-gettitleparentallevels
     */
    GetTitleParentalLevels(ulTitle) {
        result := ComCall(24, this, "uint", ulTitle, "uint*", &pulParentalLevels := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulParentalLevels
    }

    /**
     * Note  The IDvdInfo interface is deprecated. Use IDvdInfo2 instead. Retrieves the root directory that is set in the player.
     * @remarks
     * If a valid root was found, this method returns the root string. Otherwise, it returns zero for <i>pcbActualSize</i>, indicating that a valid root directory has not been found or initialized.
     * @param {PSTR} pRoot Pointer to the buffer to receive the root string. Note that the root string uses ANSI characters.
     * @param {Integer} ulBufSize Size of buffer passed in, in bytes.
     * @returns {Integer} Pointer to a value containing the size of the actual data returned.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdinfo-getroot
     */
    GetRoot(pRoot, ulBufSize) {
        pRoot := pRoot is String ? StrPtr(pRoot) : pRoot

        result := ComCall(25, this, "ptr", pRoot, "uint", ulBufSize, "uint*", &pulActualSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pulActualSize
    }
}

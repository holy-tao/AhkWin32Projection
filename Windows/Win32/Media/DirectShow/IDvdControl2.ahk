#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDvdCmd.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdControl2 interface navigates and plays DVD-Video titles.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdcontrol2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdControl2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdControl2
     * @type {Guid}
     */
    static IID => Guid("{33bc7430-eec0-11d2-8201-00a0c9d74842}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PlayTitle", "PlayChapterInTitle", "PlayAtTimeInTitle", "Stop", "ReturnFromSubmenu", "PlayAtTime", "PlayChapter", "PlayPrevChapter", "ReplayChapter", "PlayNextChapter", "PlayForwards", "PlayBackwards", "ShowMenu", "Resume", "SelectRelativeButton", "ActivateButton", "SelectButton", "SelectAndActivateButton", "StillOff", "Pause", "SelectAudioStream", "SelectSubpictureStream", "SetSubpictureState", "SelectAngle", "SelectParentalLevel", "SelectParentalCountry", "SelectKaraokeAudioPresentationMode", "SelectVideoModePreference", "SetDVDDirectory", "ActivateAtPosition", "SelectAtPosition", "PlayChaptersAutoStop", "AcceptParentalLevelChange", "SetOption", "SetState", "PlayPeriodInTitleAutoStop", "SetGPRM", "SelectDefaultMenuLanguage", "SelectDefaultAudioLanguage", "SelectDefaultSubpictureLanguage"]

    /**
     * The PlayTitle method starts playback from the beginning of the specified title.
     * @param {Integer} ulTitle Value that specifies the title number; this value must be from 1 through 99.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playtitle
     */
    PlayTitle(ulTitle, dwFlags) {
        result := ComCall(3, this, "uint", ulTitle, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayChapterInTitle method starts playback from the beginning of the specified chapter of the specified title.
     * @param {Integer} ulTitle Value that specifies the title in which the chapter is located; this value must be from 1 through 99.
     * @param {Integer} ulChapter Value that specifies the chapter in the specified title where the DVD Navigator will start playback; this value must be from 1 through 999.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playchapterintitle
     */
    PlayChapterInTitle(ulTitle, ulChapter, dwFlags) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayAtTimeInTitle method starts playback from the specified time in the specified title.
     * @param {Integer} ulTitle Value that specifies the number of the title to play; this value must be from 1 through 99.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pStartTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies where playback will begin.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playattimeintitle
     */
    PlayAtTimeInTitle(ulTitle, pStartTime, dwFlags) {
        result := ComCall(5, this, "uint", ulTitle, "ptr", pStartTime, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The Stop method stops playback of a title or menu by moving the DVD Navigator into the DVD Stop domain.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-stop
     */
    Stop() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The ReturnFromSubmenu method returns the display from a submenu to its parent menu.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-returnfromsubmenu
     */
    ReturnFromSubmenu(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayAtTime method starts playback from the specified time in the current title.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies the time at which to start playback.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playattime
     */
    PlayAtTime(pTime, dwFlags) {
        result := ComCall(8, this, "ptr", pTime, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayChapter method starts playback from the specified chapter in the current title.
     * @param {Integer} ulChapter Value that specifies the chapter in the current title where the DVD Navigator will start playback; this value must be from 1 through 999.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playchapter
     */
    PlayChapter(ulChapter, dwFlags) {
        result := ComCall(9, this, "uint", ulChapter, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayPrevChapter method starts playback from the beginning of the previous chapter in the current title.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playprevchapter
     */
    PlayPrevChapter(dwFlags) {
        result := ComCall(10, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The ReplayChapter method starts playback from the beginning of the current chapter.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-replaychapter
     */
    ReplayChapter(dwFlags) {
        result := ComCall(11, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayNextChapter method starts playback from the beginning of the next chapter in the current title.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playnextchapter
     */
    PlayNextChapter(dwFlags) {
        result := ComCall(12, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayForwards method plays forward at the specified speed from the current location.
     * @param {Float} dSpeed Value that specifies the playback speed. This value is a multiplier, where 1.0 is the authored speed, so a value of 2.5 plays at two and one-half times the authored speed, while a value of 0.5 plays at half the authored speed. The actual speed of playback depends on the capabilities of the video decoder. Values below 0.00001 are converted to 0.00001.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playforwards
     */
    PlayForwards(dSpeed, dwFlags) {
        result := ComCall(13, this, "double", dSpeed, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayBackwards method plays backward at the specified speed from the current location.
     * @param {Float} dSpeed Value that specifies the speed of backward play. This value is a multiplier, where 1.0 is the authored speed. So, a value of 2.5 plays backward at two and one-half times the authored speed, while a value of 0.5 plays backward at half the authored speed. The actual speed of playback depends on the video decoder's capabilities and might differ from the specified rate. For reverse play, audio is muted and no subpicture is displayed. Any speed below 0.00001 is converted to 0.00001.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playbackwards
     */
    PlayBackwards(dSpeed, dwFlags) {
        result := ComCall(14, this, "double", dSpeed, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The ShowMenu method displays the specified menu, if available.
     * @param {Integer} MenuID A <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_menu_id">DVD_MENU_ID</a> enumeration value that specifies the menu to display.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-showmenu
     */
    ShowMenu(MenuID, dwFlags) {
        result := ComCall(15, this, "int", MenuID, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The Resume method leaves a menu and resumes playback.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-resume
     */
    Resume(dwFlags) {
        result := ComCall(16, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectRelativeButton method sets the specified relative button (upper, lower, right, or left).
     * @param {Integer} buttonDir [DVD_RELATIVE_BUTTON](/windows/desktop/api/strmif/ne-strmif-dvd_relative_button) enumeration value indicating the button to select.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in a valid domain.
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
     * UOP control prohibits the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectrelativebutton
     */
    SelectRelativeButton(buttonDir) {
        result := ComCall(17, this, "int", buttonDir, "HRESULT")
        return result
    }

    /**
     * The ActivateButton method activates the currently selected menu button.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DVD Navigator is in an invalid domain.
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
     * UOP control prohibits the DVD Navigator from entering a paused state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_NO_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No button is selected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-activatebutton
     */
    ActivateButton() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * The SelectButton method selects the specified menu button.
     * @param {Integer} ulButton Value from 1 through 36 that specifies the button to select.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DVD Navigator is in an invalid domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_NO_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No button is selected.
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
     * UOP control prohibits the <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> from entering a paused state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectbutton
     */
    SelectButton(ulButton) {
        result := ComCall(19, this, "uint", ulButton, "HRESULT")
        return result
    }

    /**
     * The SelectAndActivateButton method selects and activates the specified menu button.
     * @param {Integer} ulButton Value from 1 through 36 that specifies the button to select and activate.
     * @returns {HRESULT} Returns one of the following values.
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
     * <i>ulButton</i> is out of range.
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
     * The <i>ulButton</i> value is valid, but the <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter couldn't activate it.
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
     * UOP control prohibits the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectandactivatebutton
     */
    SelectAndActivateButton(ulButton) {
        result := ComCall(20, this, "uint", ulButton, "HRESULT")
        return result
    }

    /**
     * The StillOff method resumes playback, canceling still mode.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is in a menu domain and the menu has buttons.
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
     * Invalid domain.
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
     * UOP control prohibits the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-stilloff
     */
    StillOff() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * Note  This method is deprecated. Applications should call IMediaControl::Pause instead. For more information, see Data Flow in the DVD Navigator. The Pause method pauses or resumes playback at the current location.
     * @param {BOOL} bState Value of type Boolean that specifies whether to pause playback; <b>TRUE</b> means to pause.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid domain.
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
     * UOP control prohibits the DVD Navigator from entering a paused state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-pause
     */
    Pause(bState) {
        result := ComCall(22, this, "int", bState, "HRESULT")
        return result
    }

    /**
     * The SelectAudioStream method selects the audio stream to play.
     * @param {Integer} ulAudio Value that specifies the audio stream. Valid stream numbers are 0 through 7, or <b>DVD_DEFAULT_AUDIO_STREAM</b> to specify the default stream.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command. This parameter is currently ignored; use DVD_CMD_FLAG_None.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectaudiostream
     */
    SelectAudioStream(ulAudio, dwFlags) {
        result := ComCall(23, this, "uint", ulAudio, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectSubpictureStream method sets the subpicture stream to display.
     * @param {Integer} ulSubPicture Value that specifies the subpicture stream, which must be from 0 through 31, or 63.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0-31</td>
     * <td>The stream is valid.</td>
     * </tr>
     * <tr>
     * <td>63</td>
     * <td>The stream is the <i>dummy stream</i>, which means it is a muted, low-bitrate stream.</td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectsubpicturestream
     */
    SelectSubpictureStream(ulSubPicture, dwFlags) {
        result := ComCall(24, this, "uint", ulSubPicture, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The SetSubpictureState method turns the subpicture display on or off.
     * @param {BOOL} bState Boolean value that specifies whether the subpicture display is on; <b>TRUE</b> sets subpicture display on for subsequent playback.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-setsubpicturestate
     */
    SetSubpictureState(bState, dwFlags) {
        result := ComCall(25, this, "int", bState, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectAngle method sets the new angle when the DVD Navigator is in an angle block.
     * @param {Integer} ulAngle Value of the new angle, which must be from 1 through 9.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectangle
     */
    SelectAngle(ulAngle, dwFlags) {
        result := ComCall(26, this, "uint", ulAngle, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectParentalLevel method sets the parental access level for the logged-on user.
     * @param {Integer} ulParentalLevel Value that specifies the parental access level for the current user. For details, see Remarks.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectparentallevel
     */
    SelectParentalLevel(ulParentalLevel) {
        result := ComCall(27, this, "uint", ulParentalLevel, "HRESULT")
        return result
    }

    /**
     * The SelectParentalCountry method sets the country/region for interpreting parental access levels and setting default languages.
     * @param {Pointer<Integer>} bCountry Array of bytes that specifies the current country/region according to ISO 3166.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectparentalcountry
     */
    SelectParentalCountry(bCountry) {
        bCountryMarshal := bCountry is VarRef ? "char*" : "ptr"

        result := ComCall(28, this, bCountryMarshal, bCountry, "HRESULT")
        return result
    }

    /**
     * The SelectKaraokeAudioPresentationMode method sends karaoke auxiliary channels to the left or right speakers.
     * @param {Integer} ulMode Bitwise OR of [DVD_KARAOKE_DOWNMIX](/windows/desktop/api/strmif/ne-strmif-dvd_karaoke_downmix) enumeration indicating how to downmix the five karaoke channels to channels 0 and 1, which are usually output to the left and right speakers.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>E_PROP_SET_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The audio decoder does not support downmixing.
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
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is in an invalid domain.
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
     * UOP control prohibits the current operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectkaraokeaudiopresentationmode
     */
    SelectKaraokeAudioPresentationMode(ulMode) {
        result := ComCall(29, this, "uint", ulMode, "HRESULT")
        return result
    }

    /**
     * The SelectVideoModePreference method sets the specified video mode display (wide screen, letterbox, or pan-scan) for playback.
     * @param {Integer} ulPreferredDisplayMode Value that specifies the new display mode for DVD content. Member of the [DVD_PREFERRED_DISPLAY_MODE](/windows/desktop/api/strmif/ne-strmif-dvd_preferred_display_mode) enumeration.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid domain.
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
     * UOP control prohibits the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectvideomodepreference
     */
    SelectVideoModePreference(ulPreferredDisplayMode) {
        result := ComCall(30, this, "uint", ulPreferredDisplayMode, "HRESULT")
        return result
    }

    /**
     * The SetDVDDirectory method sets the DVD drive that the DVD Navigator filter will read from.
     * @param {PWSTR} pszwPath Pointer to a wide-character string that specifies the path of the root directory.
     * @returns {HRESULT} Returns one of the following values.
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
     * The <i>pszwPath</i> parameter points to an invalid DVD path, or a DVD drive is not found while enumerating.
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
     * The DVD Navigator is not initialized.
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
     * Invalid domain. For details, see Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-setdvddirectory
     */
    SetDVDDirectory(pszwPath) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(31, this, "ptr", pszwPath, "HRESULT")
        return result
    }

    /**
     * The ActivateAtPosition method activates the menu button under the mouse pointer position.
     * @param {POINT} point Point on the client window area, in screen pixel coordinates.
     * @returns {HRESULT} Returns one of the following values.
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
     * The click occurred in the highlighted button rectangle, and the button was successfully activated.
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
     * The point lies outside the valid video region.
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
     * The button is present but is not working.
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
     * The DVD Navigator is not in a menu domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_DVD_NO_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no menu button under the mouse pointer position.
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
     * The operation is inhibited by user operation (UOP) control.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-activateatposition
     */
    ActivateAtPosition(point) {
        result := ComCall(32, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * The SelectAtPosition method highlights the menu button under the mouse pointer position.
     * @param {POINT} point Point on the screen, in screen pixel coordinates.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_NO_BUTTON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No button is present at the mouse pointer position.
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
     * The DVD Navigator is in the Stop domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectatposition
     */
    SelectAtPosition(point) {
        result := ComCall(33, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * The PlayChaptersAutoStop method plays the number of chapters specified, starting at the specified chapter within the specified title.
     * @param {Integer} ulTitle Value that specifies the title in which the chapter is located; this value must be from 1 through 99.
     * @param {Integer} ulChapter Value that specifies the chapter in the specified title where the DVD Navigator will start playback; this value must be from 1 through 999.
     * @param {Integer} ulChaptersToPlay Number of chapters to play from the start chapter.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playchaptersautostop
     */
    PlayChaptersAutoStop(ulTitle, ulChapter, ulChaptersToPlay, dwFlags) {
        result := ComCall(34, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The AcceptParentalLevelChange method accepts or rejects a request from the DVD Navigator to play content at a higher parental management level.
     * @param {BOOL} bAccept Flag that indicates whether the application accepts the parental management level change. Specify <b>TRUE</b> to accept the change and play the higher-level content, or <b>FALSE</b> to reject the change.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-acceptparentallevelchange
     */
    AcceptParentalLevelChange(bAccept) {
        result := ComCall(35, this, "int", bAccept, "HRESULT")
        return result
    }

    /**
     * The SetOption method enables or disables an internal behavior flag on the DVD Navigator filter.
     * @param {Integer} flag Specifies which behavior to modify, as a member of the [DVD_OPTION_FLAG](/windows/desktop/api/strmif/ne-strmif-dvd_option_flag) enumeration type.
     * @param {BOOL} fState Specifies the new value of the option given in the <i>flag</i> parameter.
     * 
     * [DVD_OPTION_FLAG](/windows/desktop/api/strmif/ne-strmif-dvd_option_flag) reference page.
     *           </div>
     * <div> </div>
     * @returns {HRESULT} Returns one of the following values.
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
     * Invalid flag.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-setoption
     */
    SetOption(flag, fState) {
        result := ComCall(36, this, "int", flag, "int", fState, "HRESULT")
        return result
    }

    /**
     * The SetState method saves the current disc position and state of the DVD Navigator filter.
     * @param {IDvdState} pState Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdstate">IDvdState</a> interface on the object that contains the state information.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-setstate
     */
    SetState(pState, dwFlags) {
        result := ComCall(37, this, "ptr", pState, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayPeriodInTitleAutoStop method starts playback in the specified title from the specified start time until the specified end time.
     * @param {Integer} ulTitle Value that specifies the title; this value must be from 1 through 99.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pStartTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies the time at which to start playing.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pEndTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies the time at which to stop playing.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-playperiodintitleautostop
     */
    PlayPeriodInTitleAutoStop(ulTitle, pStartTime, pEndTime, dwFlags) {
        result := ComCall(38, this, "uint", ulTitle, "ptr", pStartTime, "ptr", pEndTime, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The SetGPRM method sets a general parameter register value.
     * @param {Integer} ulIndex Register index; may be a value from zero through 15.
     * @param {Integer} wValue A 16-bit value contained in the specified register.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-setgprm
     */
    SetGPRM(ulIndex, wValue, dwFlags) {
        result := ComCall(39, this, "uint", ulIndex, "ushort", wValue, "uint", dwFlags, "ptr*", &ppCmd := 0, "HRESULT")
        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectDefaultMenuLanguage method sets the default language for all menus and menu buttons.
     * @param {Integer} Language Variable of type LCID that specifies the default language.
     * @returns {HRESULT} Returns one of the following values.
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
     * <dt><b>VFW_E_DVD_INVALIDDOMAIN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectdefaultmenulanguage
     */
    SelectDefaultMenuLanguage(Language) {
        result := ComCall(40, this, "uint", Language, "HRESULT")
        return result
    }

    /**
     * The SelectDefaultAudioLanguage method sets the default audio language.
     * @param {Integer} Language Locale identifier that specifies the default language.
     * @param {Integer} audioExtension [DVD_AUDIO_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_audio_lang_ext) enumeration that specifies the default audio language extension.
     * @returns {HRESULT} Returns one of the following values.
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
     * The <i>audioExtension</i> value is invalid.
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
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in the Stop domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectdefaultaudiolanguage
     */
    SelectDefaultAudioLanguage(Language, audioExtension) {
        result := ComCall(41, this, "uint", Language, "int", audioExtension, "HRESULT")
        return result
    }

    /**
     * The SelectDefaultSubpictureLanguage method sets the default language for subpicture text.
     * @param {Integer} Language Locale identifier that specifies the default language.
     * @param {Integer} subpictureExtension [DVD_SUBPICTURE_LANG_EXT](/windows/desktop/api/strmif/ne-strmif-dvd_subpicture_lang_ext) enumeration that specifies the default subpicture extension.
     * @returns {HRESULT} Returns one of the following values.
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
     * <i>Language</i> is invalid.
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
     * The <a href="/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvdcontrol2-selectdefaultsubpicturelanguage
     */
    SelectDefaultSubpictureLanguage(Language, subpictureExtension) {
        result := ComCall(42, this, "uint", Language, "int", subpictureExtension, "HRESULT")
        return result
    }
}

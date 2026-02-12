#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDvdCmd.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdControl2 interface navigates and plays DVD-Video titles.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-idvdcontrol2
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
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Title_Play</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulTitle Value that specifies the title number; this value must be from 1 through 99.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playtitle
     */
    PlayTitle(ulTitle, dwFlags) {
        result := ComCall(3, this, "uint", ulTitle, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayChapterInTitle method starts playback from the beginning of the specified chapter of the specified title.
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::PlayChapterInTitle</b>.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>PTT_Play</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulTitle Value that specifies the title in which the chapter is located; this value must be from 1 through 99.
     * @param {Integer} ulChapter Value that specifies the chapter in the specified title where the DVD Navigator will start playback; this value must be from 1 through 999.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playchapterintitle
     */
    PlayChapterInTitle(ulTitle, ulChapter, dwFlags) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayAtTimeInTitle method starts playback from the specified time in the specified title.
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J command name
     *             </td>
     * <td>Valid domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Time_Play</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulTitle Value that specifies the number of the title to play; this value must be from 1 through 99.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pStartTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies where playback will begin.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playattimeintitle
     */
    PlayAtTimeInTitle(ulTitle, pStartTime, dwFlags) {
        result := ComCall(5, this, "uint", ulTitle, "ptr", pStartTime, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The Stop method stops playback of a title or menu by moving the DVD Navigator into the DVD Stop domain.
     * @remarks
     * Calling this method puts the DVD Navigator into the Stop domain, but the DVD filter graph as a whole remains in a running state, ready to play at any time. From the Stop, domain the user can display a menu or initiate playback directly through any "Play" method.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Stop</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_FirstPlay</li>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-stop
     */
    Stop() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReturnFromSubmenu method returns the display from a submenu to its parent menu.
     * @remarks
     * If the DVD Navigator is at the top-level menu, this method calls the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-resume">IDvdControl2::Resume</a> method so that play continues where it left off.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>GoUP</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-returnfromsubmenu
     */
    ReturnFromSubmenu(dwFlags) {
        result := ComCall(7, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayAtTime method starts playback from the specified time in the current title.
     * @remarks
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::PlayTime</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Time_Search</td>
     * <td>DVD_DOMAIN_Title</td>
     * </tr>
     * </table>
     * @param {Pointer<DVD_HMSF_TIMECODE>} pTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies the time at which to start playback.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playattime
     */
    PlayAtTime(pTime, dwFlags) {
        result := ComCall(8, this, "ptr", pTime, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayChapter method starts playback from the specified chapter in the current title.
     * @remarks
     * The DVD Navigator begins playback at the specified chapter and continues to the subsequent chapters. Use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playchaptersautostop">IDvdControl2::PlayChaptersAutoStop</a> to play the current chapter only.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::PlayChapter</b>.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>PTT_Search</td>
     * <td>DVD_DOMAIN_Title</td>
     * </tr>
     * </table>
     * @param {Integer} ulChapter Value that specifies the chapter in the current title where the DVD Navigator will start playback; this value must be from 1 through 999.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playchapter
     */
    PlayChapter(ulChapter, dwFlags) {
        result := ComCall(9, this, "uint", ulChapter, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayPrevChapter method starts playback from the beginning of the previous chapter in the current title.
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::PrevChapter</b>.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>PrevPG_Search</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playprevchapter
     */
    PlayPrevChapter(dwFlags) {
        result := ComCall(10, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The ReplayChapter method starts playback from the beginning of the current chapter.
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>TopPG_Search</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-replaychapter
     */
    ReplayChapter(dwFlags) {
        result := ComCall(11, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayNextChapter method starts playback from the beginning of the next chapter in the current title.
     * @remarks
     * After playing the next chapter, the DVD Navigator continues playing, following the branching instructions on the disc. To play only the next chapter, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-playchaptersautostop">IDvdControl2::PlayChaptersAutoStop</a>.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::NextChapter</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>NextPG_Search</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playnextchapter
     */
    PlayNextChapter(dwFlags) {
        result := ComCall(12, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayForwards method plays forward at the specified speed from the current location.
     * @remarks
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::FastForward</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Forward_Scan</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Float} dSpeed Value that specifies the playback speed. This value is a multiplier, where 1.0 is the authored speed, so a value of 2.5 plays at two and one-half times the authored speed, while a value of 0.5 plays at half the authored speed. The actual speed of playback depends on the capabilities of the video decoder. Values below 0.00001 are converted to 0.00001.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playforwards
     */
    PlayForwards(dSpeed, dwFlags) {
        result := ComCall(13, this, "double", dSpeed, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayBackwards method plays backward at the specified speed from the current location.
     * @remarks
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::Rewind</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Backward_Scan</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Float} dSpeed Value that specifies the speed of backward play. This value is a multiplier, where 1.0 is the authored speed. So, a value of 2.5 plays backward at two and one-half times the authored speed, while a value of 0.5 plays backward at half the authored speed. The actual speed of playback depends on the video decoder's capabilities and might differ from the specified rate. For reverse play, audio is muted and no subpicture is displayed. Any speed below 0.00001 is converted to 0.00001.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playbackwards
     */
    PlayBackwards(dSpeed, dwFlags) {
        result := ComCall(14, this, "double", dSpeed, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The ShowMenu method displays the specified menu, if available.
     * @remarks
     * The Video Manager Menu (VMGM) should be accessible from the Title or the Video Title Set domains. The Video Title Set menus (VTSMs) might only be accessible through the VMGM. Any submenus under each VTSM (for chapters, angles, and audio and subpicture streams) are only accessible through that VTSM.
     * 
     * This method is demonstrated in the DVDSample application application in <b>CDvdCore::RootMenu</b> and <b>CDvdCore::TitleMenu</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Menu_Call</td>
     * <td>All.</td>
     * </tr>
     * </table>
     * @param {Integer} MenuID A <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_menu_id">DVD_MENU_ID</a> enumeration value that specifies the menu to display.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-showmenu
     */
    ShowMenu(MenuID, dwFlags) {
        result := ComCall(15, this, "int", MenuID, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The Resume method leaves a menu and resumes playback.
     * @remarks
     * This method returns to playback from the location where play left off.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::RootMenu</b> and <b>CDvdCore::TitleMenu</b>.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Resume</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-resume
     */
    Resume(dwFlags) {
        result := ComCall(16, this, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectRelativeButton method sets the specified relative button (upper, lower, right, or left).
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>(Left/Right/Upper/Lower)_Button_Select</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in a valid domain.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectrelativebutton
     */
    SelectRelativeButton(buttonDir) {
        result := ComCall(17, this, "int", buttonDir, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ActivateButton method activates the currently selected menu button.
     * @remarks
     * An application might or might not have four relative buttons on the side of the video display to represent the buttons on a physical remote control. These enable a user to select menu buttons but not activate them. A fifth button is required to activate the selected button. Call <c>ActivateButton</c> in response to a mouse click on the fifth button.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Button_Activate</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-activatebutton
     */
    ActivateButton() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectButton method selects the specified menu button.
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Upper_Button_Select, Lower_Button_Select, Left_Button_Select, Right_Button_Select</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * UOP control prohibits the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> from entering a paused state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectbutton
     */
    SelectButton(ulButton) {
        result := ComCall(19, this, "uint", ulButton, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectAndActivateButton method selects and activates the specified menu button.
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Button_Select_and_Activate</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * The <i>ulButton</i> value is valid, but the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter couldn't activate it.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectandactivatebutton
     */
    SelectAndActivateButton(ulButton) {
        result := ComCall(20, this, "uint", ulButton, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The StillOff method resumes playback, canceling still mode.
     * @remarks
     * A <i>still</i> is a static image presented by the disc. It is not the same as the frozen display image that appears when the user clicks the <b>Pause</b> button. When the DVD Navigator encounters a still image, it sends the application an EC_DVD_STILL_ON message, goes into still-store mode displaying the image, and waits for <c>StillOff</c> to be called before resuming playback.
     * 
     * If the DVD Navigator is not in still-store mode, this method does nothing.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Still_Off</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is in a menu domain and the menu has buttons.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-stilloff
     */
    StillOff() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note  This method is deprecated. Applications should call IMediaControl::Pause instead. For more information, see Data Flow in the DVD Navigator. The Pause method pauses or resumes playback at the current location.
     * @remarks
     * Putting the DVD Navigator into a paused state freezes playback and any internal timers, similar to <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-pause">IMediaControl::Pause</a>. If the filter graph is not running, this method does nothing.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Pause_On, Pause_Off</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-pause
     */
    Pause(bState) {
        result := ComCall(22, this, "int", bState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectAudioStream method selects the audio stream to play.
     * @remarks
     * This method affects the audio of the current Video Title Set (VTS). When called from within a menu, this method sets the audio stream of the title from which the menu was called.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Audio_Stream_Change</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulAudio Value that specifies the audio stream. Valid stream numbers are 0 through 7, or <b>DVD_DEFAULT_AUDIO_STREAM</b> to specify the default stream.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command. This parameter is currently ignored; use DVD_CMD_FLAG_None.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectaudiostream
     */
    SelectAudioStream(ulAudio, dwFlags) {
        result := ComCall(23, this, "uint", ulAudio, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectSubpictureStream method sets the subpicture stream to display.
     * @remarks
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Sub-picture_Stream_Change</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectsubpicturestream
     */
    SelectSubpictureStream(ulSubPicture, dwFlags) {
        result := ComCall(24, this, "uint", ulSubPicture, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The SetSubpictureState method turns the subpicture display on or off.
     * @remarks
     * Subpicture streams are typically used in menus for button text and sometimes button graphics, and in video playback for subtitles, credits, or other overlaid graphics. Do not confuse subpictures with closed captions; the latter are encoded within the video stream. In general, this method is intended for controlling subpicture display over video while the DVD Navigator filter is playing video in the DVD Title domain.
     * 
     * This method corresponds to the second parameter of the Annex J "Sub-picture_Stream_Change" command.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Sub-picture_stream_Change</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} bState Boolean value that specifies whether the subpicture display is on; <b>TRUE</b> sets subpicture display on for subsequent playback.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-setsubpicturestate
     */
    SetSubpictureState(bState, dwFlags) {
        result := ComCall(25, this, "int", bState, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectAngle method sets the new angle when the DVD Navigator is in an angle block.
     * @remarks
     * Note that angle and menu button indexes are one-based while audio stream and subpicture stream indexes are zero-based.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Angle_Change</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulAngle Value of the new angle, which must be from 1 through 9.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectangle
     */
    SelectAngle(ulAngle, dwFlags) {
        result := ComCall(26, this, "uint", ulAngle, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectParentalLevel method sets the parental access level for the logged-on user.
     * @remarks
     * There are eight generic parental levels defined in the DVD specification, numbered from 1 (most restrictive) through 8 (least restrictive). The meaning of these levels varies from region to region and depends on the current country/region (see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-selectparentalcountry">IDvdControl2::SelectParentalCountry</a>). For the United States and Canada (DVD Region 1), the suggested values are as follows:
     * 
     * <table>
     * <tr>
     * <td>Parental level
     *             </td>
     * <td>Meaning
     *             </td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>The rating is G, general.</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>The rating is PG, parental guidance suggested.</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>The rating is PG-13, parental guidance suggested, not recommended for those under 13.</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>The rating is R, restricted.</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>The rating is NC-17, not appropriate for those under 17.</td>
     * </tr>
     * </table>
     *  
     * 
     * This method sets the current user's access level; this access level determines what content the user can play. Higher levels can play lower-level content; lower levels can't play higher-level content. In other words, adults can watch child-safe content, but children can't watch adult content.
     * 
     * DVD player applications can enforce restrictions on the parental level setting, such as providing password protection for raising the current parental level. The application's user interface should have a way to set the level and to disable checking completely. Some discs might be authored to disallow even level 8, meaning that no level is valid and no one could watch the disc if parental management is enabled. On such discs, parental management must be disabled for the discs to be viewed. Parental management in the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is disabled by default.
     * 
     * To disable parental management after it has been enabled, pass 0xffffffff for <i>ulParentalLevel</i>.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::SetParentalLevel</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Parental_Level_Select</td>
     * <td>DVD_DOMAIN_Stop</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectparentallevel
     */
    SelectParentalLevel(ulParentalLevel) {
        result := ComCall(27, this, "uint", ulParentalLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectParentalCountry method sets the country/region for interpreting parental access levels and setting default languages.
     * @remarks
     * The parental country/region determines the meaning of the eight generic parental levels as well as the default language for the soundtrack and menus. For details, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/enforcing-parental-management-levels">Enforcing Parental Management Levels</a>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Parental_Country_Select</td>
     * <td>DVD_DOMAIN_Stop</td>
     * </tr>
     * </table>
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectparentalcountry
     */
    SelectParentalCountry(bCountry) {
        bCountryMarshal := bCountry is VarRef ? "char*" : "ptr"

        result := ComCall(28, this, bCountryMarshal, bCountry, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectKaraokeAudioPresentationMode method sends karaoke auxiliary channels to the left or right speakers.
     * @remarks
     * When the DVD Navigator enters karaoke mode, it queries the audio decoder to discover whether it supports karaoke downmixing. If the decoder supports it, then channels 2 through 4 (the karaoke auxiliary channels with the guide vocals, guide melodies, and sound effects) are muted. Use this method to turn individual channels on or off and direct them to channels 0 and 1.
     * 
     * This method is demonstrated in the DVDSample application in <b>CKaraokeDlg::DoModal</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Karaoke_Audio_Presentation_Mode_Change</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulMode Bitwise OR of [DVD_KARAOKE_DOWNMIX](/windows/win32/api/strmif/ne-strmif-dvd_karaoke_downmix) enumeration indicating how to downmix the five karaoke channels to channels 0 and 1, which are usually output to the left and right speakers.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is in an invalid domain.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectkaraokeaudiopresentationmode
     */
    SelectKaraokeAudioPresentationMode(ulMode) {
        result := ComCall(29, this, "uint", ulMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectVideoModePreference method sets the specified video mode display (wide screen, letterbox, or pan-scan) for playback.
     * @remarks
     * This method changes the default video window's aspect ratio and can also specify a default aspect ratio conversion mechanism.
     * 
     * For anamorphic 16 x 9 source video, formed by stretching the 720 x 480 source video to a 16 x 9 aspect ratio.
     * 
     * <b>Widescreen</b> The 16 x 9 source video should be placed and stretched into the largest 16 x 9 area of the client output window. The highlights are relative to the inside of the 16 x 9 area. Black bars should be added to either the top/bottom or to the sides to maintain a 16 x 9 area.
     * 
     * <b>Pan Scan</b> The video shown is computed by taking a 4 x 3 subwindow from the stretched 16 x 9 video (the horizontal offset is provided in the MPEG-2 video's window's offset). The 4 x 3 subwindow is placed into the largest 4 x 3 area of the output client window. The highlight's coordinates are relative to the 4 x 3 output window (and have no relationship to the source 16 x 9 video). Black bars should be added to either the top/bottom or to the sides to maintain a 4 x 3 area.
     * 
     * <b>Letterbox</b> A 4 x 3 display area is formed by taking the largest 4 x 3 area of the output client window. Black bars should be added to either the top/bottom or to the sides to maintain a 4 x 3 area. The source 16 x 9 video is placed in the largest 16 x 9 subwindow inside of the 4 x 3 subwindow. Black bars should be added to the top and bottom of the subwindow to maintain a 16 x 9 area. The highlight's coordinates are relative to the 4 x 3 subwindow (and have no relationship to the source 16 x 9 video). It is technically possible for a disk to specify a highlight that lies outside of the 16 x 9 area (but still in the 4 x 3 window).
     * 
     * For 4 x 3 video, the video is placed in the largest 4 x 3 output area of the output client window. Black bars should be added to either the top/bottom or to the sides to maintain a 4 x 3 area.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Video_Presentation_Mode_Change</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectvideomodepreference
     */
    SelectVideoModePreference(ulPreferredDisplayMode) {
        result := ComCall(30, this, "uint", ulPreferredDisplayMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetDVDDirectory method sets the DVD drive that the DVD Navigator filter will read from.
     * @remarks
     * If <i>pszwPath</i> is <b>NULL</b>, the DVD Navigator tries to select a DVD volume on any available drive. On startup, the DVD Navigator automatically looks for a drive, starting at drive C, with a VIDEO_TS folder in the root folder. It is therefore only necessary to call <c>SetDVDDirectory</c> when you have more than one DVD drive on a machine, or if your DVD drive letter is A or B. When specifying the path, include the video_ts folder.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * SetDVDDirectory(L"e:\\video_ts");
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * Some DVD volumes may have their video in a directory named something other than "video_ts." The general idea is that an additional "DVD volume" (the set of .IFO. VOB, and .BUP files that would normally be stored in the VIDEO_TS directory) can be placed in a subdirectory on the disc. By changing the root to point to this directory, MSWebDVD will operate on this separate DVD volume. A new set of menus, titles, and so on will be available, independent of the titles in the VIDEO_TS root, which will no longer be accessible. Such directories are called "hidden directories." The following example shows how to set a hidden directory as the root, where "hidden" is a placeholder for whatever name the disc authors have given to the directory.
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * SetDVDDirectory(L"d:\\webdvd\\hidden");
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * If the filter graph is running and the DVD Navigator finds a DVD in the directory specified by <i>pszwPath</i>, the DVD Navigator automatically begins playing the disc. This conforms with the DVD specification and ensures that the new disc is initialized properly. If you do not want the new disc to play automatically after <c>SetDVDDirectory</code> returns, you must set the DVD_ResetOnStop flag in <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setoption">IDvdControl2::SetOption</a> to <b>TRUE</b> and stop the filter graph through a call to <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediacontrol-stop">IMediaControl::Stop</a> on the Filter Graph Manager. If DVD_ResetOnStop is set to <b>FALSE</b>, then <code>SetDVDDirectory</c> returns VFW_E_DVD_INVALIDDOMAIN.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::SetDirectory</b>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>DVD_DOMAIN_Stop</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-setdvddirectory
     */
    SetDVDDirectory(pszwPath) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(31, this, "ptr", pszwPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ActivateAtPosition method activates the menu button under the mouse pointer position.
     * @remarks
     * The mouse pointer coordinates are relative to the upper left of the client area, which isn't necessarily the video display area if the video is in letterbox format.
     * 
     * Use this method when the user is navigating through a menu by moving the mouse pointer directly over the menu buttons. If the user is using the relative buttons to navigate the menu, use <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-activatebutton">ActivateButton</a> rather than <c>ActivateAtPosition</c>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {POINT} point_ Point on the client window area, in screen pixel coordinates.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-activateatposition
     */
    ActivateAtPosition(point_) {
        result := ComCall(32, this, "ptr", point_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectAtPosition method highlights the menu button under the mouse pointer position.
     * @remarks
     * Note that angle and menu button indexes are one-based while audio stream and subpicture stream indexes are zero-based.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-activatebutton">IDvdControl2::ActivateButton</a> in response to a mouse click when the pointer is over a menu button.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::OnMouseEvent</b>.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_Title</li>
     * <li>DVD_DOMAIN_FirstPlay</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {POINT} point_ Point on the screen, in screen pixel coordinates.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectatposition
     */
    SelectAtPosition(point_) {
        result := ComCall(33, this, "ptr", point_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The PlayChaptersAutoStop method plays the number of chapters specified, starting at the specified chapter within the specified title.
     * @remarks
     * This method works only on One_Sequential_PGC_Titles. When the specified number of chapters have been played, the DVD Navigator sends the application an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-dvd-chapter-autostop">EC_DVD_CHAPTER_AUTOSTOP</a> event notification.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None.</td>
     * <td>All.</td>
     * </tr>
     * </table>
     * @param {Integer} ulTitle Value that specifies the title in which the chapter is located; this value must be from 1 through 99.
     * @param {Integer} ulChapter Value that specifies the chapter in the specified title where the DVD Navigator will start playback; this value must be from 1 through 999.
     * @param {Integer} ulChaptersToPlay Number of chapters to play from the start chapter.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playchaptersautostop
     */
    PlayChaptersAutoStop(ulTitle, ulChapter, ulChaptersToPlay, dwFlags) {
        result := ComCall(34, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The AcceptParentalLevelChange method accepts or rejects a request from the DVD Navigator to play content at a higher parental management level.
     * @remarks
     * A temporary parental management level (PML) command is a marker on the DVD disc indicating that the content that follows has a PML higher than the level specified for the title as a whole. This marker also contains instructions on where to branch depending on whether the change is accepted or rejected. If you specify <b>FALSE</b>, the DVD Navigator follows the rejected branch on the disc. If you specify <b>TRUE</b>, the DVD Navigator follows the branch to the higher-level content.
     * 
     * Use <c>AcceptParentalLevelChange</code> in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-idvdcontrol2-setoption">SetOption</a> method. The sequence of events is as follows: First, call <b>SetOption</b>(DVD_NotifyParentalLevelChange, <b>TRUE</b>) to tell the DVD Navigator to always wait after sending an EC_DVD_PARENTAL_LEVEL_CHANGE event notification to the application. In your event handler, implement code to determine whether to accept or reject the change, and then call <code>AcceptParentalLevelChange</c> to notify the DVD Navigator of the decision.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>All</td>
     * </tr>
     * </table>
     * @param {BOOL} bAccept Flag that indicates whether the application accepts the parental management level change. Specify <b>TRUE</b> to accept the change and play the higher-level content, or <b>FALSE</b> to reject the change.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-acceptparentallevelchange
     */
    AcceptParentalLevelChange(bAccept) {
        result := ComCall(35, this, "int", bAccept, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetOption method enables or disables an internal behavior flag on the DVD Navigator filter.
     * @remarks
     * Call <b>SetOption</b> with the desired flags immediately after creating an instance of the DVD Navigator and whenever you want to change any behaviors.
     *       
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     *       
     * 
     * <table>
     * <tr>
     * <th>Annex J Command Name
     *             </th>
     * <th>Valid Domains
     *             </th>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>All</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-setoption
     */
    SetOption(flag, fState) {
        result := ComCall(36, this, "int", flag, "int", fState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetState method saves the current disc position and state of the DVD Navigator filter.
     * @remarks
     * The DVD Navigator uses the location information in the given state object to restore the playback position to a specific location on the disc.
     * 
     * This method is demonstrated in the DVDSample application in <b>CDvdCore::RestoreBookmark</b>.
     * @param {IDvdState} pState Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdstate">IDvdState</a> interface on the object that contains the state information.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-setstate
     */
    SetState(pState, dwFlags) {
        result := ComCall(37, this, "ptr", pState, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The PlayPeriodInTitleAutoStop method starts playback in the specified title from the specified start time until the specified end time.
     * @remarks
     * The actual start and end times are the times before or equal to the frame number specified in the <b>DVD_HMSF_TIMECODE</b>. The frame rate code is ignored on <i>pStartTime</i> and <i>pEndTime</i>.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>
     * <ul>
     * <li>DVD_DOMAIN_VideoManagerMenu</li>
     * <li>DVD_DOMAIN_VideoTitleSetMenu</li>
     * <li>DVD_DOMAIN_TitleDVD_DOMAIN_Stop</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulTitle Value that specifies the title; this value must be from 1 through 99.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pStartTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies the time at which to start playing.
     * @param {Pointer<DVD_HMSF_TIMECODE>} pEndTime Pointer to a [DVD_HMSF_TIMECODE](/windows/desktop/api/strmif/ns-strmif-dvd_hmsf_timecode) structure that specifies the time at which to stop playing.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-playperiodintitleautostop
     */
    PlayPeriodInTitleAutoStop(ulTitle, pStartTime, pEndTime, dwFlags) {
        result := ComCall(38, this, "uint", ulTitle, "ptr", pStartTime, "ptr", pEndTime, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The SetGPRM method sets a general parameter register value.
     * @remarks
     * A DVD disc uses general parameter registers to store various types of information. By manually setting one or more of these registers, an application might be able to provide certain custom functionality. This is an advanced command and should not be used unless you have a thorough understanding of the DVD specification.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>none</td>
     * <td>All</td>
     * </tr>
     * </table>
     * @param {Integer} ulIndex Register index; may be a value from zero through 15.
     * @param {Integer} wValue A 16-bit value contained in the specified register.
     * @param {Integer} dwFlags Bitwise OR of one or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-dvd_cmd_flags">DVD_CMD_FLAGS</a> enumeration, specifying how to synchronize the command.
     * @returns {IDvdCmd} Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-idvdcmd">IDvdCmd</a> object that can be used to synchronize DVD commands. The caller must release the interface. This parameter can be <b>NULL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/synchronizing-dvd-commands">Synchronizing DVD Commands</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-setgprm
     */
    SetGPRM(ulIndex, wValue, dwFlags) {
        result := ComCall(39, this, "uint", ulIndex, "ushort", wValue, "uint", dwFlags, "ptr*", &ppCmd := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDvdCmd(ppCmd)
    }

    /**
     * The SelectDefaultMenuLanguage method sets the default language for all menus and menu buttons.
     * @remarks
     * This method selects the default text language to use for menus when the disc is played. For example, if <i>Language</i> is specified as 0x409 for U.S. English, the DVD Navigator tries to show U.S. English text in menus. If the default menu language is not found on a disc, the DVD Navigator selects the closest match.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>Menu_Language_Select</td>
     * <td>DVD_DOMAIN_Stop</td>
     * </tr>
     * </table>
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectdefaultmenulanguage
     */
    SelectDefaultMenuLanguage(Language) {
        result := ComCall(40, this, "uint", Language, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectDefaultAudioLanguage method sets the default audio language.
     * @remarks
     * This method selects the default language and language extensions to use when the disc is played. For example, if <i>Language</i> is specified as 0x409 for English and <i>audioExtension</i> is specified as DVD_AUD_EXT_NotSpecified, the DVD Navigator will look for the basic audio stream in English. If <i>audioExtension</i> is specified as DVD_AUD_EXT_VisuallyImpaired, the DVD Navigator will first look for a special audio stream in English for people with low vision. If the default stream is not found on a disc, the DVD Navigator will select the closest match.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>DVD_DOMAIN_Stop</td>
     * </tr>
     * </table>
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in the Stop domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectdefaultaudiolanguage
     */
    SelectDefaultAudioLanguage(Language, audioExtension) {
        result := ComCall(41, this, "uint", Language, "int", audioExtension, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SelectDefaultSubpictureLanguage method sets the default language for subpicture text.
     * @remarks
     * This method selects the default language and format to use for subpictures and menus when the disc is played. For example, if <i>Language</i> is specified as 0x409 for U.S. English and <i>subpictureExtension</i> is specified as DVD_SP_EXT_Caption_Big, the DVD Navigator tries to show U.S. English text in the "big caption" format in subpictures. If the default language or language extension is not found on a disc, the DVD Navigator selects the closest match.
     * 
     * The following table shows the Annex J command name to which this method name corresponds, and the domains in which this method is valid.
     * 
     * <table>
     * <tr>
     * <td>Annex J Command Name
     *             </td>
     * <td>Valid Domains
     *             </td>
     * </tr>
     * <tr>
     * <td>None</td>
     * <td>DVD_DOMAIN_Stop</td>
     * </tr>
     * </table>
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
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter is not in a valid domain.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-idvdcontrol2-selectdefaultsubpicturelanguage
     */
    SelectDefaultSubpictureLanguage(Language, subpictureExtension) {
        result := ComCall(42, this, "uint", Language, "int", subpictureExtension, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playtitle
     */
    PlayTitle(ulTitle, dwFlags, ppCmd) {
        result := ComCall(3, this, "uint", ulTitle, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} ulChapter 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playchapterintitle
     */
    PlayChapterInTitle(ulTitle, ulChapter, dwFlags, ppCmd) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pStartTime 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playattimeintitle
     */
    PlayAtTimeInTitle(ulTitle, pStartTime, dwFlags, ppCmd) {
        result := ComCall(5, this, "uint", ulTitle, "ptr", pStartTime, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-stop
     */
    Stop() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-returnfromsubmenu
     */
    ReturnFromSubmenu(dwFlags, ppCmd) {
        result := ComCall(7, this, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pTime 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playattime
     */
    PlayAtTime(pTime, dwFlags, ppCmd) {
        result := ComCall(8, this, "ptr", pTime, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulChapter 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playchapter
     */
    PlayChapter(ulChapter, dwFlags, ppCmd) {
        result := ComCall(9, this, "uint", ulChapter, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playprevchapter
     */
    PlayPrevChapter(dwFlags, ppCmd) {
        result := ComCall(10, this, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-replaychapter
     */
    ReplayChapter(dwFlags, ppCmd) {
        result := ComCall(11, this, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playnextchapter
     */
    PlayNextChapter(dwFlags, ppCmd) {
        result := ComCall(12, this, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dSpeed 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playforwards
     */
    PlayForwards(dSpeed, dwFlags, ppCmd) {
        result := ComCall(13, this, "double", dSpeed, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dSpeed 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playbackwards
     */
    PlayBackwards(dSpeed, dwFlags, ppCmd) {
        result := ComCall(14, this, "double", dSpeed, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MenuID 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-showmenu
     */
    ShowMenu(MenuID, dwFlags, ppCmd) {
        result := ComCall(15, this, "int", MenuID, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-resume
     */
    Resume(dwFlags, ppCmd) {
        result := ComCall(16, this, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} buttonDir 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectrelativebutton
     */
    SelectRelativeButton(buttonDir) {
        result := ComCall(17, this, "int", buttonDir, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-activatebutton
     */
    ActivateButton() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectbutton
     */
    SelectButton(ulButton) {
        result := ComCall(19, this, "uint", ulButton, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectandactivatebutton
     */
    SelectAndActivateButton(ulButton) {
        result := ComCall(20, this, "uint", ulButton, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-stilloff
     */
    StillOff() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-pause
     */
    Pause(bState) {
        result := ComCall(22, this, "int", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulAudio 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectaudiostream
     */
    SelectAudioStream(ulAudio, dwFlags, ppCmd) {
        result := ComCall(23, this, "uint", ulAudio, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSubPicture 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectsubpicturestream
     */
    SelectSubpictureStream(ulSubPicture, dwFlags, ppCmd) {
        result := ComCall(24, this, "uint", ulSubPicture, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bState 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-setsubpicturestate
     */
    SetSubpictureState(bState, dwFlags, ppCmd) {
        result := ComCall(25, this, "int", bState, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulAngle 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectangle
     */
    SelectAngle(ulAngle, dwFlags, ppCmd) {
        result := ComCall(26, this, "uint", ulAngle, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulParentalLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectparentallevel
     */
    SelectParentalLevel(ulParentalLevel) {
        result := ComCall(27, this, "uint", ulParentalLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} bCountry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectparentalcountry
     */
    SelectParentalCountry(bCountry) {
        result := ComCall(28, this, "char*", bCountry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectkaraokeaudiopresentationmode
     */
    SelectKaraokeAudioPresentationMode(ulMode) {
        result := ComCall(29, this, "uint", ulMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPreferredDisplayMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectvideomodepreference
     */
    SelectVideoModePreference(ulPreferredDisplayMode) {
        result := ComCall(30, this, "uint", ulPreferredDisplayMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-setdvddirectory
     */
    SetDVDDirectory(pszwPath) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(31, this, "ptr", pszwPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-activateatposition
     */
    ActivateAtPosition(point) {
        result := ComCall(32, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectatposition
     */
    SelectAtPosition(point) {
        result := ComCall(33, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} ulChapter 
     * @param {Integer} ulChaptersToPlay 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playchaptersautostop
     */
    PlayChaptersAutoStop(ulTitle, ulChapter, ulChaptersToPlay, dwFlags, ppCmd) {
        result := ComCall(34, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bAccept 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-acceptparentallevelchange
     */
    AcceptParentalLevelChange(bAccept) {
        result := ComCall(35, this, "int", bAccept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flag 
     * @param {BOOL} fState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-setoption
     */
    SetOption(flag, fState) {
        result := ComCall(36, this, "int", flag, "int", fState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDvdState} pState 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-setstate
     */
    SetState(pState, dwFlags, ppCmd) {
        result := ComCall(37, this, "ptr", pState, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pStartTime 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pEndTime 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-playperiodintitleautostop
     */
    PlayPeriodInTitleAutoStop(ulTitle, pStartTime, pEndTime, dwFlags, ppCmd) {
        result := ComCall(38, this, "uint", ulTitle, "ptr", pStartTime, "ptr", pEndTime, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Integer} wValue 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-setgprm
     */
    SetGPRM(ulIndex, wValue, dwFlags, ppCmd) {
        result := ComCall(39, this, "uint", ulIndex, "ushort", wValue, "uint", dwFlags, "ptr*", ppCmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectdefaultmenulanguage
     */
    SelectDefaultMenuLanguage(Language) {
        result := ComCall(40, this, "uint", Language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @param {Integer} audioExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectdefaultaudiolanguage
     */
    SelectDefaultAudioLanguage(Language, audioExtension) {
        result := ComCall(41, this, "uint", Language, "int", audioExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @param {Integer} subpictureExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol2-selectdefaultsubpicturelanguage
     */
    SelectDefaultSubpictureLanguage(Language, subpictureExtension) {
        result := ComCall(42, this, "uint", Language, "int", subpictureExtension, "HRESULT")
        return result
    }
}

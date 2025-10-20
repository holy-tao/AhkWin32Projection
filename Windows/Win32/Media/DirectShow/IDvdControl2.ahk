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
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayTitle(ulTitle, dwFlags, ppCmd) {
        result := ComCall(3, this, "uint", ulTitle, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} ulChapter 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayChapterInTitle(ulTitle, ulChapter, dwFlags, ppCmd) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pStartTime 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayAtTimeInTitle(ulTitle, pStartTime, dwFlags, ppCmd) {
        result := ComCall(5, this, "uint", ulTitle, "ptr", pStartTime, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    ReturnFromSubmenu(dwFlags, ppCmd) {
        result := ComCall(7, this, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pTime 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayAtTime(pTime, dwFlags, ppCmd) {
        result := ComCall(8, this, "ptr", pTime, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulChapter 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayChapter(ulChapter, dwFlags, ppCmd) {
        result := ComCall(9, this, "uint", ulChapter, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayPrevChapter(dwFlags, ppCmd) {
        result := ComCall(10, this, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    ReplayChapter(dwFlags, ppCmd) {
        result := ComCall(11, this, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayNextChapter(dwFlags, ppCmd) {
        result := ComCall(12, this, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dSpeed 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayForwards(dSpeed, dwFlags, ppCmd) {
        result := ComCall(13, this, "double", dSpeed, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dSpeed 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    PlayBackwards(dSpeed, dwFlags, ppCmd) {
        result := ComCall(14, this, "double", dSpeed, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MenuID 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    ShowMenu(MenuID, dwFlags, ppCmd) {
        result := ComCall(15, this, "int", MenuID, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    Resume(dwFlags, ppCmd) {
        result := ComCall(16, this, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} buttonDir 
     * @returns {HRESULT} 
     */
    SelectRelativeButton(buttonDir) {
        result := ComCall(17, this, "int", buttonDir, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ActivateButton() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @returns {HRESULT} 
     */
    SelectButton(ulButton) {
        result := ComCall(19, this, "uint", ulButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @returns {HRESULT} 
     */
    SelectAndActivateButton(ulButton) {
        result := ComCall(20, this, "uint", ulButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StillOff() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     */
    Pause(bState) {
        result := ComCall(22, this, "int", bState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAudio 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    SelectAudioStream(ulAudio, dwFlags, ppCmd) {
        result := ComCall(23, this, "uint", ulAudio, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSubPicture 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    SelectSubpictureStream(ulSubPicture, dwFlags, ppCmd) {
        result := ComCall(24, this, "uint", ulSubPicture, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bState 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    SetSubpictureState(bState, dwFlags, ppCmd) {
        result := ComCall(25, this, "int", bState, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAngle 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    SelectAngle(ulAngle, dwFlags, ppCmd) {
        result := ComCall(26, this, "uint", ulAngle, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulParentalLevel 
     * @returns {HRESULT} 
     */
    SelectParentalLevel(ulParentalLevel) {
        result := ComCall(27, this, "uint", ulParentalLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} bCountry 
     * @returns {HRESULT} 
     */
    SelectParentalCountry(bCountry) {
        result := ComCall(28, this, "char*", bCountry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulMode 
     * @returns {HRESULT} 
     */
    SelectKaraokeAudioPresentationMode(ulMode) {
        result := ComCall(29, this, "uint", ulMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulPreferredDisplayMode 
     * @returns {HRESULT} 
     */
    SelectVideoModePreference(ulPreferredDisplayMode) {
        result := ComCall(30, this, "uint", ulPreferredDisplayMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszwPath 
     * @returns {HRESULT} 
     */
    SetDVDDirectory(pszwPath) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(31, this, "ptr", pszwPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     */
    ActivateAtPosition(point) {
        result := ComCall(32, this, "ptr", point, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     */
    SelectAtPosition(point) {
        result := ComCall(33, this, "ptr", point, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    PlayChaptersAutoStop(ulTitle, ulChapter, ulChaptersToPlay, dwFlags, ppCmd) {
        result := ComCall(34, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bAccept 
     * @returns {HRESULT} 
     */
    AcceptParentalLevelChange(bAccept) {
        result := ComCall(35, this, "int", bAccept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flag 
     * @param {BOOL} fState 
     * @returns {HRESULT} 
     */
    SetOption(flag, fState) {
        result := ComCall(36, this, "int", flag, "int", fState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDvdState>} pState 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    SetState(pState, dwFlags, ppCmd) {
        result := ComCall(37, this, "ptr", pState, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    PlayPeriodInTitleAutoStop(ulTitle, pStartTime, pEndTime, dwFlags, ppCmd) {
        result := ComCall(38, this, "uint", ulTitle, "ptr", pStartTime, "ptr", pEndTime, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Integer} wValue 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDvdCmd>} ppCmd 
     * @returns {HRESULT} 
     */
    SetGPRM(ulIndex, wValue, dwFlags, ppCmd) {
        result := ComCall(39, this, "uint", ulIndex, "ushort", wValue, "uint", dwFlags, "ptr", ppCmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @returns {HRESULT} 
     */
    SelectDefaultMenuLanguage(Language) {
        result := ComCall(40, this, "uint", Language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @param {Integer} audioExtension 
     * @returns {HRESULT} 
     */
    SelectDefaultAudioLanguage(Language, audioExtension) {
        result := ComCall(41, this, "uint", Language, "int", audioExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @param {Integer} subpictureExtension 
     * @returns {HRESULT} 
     */
    SelectDefaultSubpictureLanguage(Language, subpictureExtension) {
        result := ComCall(42, this, "uint", Language, "int", subpictureExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

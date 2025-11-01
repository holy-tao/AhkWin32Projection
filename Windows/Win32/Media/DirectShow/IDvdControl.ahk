#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdControl
     * @type {Guid}
     */
    static IID => Guid("{a70efe61-e2a3-11d0-a9be-00aa0061be93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TitlePlay", "ChapterPlay", "TimePlay", "StopForResume", "GoUp", "TimeSearch", "ChapterSearch", "PrevPGSearch", "TopPGSearch", "NextPGSearch", "ForwardScan", "BackwardScan", "MenuCall", "Resume", "UpperButtonSelect", "LowerButtonSelect", "LeftButtonSelect", "RightButtonSelect", "ButtonActivate", "ButtonSelectAndActivate", "StillOff", "PauseOn", "PauseOff", "MenuLanguageSelect", "AudioStreamChange", "SubpictureStreamChange", "AngleChange", "ParentalLevelSelect", "ParentalCountrySelect", "KaraokeAudioPresentationModeChange", "VideoModePreferrence", "SetRoot", "MouseActivate", "MouseSelect", "ChapterPlayAutoStop"]

    /**
     * 
     * @param {Integer} ulTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-titleplay
     */
    TitlePlay(ulTitle) {
        result := ComCall(3, this, "uint", ulTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} ulChapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-chapterplay
     */
    ChapterPlay(ulTitle, ulChapter) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} bcdTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-timeplay
     */
    TimePlay(ulTitle, bcdTime) {
        result := ComCall(5, this, "uint", ulTitle, "uint", bcdTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-stopforresume
     */
    StopForResume() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-goup
     */
    GoUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bcdTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-timesearch
     */
    TimeSearch(bcdTime) {
        result := ComCall(8, this, "uint", bcdTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulChapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-chaptersearch
     */
    ChapterSearch(ulChapter) {
        result := ComCall(9, this, "uint", ulChapter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-prevpgsearch
     */
    PrevPGSearch() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-toppgsearch
     */
    TopPGSearch() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-nextpgsearch
     */
    NextPGSearch() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dwSpeed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-forwardscan
     */
    ForwardScan(dwSpeed) {
        result := ComCall(13, this, "double", dwSpeed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dwSpeed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-backwardscan
     */
    BackwardScan(dwSpeed) {
        result := ComCall(14, this, "double", dwSpeed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} MenuID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-menucall
     */
    MenuCall(MenuID) {
        result := ComCall(15, this, "int", MenuID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-resume
     */
    Resume() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-upperbuttonselect
     */
    UpperButtonSelect() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-lowerbuttonselect
     */
    LowerButtonSelect() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-leftbuttonselect
     */
    LeftButtonSelect() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-rightbuttonselect
     */
    RightButtonSelect() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-buttonactivate
     */
    ButtonActivate() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-buttonselectandactivate
     */
    ButtonSelectAndActivate(ulButton) {
        result := ComCall(22, this, "uint", ulButton, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-stilloff
     */
    StillOff() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-pauseon
     */
    PauseOn() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-pauseoff
     */
    PauseOff() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-menulanguageselect
     */
    MenuLanguageSelect(Language) {
        result := ComCall(26, this, "uint", Language, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulAudio 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-audiostreamchange
     */
    AudioStreamChange(ulAudio) {
        result := ComCall(27, this, "uint", ulAudio, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSubPicture 
     * @param {BOOL} bDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-subpicturestreamchange
     */
    SubpictureStreamChange(ulSubPicture, bDisplay) {
        result := ComCall(28, this, "uint", ulSubPicture, "int", bDisplay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulAngle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-anglechange
     */
    AngleChange(ulAngle) {
        result := ComCall(29, this, "uint", ulAngle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulParentalLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-parentallevelselect
     */
    ParentalLevelSelect(ulParentalLevel) {
        result := ComCall(30, this, "uint", ulParentalLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wCountry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-parentalcountryselect
     */
    ParentalCountrySelect(wCountry) {
        result := ComCall(31, this, "ushort", wCountry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-karaokeaudiopresentationmodechange
     */
    KaraokeAudioPresentationModeChange(ulMode) {
        result := ComCall(32, this, "uint", ulMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPreferredDisplayMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-videomodepreferrence
     */
    VideoModePreferrence(ulPreferredDisplayMode) {
        result := ComCall(33, this, "uint", ulPreferredDisplayMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-setroot
     */
    SetRoot(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(34, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-mouseactivate
     */
    MouseActivate(point) {
        result := ComCall(35, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-mouseselect
     */
    MouseSelect(point) {
        result := ComCall(36, this, "ptr", point, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} ulChapter 
     * @param {Integer} ulChaptersToPlay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdcontrol-chapterplayautostop
     */
    ChapterPlayAutoStop(ulTitle, ulChapter, ulChaptersToPlay) {
        result := ComCall(37, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "HRESULT")
        return result
    }
}

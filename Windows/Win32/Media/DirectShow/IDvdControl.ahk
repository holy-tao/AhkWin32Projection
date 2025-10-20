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
     * 
     * @param {Integer} ulTitle 
     * @returns {HRESULT} 
     */
    TitlePlay(ulTitle) {
        result := ComCall(3, this, "uint", ulTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} ulChapter 
     * @returns {HRESULT} 
     */
    ChapterPlay(ulTitle, ulChapter) {
        result := ComCall(4, this, "uint", ulTitle, "uint", ulChapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} bcdTime 
     * @returns {HRESULT} 
     */
    TimePlay(ulTitle, bcdTime) {
        result := ComCall(5, this, "uint", ulTitle, "uint", bcdTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopForResume() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GoUp() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bcdTime 
     * @returns {HRESULT} 
     */
    TimeSearch(bcdTime) {
        result := ComCall(8, this, "uint", bcdTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulChapter 
     * @returns {HRESULT} 
     */
    ChapterSearch(ulChapter) {
        result := ComCall(9, this, "uint", ulChapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PrevPGSearch() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TopPGSearch() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NextPGSearch() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dwSpeed 
     * @returns {HRESULT} 
     */
    ForwardScan(dwSpeed) {
        result := ComCall(13, this, "double", dwSpeed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dwSpeed 
     * @returns {HRESULT} 
     */
    BackwardScan(dwSpeed) {
        result := ComCall(14, this, "double", dwSpeed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MenuID 
     * @returns {HRESULT} 
     */
    MenuCall(MenuID) {
        result := ComCall(15, this, "int", MenuID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpperButtonSelect() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LowerButtonSelect() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LeftButtonSelect() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RightButtonSelect() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ButtonActivate() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @returns {HRESULT} 
     */
    ButtonSelectAndActivate(ulButton) {
        result := ComCall(22, this, "uint", ulButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StillOff() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PauseOn() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PauseOff() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Language 
     * @returns {HRESULT} 
     */
    MenuLanguageSelect(Language) {
        result := ComCall(26, this, "uint", Language, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAudio 
     * @returns {HRESULT} 
     */
    AudioStreamChange(ulAudio) {
        result := ComCall(27, this, "uint", ulAudio, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSubPicture 
     * @param {BOOL} bDisplay 
     * @returns {HRESULT} 
     */
    SubpictureStreamChange(ulSubPicture, bDisplay) {
        result := ComCall(28, this, "uint", ulSubPicture, "int", bDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAngle 
     * @returns {HRESULT} 
     */
    AngleChange(ulAngle) {
        result := ComCall(29, this, "uint", ulAngle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulParentalLevel 
     * @returns {HRESULT} 
     */
    ParentalLevelSelect(ulParentalLevel) {
        result := ComCall(30, this, "uint", ulParentalLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wCountry 
     * @returns {HRESULT} 
     */
    ParentalCountrySelect(wCountry) {
        result := ComCall(31, this, "ushort", wCountry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulMode 
     * @returns {HRESULT} 
     */
    KaraokeAudioPresentationModeChange(ulMode) {
        result := ComCall(32, this, "uint", ulMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulPreferredDisplayMode 
     * @returns {HRESULT} 
     */
    VideoModePreferrence(ulPreferredDisplayMode) {
        result := ComCall(33, this, "uint", ulPreferredDisplayMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    SetRoot(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(34, this, "ptr", pszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     */
    MouseActivate(point) {
        result := ComCall(35, this, "ptr", point, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @returns {HRESULT} 
     */
    MouseSelect(point) {
        result := ComCall(36, this, "ptr", point, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Integer} ulChapter 
     * @param {Integer} ulChaptersToPlay 
     * @returns {HRESULT} 
     */
    ChapterPlayAutoStop(ulTitle, ulChapter, ulChaptersToPlay) {
        result := ComCall(37, this, "uint", ulTitle, "uint", ulChapter, "uint", ulChaptersToPlay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

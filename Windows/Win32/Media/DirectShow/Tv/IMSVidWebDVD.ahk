#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMSVidPlayback.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidWebDVD extends IMSVidPlayback{
    /**
     * The interface identifier for IMSVidWebDVD
     * @type {Guid}
     */
    static IID => Guid("{cf45f88b-ac56-4ee2-a73a-ed04e2885d3c}")

    /**
     * The class identifier for MSVidWebDVD
     * @type {Guid}
     */
    static CLSID => Guid("{011b3619-fe63-4814-8a84-15a194ce9ce3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * 
     * @param {Integer} lEvent 
     * @param {Pointer} lParam1 
     * @param {Pointer} lParam2 
     * @returns {HRESULT} 
     */
    OnDVDEvent(lEvent, lParam1, lParam2) {
        result := ComCall(32, this, "int", lEvent, "ptr", lParam1, "ptr", lParam2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @returns {HRESULT} 
     */
    PlayTitle(lTitle) {
        result := ComCall(33, this, "int", lTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {Integer} lChapter 
     * @returns {HRESULT} 
     */
    PlayChapterInTitle(lTitle, lChapter) {
        result := ComCall(34, this, "int", lTitle, "int", lChapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lChapter 
     * @returns {HRESULT} 
     */
    PlayChapter(lChapter) {
        result := ComCall(35, this, "int", lChapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {Integer} lstrChapter 
     * @param {Integer} lChapterCount 
     * @returns {HRESULT} 
     */
    PlayChaptersAutoStop(lTitle, lstrChapter, lChapterCount) {
        result := ComCall(36, this, "int", lTitle, "int", lstrChapter, "int", lChapterCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strTime 
     * @returns {HRESULT} 
     */
    PlayAtTime(strTime) {
        strTime := strTime is String ? BSTR.Alloc(strTime).Value : strTime

        result := ComCall(37, this, "ptr", strTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {BSTR} strTime 
     * @returns {HRESULT} 
     */
    PlayAtTimeInTitle(lTitle, strTime) {
        strTime := strTime is String ? BSTR.Alloc(strTime).Value : strTime

        result := ComCall(38, this, "int", lTitle, "ptr", strTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {BSTR} strStartTime 
     * @param {BSTR} strEndTime 
     * @returns {HRESULT} 
     */
    PlayPeriodInTitleAutoStop(lTitle, strStartTime, strEndTime) {
        strStartTime := strStartTime is String ? BSTR.Alloc(strStartTime).Value : strStartTime
        strEndTime := strEndTime is String ? BSTR.Alloc(strEndTime).Value : strEndTime

        result := ComCall(39, this, "int", lTitle, "ptr", strStartTime, "ptr", strEndTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReplayChapter() {
        result := ComCall(40, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PlayPrevChapter() {
        result := ComCall(41, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PlayNextChapter() {
        result := ComCall(42, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StillOff() {
        result := ComCall(43, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {VARIANT_BOOL} fFormat 
     * @param {Pointer<BSTR>} strAudioLang 
     * @returns {HRESULT} 
     */
    get_AudioLanguage(lStream, fFormat, strAudioLang) {
        result := ComCall(44, this, "int", lStream, "short", fFormat, "ptr", strAudioLang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MenuID 
     * @returns {HRESULT} 
     */
    ShowMenu(MenuID) {
        result := ComCall(45, this, "int", MenuID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(46, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReturnFromSubmenu() {
        result := ComCall(47, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ButtonsAvailable(pVal) {
        result := ComCall(48, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentButton(pVal) {
        result := ComCall(49, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButton 
     * @returns {HRESULT} 
     */
    SelectAndActivateButton(lButton) {
        result := ComCall(50, this, "int", lButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ActivateButton() {
        result := ComCall(51, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectRightButton() {
        result := ComCall(52, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectLeftButton() {
        result := ComCall(53, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectLowerButton() {
        result := ComCall(54, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectUpperButton() {
        result := ComCall(55, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} 
     */
    ActivateAtPosition(xPos, yPos) {
        result := ComCall(56, this, "int", xPos, "int", yPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} 
     */
    SelectAtPosition(xPos, yPos) {
        result := ComCall(57, this, "int", xPos, "int", yPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @param {Pointer<Int32>} plButton 
     * @returns {HRESULT} 
     */
    get_ButtonAtPosition(xPos, yPos, plButton) {
        result := ComCall(58, this, "int", xPos, "int", yPos, "int*", plButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_NumberOfChapters(lTitle, pVal) {
        result := ComCall(59, this, "int", lTitle, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TotalTitleTime(pVal) {
        result := ComCall(60, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_TitlesAvailable(pVal) {
        result := ComCall(61, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_VolumesAvailable(pVal) {
        result := ComCall(62, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentVolume(pVal) {
        result := ComCall(63, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentDiscSide(pVal) {
        result := ComCall(64, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentDomain(pVal) {
        result := ComCall(65, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentChapter(pVal) {
        result := ComCall(66, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentTitle(pVal) {
        result := ComCall(67, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentTime(pVal) {
        result := ComCall(68, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} timeCode 
     * @param {Pointer<BSTR>} pTimeStr 
     * @returns {HRESULT} 
     */
    DVDTimeCode2bstr(timeCode, pTimeStr) {
        result := ComCall(69, this, "int", timeCode, "ptr", pTimeStr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DVDDirectory(pVal) {
        result := ComCall(70, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DVDDirectory(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(71, this, "ptr", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lstream 
     * @param {Pointer<VARIANT_BOOL>} fEnabled 
     * @returns {HRESULT} 
     */
    IsSubpictureStreamEnabled(lstream, fEnabled) {
        result := ComCall(72, this, "int", lstream, "ptr", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lstream 
     * @param {Pointer<VARIANT_BOOL>} fEnabled 
     * @returns {HRESULT} 
     */
    IsAudioStreamEnabled(lstream, fEnabled) {
        result := ComCall(73, this, "int", lstream, "ptr", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentSubpictureStream(pVal) {
        result := ComCall(74, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentSubpictureStream(newVal) {
        result := ComCall(75, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {Pointer<BSTR>} strLanguage 
     * @returns {HRESULT} 
     */
    get_SubpictureLanguage(lStream, strLanguage) {
        result := ComCall(76, this, "int", lStream, "ptr", strLanguage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentAudioStream(pVal) {
        result := ComCall(77, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentAudioStream(newVal) {
        result := ComCall(78, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_AudioStreamsAvailable(pVal) {
        result := ComCall(79, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_AnglesAvailable(pVal) {
        result := ComCall(80, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentAngle(pVal) {
        result := ComCall(81, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentAngle(newVal) {
        result := ComCall(82, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_SubpictureStreamsAvailable(pVal) {
        result := ComCall(83, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_SubpictureOn(pVal) {
        result := ComCall(84, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_SubpictureOn(newVal) {
        result := ComCall(85, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DVDUniqueID(pVal) {
        result := ComCall(86, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAccept 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     */
    AcceptParentalLevelChange(fAccept, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(87, this, "short", fAccept, "ptr", strUserName, "ptr", strPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    NotifyParentalLevelChange(newVal) {
        result := ComCall(88, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCountry 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     */
    SelectParentalCountry(lCountry, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(89, this, "int", lCountry, "ptr", strUserName, "ptr", strPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lParentalLevel 
     * @param {BSTR} strUserName 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     */
    SelectParentalLevel(lParentalLevel, strUserName, strPassword) {
        strUserName := strUserName is String ? BSTR.Alloc(strUserName).Value : strUserName
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(90, this, "int", lParentalLevel, "ptr", strUserName, "ptr", strPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {Pointer<Int32>} plParentalLevels 
     * @returns {HRESULT} 
     */
    get_TitleParentalLevels(lTitle, plParentalLevels) {
        result := ComCall(91, this, "int", lTitle, "int*", plParentalLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCountryCode 
     * @returns {HRESULT} 
     */
    get_PlayerParentalCountry(plCountryCode) {
        result := ComCall(92, this, "int*", plCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plParentalLevel 
     * @returns {HRESULT} 
     */
    get_PlayerParentalLevel(plParentalLevel) {
        result := ComCall(93, this, "int*", plParentalLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Eject() {
        result := ComCall(94, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lUOP 
     * @param {Pointer<VARIANT_BOOL>} pfValid 
     * @returns {HRESULT} 
     */
    UOPValid(lUOP, pfValid) {
        result := ComCall(95, this, "int", lUOP, "ptr", pfValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Int16>} psSPRM 
     * @returns {HRESULT} 
     */
    get_SPRM(lIndex, psSPRM) {
        result := ComCall(96, this, "int", lIndex, "short*", psSPRM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Int16>} psSPRM 
     * @returns {HRESULT} 
     */
    get_GPRM(lIndex, psSPRM) {
        result := ComCall(97, this, "int", lIndex, "short*", psSPRM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} sValue 
     * @returns {HRESULT} 
     */
    put_GPRM(lIndex, sValue) {
        result := ComCall(98, this, "int", lIndex, "short", sValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Integer} lStringIndex 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    get_DVDTextStringType(lLangIndex, lStringIndex, pType) {
        result := ComCall(99, this, "int", lLangIndex, "int", lStringIndex, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Integer} lStringIndex 
     * @param {Pointer<BSTR>} pstrText 
     * @returns {HRESULT} 
     */
    get_DVDTextString(lLangIndex, lStringIndex, pstrText) {
        result := ComCall(100, this, "int", lLangIndex, "int", lStringIndex, "ptr", pstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Pointer<Int32>} plNumOfStrings 
     * @returns {HRESULT} 
     */
    get_DVDTextNumberOfStrings(lLangIndex, plNumOfStrings) {
        result := ComCall(101, this, "int", lLangIndex, "int*", plNumOfStrings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plNumOfLangs 
     * @returns {HRESULT} 
     */
    get_DVDTextNumberOfLanguages(plNumOfLangs) {
        result := ComCall(102, this, "int*", plNumOfLangs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Pointer<Int32>} lcid 
     * @returns {HRESULT} 
     */
    get_DVDTextLanguageLCID(lLangIndex, lcid) {
        result := ComCall(103, this, "int", lLangIndex, "int*", lcid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RegionChange() {
        result := ComCall(104, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pVal 
     * @returns {HRESULT} 
     */
    get_DVDAdm(pVal) {
        result := ComCall(105, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteBookmark() {
        result := ComCall(106, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreBookmark() {
        result := ComCall(107, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveBookmark() {
        result := ComCall(108, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lang 
     * @param {Integer} ext 
     * @returns {HRESULT} 
     */
    SelectDefaultAudioLanguage(lang, ext) {
        result := ComCall(109, this, "int", lang, "int", ext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lang 
     * @param {Integer} ext 
     * @returns {HRESULT} 
     */
    SelectDefaultSubpictureLanguage(lang, ext) {
        result := ComCall(110, this, "int", lang, "int", ext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_PreferredSubpictureStream(pVal) {
        result := ComCall(111, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lang 
     * @returns {HRESULT} 
     */
    get_DefaultMenuLanguage(lang) {
        result := ComCall(112, this, "int*", lang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lang 
     * @returns {HRESULT} 
     */
    put_DefaultMenuLanguage(lang) {
        result := ComCall(113, this, "int", lang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lang 
     * @returns {HRESULT} 
     */
    get_DefaultSubpictureLanguage(lang) {
        result := ComCall(114, this, "int*", lang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lang 
     * @returns {HRESULT} 
     */
    get_DefaultAudioLanguage(lang) {
        result := ComCall(115, this, "int*", lang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ext 
     * @returns {HRESULT} 
     */
    get_DefaultSubpictureLanguageExt(ext) {
        result := ComCall(116, this, "int*", ext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ext 
     * @returns {HRESULT} 
     */
    get_DefaultAudioLanguageExt(ext) {
        result := ComCall(117, this, "int*", ext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} lang 
     * @returns {HRESULT} 
     */
    get_LanguageFromLCID(lcid, lang) {
        result := ComCall(118, this, "int", lcid, "ptr", lang, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_KaraokeAudioPresentationMode(pVal) {
        result := ComCall(119, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_KaraokeAudioPresentationMode(newVal) {
        result := ComCall(120, this, "int", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {Integer} lChan 
     * @param {Pointer<Int32>} lContent 
     * @returns {HRESULT} 
     */
    get_KaraokeChannelContent(lStream, lChan, lContent) {
        result := ComCall(121, this, "int", lStream, "int", lChan, "int*", lContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {Pointer<Int32>} lChannelAssignment 
     * @returns {HRESULT} 
     */
    get_KaraokeChannelAssignment(lStream, lChannelAssignment) {
        result := ComCall(122, this, "int", lStream, "int*", lChannelAssignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestorePreferredSettings() {
        result := ComCall(123, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButton 
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     */
    get_ButtonRect(lButton, pRect) {
        result := ComCall(124, this, "int", lButton, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} ppRect 
     * @returns {HRESULT} 
     */
    get_DVDScreenInMouseCoordinates(ppRect) {
        result := ComCall(125, this, "ptr", ppRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     */
    put_DVDScreenInMouseCoordinates(pRect) {
        result := ComCall(126, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

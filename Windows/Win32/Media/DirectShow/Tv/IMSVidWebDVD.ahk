#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk
#Include .\IMSVidRect.ahk
#Include .\IMSVidPlayback.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidWebDVD extends IMSVidPlayback{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDVDEvent", "PlayTitle", "PlayChapterInTitle", "PlayChapter", "PlayChaptersAutoStop", "PlayAtTime", "PlayAtTimeInTitle", "PlayPeriodInTitleAutoStop", "ReplayChapter", "PlayPrevChapter", "PlayNextChapter", "StillOff", "get_AudioLanguage", "ShowMenu", "Resume", "ReturnFromSubmenu", "get_ButtonsAvailable", "get_CurrentButton", "SelectAndActivateButton", "ActivateButton", "SelectRightButton", "SelectLeftButton", "SelectLowerButton", "SelectUpperButton", "ActivateAtPosition", "SelectAtPosition", "get_ButtonAtPosition", "get_NumberOfChapters", "get_TotalTitleTime", "get_TitlesAvailable", "get_VolumesAvailable", "get_CurrentVolume", "get_CurrentDiscSide", "get_CurrentDomain", "get_CurrentChapter", "get_CurrentTitle", "get_CurrentTime", "DVDTimeCode2bstr", "get_DVDDirectory", "put_DVDDirectory", "IsSubpictureStreamEnabled", "IsAudioStreamEnabled", "get_CurrentSubpictureStream", "put_CurrentSubpictureStream", "get_SubpictureLanguage", "get_CurrentAudioStream", "put_CurrentAudioStream", "get_AudioStreamsAvailable", "get_AnglesAvailable", "get_CurrentAngle", "put_CurrentAngle", "get_SubpictureStreamsAvailable", "get_SubpictureOn", "put_SubpictureOn", "get_DVDUniqueID", "AcceptParentalLevelChange", "NotifyParentalLevelChange", "SelectParentalCountry", "SelectParentalLevel", "get_TitleParentalLevels", "get_PlayerParentalCountry", "get_PlayerParentalLevel", "Eject", "UOPValid", "get_SPRM", "get_GPRM", "put_GPRM", "get_DVDTextStringType", "get_DVDTextString", "get_DVDTextNumberOfStrings", "get_DVDTextNumberOfLanguages", "get_DVDTextLanguageLCID", "RegionChange", "get_DVDAdm", "DeleteBookmark", "RestoreBookmark", "SaveBookmark", "SelectDefaultAudioLanguage", "SelectDefaultSubpictureLanguage", "get_PreferredSubpictureStream", "get_DefaultMenuLanguage", "put_DefaultMenuLanguage", "get_DefaultSubpictureLanguage", "get_DefaultAudioLanguage", "get_DefaultSubpictureLanguageExt", "get_DefaultAudioLanguageExt", "get_LanguageFromLCID", "get_KaraokeAudioPresentationMode", "put_KaraokeAudioPresentationMode", "get_KaraokeChannelContent", "get_KaraokeChannelAssignment", "RestorePreferredSettings", "get_ButtonRect", "get_DVDScreenInMouseCoordinates", "put_DVDScreenInMouseCoordinates"]

    /**
     * 
     * @param {Integer} lEvent 
     * @param {Pointer} lParam1 
     * @param {Pointer} lParam2 
     * @returns {HRESULT} 
     */
    OnDVDEvent(lEvent, lParam1, lParam2) {
        result := ComCall(32, this, "int", lEvent, "ptr", lParam1, "ptr", lParam2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @returns {HRESULT} 
     */
    PlayTitle(lTitle) {
        result := ComCall(33, this, "int", lTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {Integer} lChapter 
     * @returns {HRESULT} 
     */
    PlayChapterInTitle(lTitle, lChapter) {
        result := ComCall(34, this, "int", lTitle, "int", lChapter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lChapter 
     * @returns {HRESULT} 
     */
    PlayChapter(lChapter) {
        result := ComCall(35, this, "int", lChapter, "HRESULT")
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
        result := ComCall(36, this, "int", lTitle, "int", lstrChapter, "int", lChapterCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strTime 
     * @returns {HRESULT} 
     */
    PlayAtTime(strTime) {
        strTime := strTime is String ? BSTR.Alloc(strTime).Value : strTime

        result := ComCall(37, this, "ptr", strTime, "HRESULT")
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

        result := ComCall(38, this, "int", lTitle, "ptr", strTime, "HRESULT")
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

        result := ComCall(39, this, "int", lTitle, "ptr", strStartTime, "ptr", strEndTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReplayChapter() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PlayPrevChapter() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PlayNextChapter() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StillOff() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {VARIANT_BOOL} fFormat 
     * @returns {BSTR} 
     */
    get_AudioLanguage(lStream, fFormat) {
        strAudioLang := BSTR()
        result := ComCall(44, this, "int", lStream, "short", fFormat, "ptr", strAudioLang, "HRESULT")
        return strAudioLang
    }

    /**
     * 
     * @param {Integer} MenuID 
     * @returns {HRESULT} 
     */
    ShowMenu(MenuID) {
        result := ComCall(45, this, "int", MenuID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReturnFromSubmenu() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ButtonsAvailable() {
        result := ComCall(48, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentButton() {
        result := ComCall(49, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lButton 
     * @returns {HRESULT} 
     */
    SelectAndActivateButton(lButton) {
        result := ComCall(50, this, "int", lButton, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ActivateButton() {
        result := ComCall(51, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectRightButton() {
        result := ComCall(52, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectLeftButton() {
        result := ComCall(53, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectLowerButton() {
        result := ComCall(54, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SelectUpperButton() {
        result := ComCall(55, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} 
     */
    ActivateAtPosition(xPos, yPos) {
        result := ComCall(56, this, "int", xPos, "int", yPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {HRESULT} 
     */
    SelectAtPosition(xPos, yPos) {
        result := ComCall(57, this, "int", xPos, "int", yPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} xPos 
     * @param {Integer} yPos 
     * @returns {Integer} 
     */
    get_ButtonAtPosition(xPos, yPos) {
        result := ComCall(58, this, "int", xPos, "int", yPos, "int*", &plButton := 0, "HRESULT")
        return plButton
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @returns {Integer} 
     */
    get_NumberOfChapters(lTitle) {
        result := ComCall(59, this, "int", lTitle, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_TotalTitleTime() {
        pVal := BSTR()
        result := ComCall(60, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TitlesAvailable() {
        result := ComCall(61, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VolumesAvailable() {
        result := ComCall(62, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentVolume() {
        result := ComCall(63, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentDiscSide() {
        result := ComCall(64, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentDomain() {
        result := ComCall(65, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentChapter() {
        result := ComCall(66, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentTitle() {
        result := ComCall(67, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CurrentTime() {
        pVal := BSTR()
        result := ComCall(68, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} timeCode 
     * @returns {BSTR} 
     */
    DVDTimeCode2bstr(timeCode) {
        pTimeStr := BSTR()
        result := ComCall(69, this, "int", timeCode, "ptr", pTimeStr, "HRESULT")
        return pTimeStr
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DVDDirectory() {
        pVal := BSTR()
        result := ComCall(70, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_DVDDirectory(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(71, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lstream 
     * @returns {VARIANT_BOOL} 
     */
    IsSubpictureStreamEnabled(lstream) {
        result := ComCall(72, this, "int", lstream, "short*", &fEnabled := 0, "HRESULT")
        return fEnabled
    }

    /**
     * 
     * @param {Integer} lstream 
     * @returns {VARIANT_BOOL} 
     */
    IsAudioStreamEnabled(lstream) {
        result := ComCall(73, this, "int", lstream, "short*", &fEnabled := 0, "HRESULT")
        return fEnabled
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentSubpictureStream() {
        result := ComCall(74, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentSubpictureStream(newVal) {
        result := ComCall(75, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @returns {BSTR} 
     */
    get_SubpictureLanguage(lStream) {
        strLanguage := BSTR()
        result := ComCall(76, this, "int", lStream, "ptr", strLanguage, "HRESULT")
        return strLanguage
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentAudioStream() {
        result := ComCall(77, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentAudioStream(newVal) {
        result := ComCall(78, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioStreamsAvailable() {
        result := ComCall(79, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AnglesAvailable() {
        result := ComCall(80, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentAngle() {
        result := ComCall(81, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_CurrentAngle(newVal) {
        result := ComCall(82, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubpictureStreamsAvailable() {
        result := ComCall(83, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_SubpictureOn() {
        result := ComCall(84, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_SubpictureOn(newVal) {
        result := ComCall(85, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DVDUniqueID() {
        pVal := BSTR()
        result := ComCall(86, this, "ptr", pVal, "HRESULT")
        return pVal
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

        result := ComCall(87, this, "short", fAccept, "ptr", strUserName, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    NotifyParentalLevelChange(newVal) {
        result := ComCall(88, this, "short", newVal, "HRESULT")
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

        result := ComCall(89, this, "int", lCountry, "ptr", strUserName, "ptr", strPassword, "HRESULT")
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

        result := ComCall(90, this, "int", lParentalLevel, "ptr", strUserName, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @returns {Integer} 
     */
    get_TitleParentalLevels(lTitle) {
        result := ComCall(91, this, "int", lTitle, "int*", &plParentalLevels := 0, "HRESULT")
        return plParentalLevels
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlayerParentalCountry() {
        result := ComCall(92, this, "int*", &plCountryCode := 0, "HRESULT")
        return plCountryCode
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlayerParentalLevel() {
        result := ComCall(93, this, "int*", &plParentalLevel := 0, "HRESULT")
        return plParentalLevel
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Eject() {
        result := ComCall(94, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lUOP 
     * @returns {VARIANT_BOOL} 
     */
    UOPValid(lUOP) {
        result := ComCall(95, this, "int", lUOP, "short*", &pfValid := 0, "HRESULT")
        return pfValid
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    get_SPRM(lIndex) {
        result := ComCall(96, this, "int", lIndex, "short*", &psSPRM := 0, "HRESULT")
        return psSPRM
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {Integer} 
     */
    get_GPRM(lIndex) {
        result := ComCall(97, this, "int", lIndex, "short*", &psSPRM := 0, "HRESULT")
        return psSPRM
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Integer} sValue 
     * @returns {HRESULT} 
     */
    put_GPRM(lIndex, sValue) {
        result := ComCall(98, this, "int", lIndex, "short", sValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Integer} lStringIndex 
     * @returns {Integer} 
     */
    get_DVDTextStringType(lLangIndex, lStringIndex) {
        result := ComCall(99, this, "int", lLangIndex, "int", lStringIndex, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Integer} lStringIndex 
     * @returns {BSTR} 
     */
    get_DVDTextString(lLangIndex, lStringIndex) {
        pstrText := BSTR()
        result := ComCall(100, this, "int", lLangIndex, "int", lStringIndex, "ptr", pstrText, "HRESULT")
        return pstrText
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @returns {Integer} 
     */
    get_DVDTextNumberOfStrings(lLangIndex) {
        result := ComCall(101, this, "int", lLangIndex, "int*", &plNumOfStrings := 0, "HRESULT")
        return plNumOfStrings
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DVDTextNumberOfLanguages() {
        result := ComCall(102, this, "int*", &plNumOfLangs := 0, "HRESULT")
        return plNumOfLangs
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @returns {Integer} 
     */
    get_DVDTextLanguageLCID(lLangIndex) {
        result := ComCall(103, this, "int", lLangIndex, "int*", &lcid := 0, "HRESULT")
        return lcid
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RegionChange() {
        result := ComCall(104, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_DVDAdm() {
        result := ComCall(105, this, "ptr*", &pVal := 0, "HRESULT")
        return IDispatch(pVal)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteBookmark() {
        result := ComCall(106, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreBookmark() {
        result := ComCall(107, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SaveBookmark() {
        result := ComCall(108, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lang 
     * @param {Integer} ext 
     * @returns {HRESULT} 
     */
    SelectDefaultAudioLanguage(lang, ext) {
        result := ComCall(109, this, "int", lang, "int", ext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lang 
     * @param {Integer} ext 
     * @returns {HRESULT} 
     */
    SelectDefaultSubpictureLanguage(lang, ext) {
        result := ComCall(110, this, "int", lang, "int", ext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredSubpictureStream() {
        result := ComCall(111, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultMenuLanguage() {
        result := ComCall(112, this, "int*", &lang := 0, "HRESULT")
        return lang
    }

    /**
     * 
     * @param {Integer} lang 
     * @returns {HRESULT} 
     */
    put_DefaultMenuLanguage(lang) {
        result := ComCall(113, this, "int", lang, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSubpictureLanguage() {
        result := ComCall(114, this, "int*", &lang := 0, "HRESULT")
        return lang
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultAudioLanguage() {
        result := ComCall(115, this, "int*", &lang := 0, "HRESULT")
        return lang
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultSubpictureLanguageExt() {
        result := ComCall(116, this, "int*", &ext := 0, "HRESULT")
        return ext
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultAudioLanguageExt() {
        result := ComCall(117, this, "int*", &ext := 0, "HRESULT")
        return ext
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {BSTR} 
     */
    get_LanguageFromLCID(lcid) {
        lang := BSTR()
        result := ComCall(118, this, "int", lcid, "ptr", lang, "HRESULT")
        return lang
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KaraokeAudioPresentationMode() {
        result := ComCall(119, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} newVal 
     * @returns {HRESULT} 
     */
    put_KaraokeAudioPresentationMode(newVal) {
        result := ComCall(120, this, "int", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {Integer} lChan 
     * @returns {Integer} 
     */
    get_KaraokeChannelContent(lStream, lChan) {
        result := ComCall(121, this, "int", lStream, "int", lChan, "int*", &lContent := 0, "HRESULT")
        return lContent
    }

    /**
     * 
     * @param {Integer} lStream 
     * @returns {Integer} 
     */
    get_KaraokeChannelAssignment(lStream) {
        result := ComCall(122, this, "int", lStream, "int*", &lChannelAssignment := 0, "HRESULT")
        return lChannelAssignment
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestorePreferredSettings() {
        result := ComCall(123, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButton 
     * @returns {IMSVidRect} 
     */
    get_ButtonRect(lButton) {
        result := ComCall(124, this, "int", lButton, "ptr*", &pRect := 0, "HRESULT")
        return IMSVidRect(pRect)
    }

    /**
     * 
     * @returns {IMSVidRect} 
     */
    get_DVDScreenInMouseCoordinates() {
        result := ComCall(125, this, "ptr*", &ppRect := 0, "HRESULT")
        return IMSVidRect(ppRect)
    }

    /**
     * 
     * @param {IMSVidRect} pRect 
     * @returns {HRESULT} 
     */
    put_DVDScreenInMouseCoordinates(pRect) {
        result := ComCall(126, this, "ptr", pRect, "HRESULT")
        return result
    }
}

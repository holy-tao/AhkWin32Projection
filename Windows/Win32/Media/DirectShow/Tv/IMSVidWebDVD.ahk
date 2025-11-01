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
     * @param {Pointer<BSTR>} strAudioLang 
     * @returns {HRESULT} 
     */
    get_AudioLanguage(lStream, fFormat, strAudioLang) {
        result := ComCall(44, this, "int", lStream, "short", fFormat, "ptr", strAudioLang, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ButtonsAvailable(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentButton(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} plButton 
     * @returns {HRESULT} 
     */
    get_ButtonAtPosition(xPos, yPos, plButton) {
        plButtonMarshal := plButton is VarRef ? "int*" : "ptr"

        result := ComCall(58, this, "int", xPos, "int", yPos, plButtonMarshal, plButton, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lTitle 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_NumberOfChapters(lTitle, pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(59, this, "int", lTitle, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_TotalTitleTime(pVal) {
        result := ComCall(60, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_TitlesAvailable(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(61, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_VolumesAvailable(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(62, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentVolume(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(63, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentDiscSide(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentDomain(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(65, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentChapter(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(66, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentTitle(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(67, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentTime(pVal) {
        result := ComCall(68, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timeCode 
     * @param {Pointer<BSTR>} pTimeStr 
     * @returns {HRESULT} 
     */
    DVDTimeCode2bstr(timeCode, pTimeStr) {
        result := ComCall(69, this, "int", timeCode, "ptr", pTimeStr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DVDDirectory(pVal) {
        result := ComCall(70, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} fEnabled 
     * @returns {HRESULT} 
     */
    IsSubpictureStreamEnabled(lstream, fEnabled) {
        result := ComCall(72, this, "int", lstream, "ptr", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lstream 
     * @param {Pointer<VARIANT_BOOL>} fEnabled 
     * @returns {HRESULT} 
     */
    IsAudioStreamEnabled(lstream, fEnabled) {
        result := ComCall(73, this, "int", lstream, "ptr", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentSubpictureStream(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(74, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} strLanguage 
     * @returns {HRESULT} 
     */
    get_SubpictureLanguage(lStream, strLanguage) {
        result := ComCall(76, this, "int", lStream, "ptr", strLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentAudioStream(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(77, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_AudioStreamsAvailable(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(79, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_AnglesAvailable(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(80, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_CurrentAngle(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(81, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_SubpictureStreamsAvailable(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(83, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_SubpictureOn(pVal) {
        result := ComCall(84, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_DVDUniqueID(pVal) {
        result := ComCall(86, this, "ptr", pVal, "HRESULT")
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
     * @param {Pointer<Integer>} plParentalLevels 
     * @returns {HRESULT} 
     */
    get_TitleParentalLevels(lTitle, plParentalLevels) {
        plParentalLevelsMarshal := plParentalLevels is VarRef ? "int*" : "ptr"

        result := ComCall(91, this, "int", lTitle, plParentalLevelsMarshal, plParentalLevels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCountryCode 
     * @returns {HRESULT} 
     */
    get_PlayerParentalCountry(plCountryCode) {
        plCountryCodeMarshal := plCountryCode is VarRef ? "int*" : "ptr"

        result := ComCall(92, this, plCountryCodeMarshal, plCountryCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plParentalLevel 
     * @returns {HRESULT} 
     */
    get_PlayerParentalLevel(plParentalLevel) {
        plParentalLevelMarshal := plParentalLevel is VarRef ? "int*" : "ptr"

        result := ComCall(93, this, plParentalLevelMarshal, plParentalLevel, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pfValid 
     * @returns {HRESULT} 
     */
    UOPValid(lUOP, pfValid) {
        result := ComCall(95, this, "int", lUOP, "ptr", pfValid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} psSPRM 
     * @returns {HRESULT} 
     */
    get_SPRM(lIndex, psSPRM) {
        psSPRMMarshal := psSPRM is VarRef ? "short*" : "ptr"

        result := ComCall(96, this, "int", lIndex, psSPRMMarshal, psSPRM, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<Integer>} psSPRM 
     * @returns {HRESULT} 
     */
    get_GPRM(lIndex, psSPRM) {
        psSPRMMarshal := psSPRM is VarRef ? "short*" : "ptr"

        result := ComCall(97, this, "int", lIndex, psSPRMMarshal, psSPRM, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     */
    get_DVDTextStringType(lLangIndex, lStringIndex, pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(99, this, "int", lLangIndex, "int", lStringIndex, pTypeMarshal, pType, "HRESULT")
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
        result := ComCall(100, this, "int", lLangIndex, "int", lStringIndex, "ptr", pstrText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Pointer<Integer>} plNumOfStrings 
     * @returns {HRESULT} 
     */
    get_DVDTextNumberOfStrings(lLangIndex, plNumOfStrings) {
        plNumOfStringsMarshal := plNumOfStrings is VarRef ? "int*" : "ptr"

        result := ComCall(101, this, "int", lLangIndex, plNumOfStringsMarshal, plNumOfStrings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plNumOfLangs 
     * @returns {HRESULT} 
     */
    get_DVDTextNumberOfLanguages(plNumOfLangs) {
        plNumOfLangsMarshal := plNumOfLangs is VarRef ? "int*" : "ptr"

        result := ComCall(102, this, plNumOfLangsMarshal, plNumOfLangs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLangIndex 
     * @param {Pointer<Integer>} lcid 
     * @returns {HRESULT} 
     */
    get_DVDTextLanguageLCID(lLangIndex, lcid) {
        lcidMarshal := lcid is VarRef ? "int*" : "ptr"

        result := ComCall(103, this, "int", lLangIndex, lcidMarshal, lcid, "HRESULT")
        return result
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
     * @param {Pointer<IDispatch>} pVal 
     * @returns {HRESULT} 
     */
    get_DVDAdm(pVal) {
        result := ComCall(105, this, "ptr*", pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_PreferredSubpictureStream(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(111, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lang 
     * @returns {HRESULT} 
     */
    get_DefaultMenuLanguage(lang) {
        langMarshal := lang is VarRef ? "int*" : "ptr"

        result := ComCall(112, this, langMarshal, lang, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} lang 
     * @returns {HRESULT} 
     */
    get_DefaultSubpictureLanguage(lang) {
        langMarshal := lang is VarRef ? "int*" : "ptr"

        result := ComCall(114, this, langMarshal, lang, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lang 
     * @returns {HRESULT} 
     */
    get_DefaultAudioLanguage(lang) {
        langMarshal := lang is VarRef ? "int*" : "ptr"

        result := ComCall(115, this, langMarshal, lang, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ext 
     * @returns {HRESULT} 
     */
    get_DefaultSubpictureLanguageExt(ext) {
        extMarshal := ext is VarRef ? "int*" : "ptr"

        result := ComCall(116, this, extMarshal, ext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ext 
     * @returns {HRESULT} 
     */
    get_DefaultAudioLanguageExt(ext) {
        extMarshal := ext is VarRef ? "int*" : "ptr"

        result := ComCall(117, this, extMarshal, ext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} lang 
     * @returns {HRESULT} 
     */
    get_LanguageFromLCID(lcid, lang) {
        result := ComCall(118, this, "int", lcid, "ptr", lang, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_KaraokeAudioPresentationMode(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(119, this, pValMarshal, pVal, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} lContent 
     * @returns {HRESULT} 
     */
    get_KaraokeChannelContent(lStream, lChan, lContent) {
        lContentMarshal := lContent is VarRef ? "int*" : "ptr"

        result := ComCall(121, this, "int", lStream, "int", lChan, lContentMarshal, lContent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lStream 
     * @param {Pointer<Integer>} lChannelAssignment 
     * @returns {HRESULT} 
     */
    get_KaraokeChannelAssignment(lStream, lChannelAssignment) {
        lChannelAssignmentMarshal := lChannelAssignment is VarRef ? "int*" : "ptr"

        result := ComCall(122, this, "int", lStream, lChannelAssignmentMarshal, lChannelAssignment, "HRESULT")
        return result
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
     * @param {Pointer<IMSVidRect>} pRect 
     * @returns {HRESULT} 
     */
    get_ButtonRect(lButton, pRect) {
        result := ComCall(124, this, "int", lButton, "ptr*", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidRect>} ppRect 
     * @returns {HRESULT} 
     */
    get_DVDScreenInMouseCoordinates(ppRect) {
        result := ComCall(125, this, "ptr*", ppRect, "HRESULT")
        return result
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

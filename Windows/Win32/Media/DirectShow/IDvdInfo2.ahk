#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDvdInfo2 interface reports attributes of a DVD disc or the current state of DVD playback and navigation.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdinfo2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdInfo2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdInfo2
     * @type {Guid}
     */
    static IID => Guid("{34151510-eec0-11d2-8201-00a0c9d74842}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentDomain", "GetCurrentLocation", "GetTotalTitleTime", "GetCurrentButton", "GetCurrentAngle", "GetCurrentAudio", "GetCurrentSubpicture", "GetCurrentUOPS", "GetAllSPRMs", "GetAllGPRMs", "GetAudioLanguage", "GetSubpictureLanguage", "GetTitleAttributes", "GetVMGAttributes", "GetCurrentVideoAttributes", "GetAudioAttributes", "GetKaraokeAttributes", "GetSubpictureAttributes", "GetDVDVolumeInfo", "GetDVDTextNumberOfLanguages", "GetDVDTextLanguageInfo", "GetDVDTextStringAsNative", "GetDVDTextStringAsUnicode", "GetPlayerParentalLevel", "GetNumberOfChapters", "GetTitleParentalLevels", "GetDVDDirectory", "IsAudioStreamEnabled", "GetDiscID", "GetState", "GetMenuLanguages", "GetButtonAtPosition", "GetCmdFromEvent", "GetDefaultMenuLanguage", "GetDefaultAudioLanguage", "GetDefaultSubpictureLanguage", "GetDecoderCaps", "GetButtonRect", "IsSubpictureStreamEnabled"]

    /**
     * 
     * @param {Pointer<Integer>} pDomain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentdomain
     */
    GetCurrentDomain(pDomain) {
        pDomainMarshal := pDomain is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pDomainMarshal, pDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_PLAYBACK_LOCATION2>} pLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentlocation
     */
    GetCurrentLocation(pLocation) {
        result := ComCall(4, this, "ptr", pLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pTotalTime 
     * @param {Pointer<Integer>} ulTimeCodeFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-gettotaltitletime
     */
    GetTotalTitleTime(pTotalTime, ulTimeCodeFlags) {
        ulTimeCodeFlagsMarshal := ulTimeCodeFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pTotalTime, ulTimeCodeFlagsMarshal, ulTimeCodeFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulButtonsAvailable 
     * @param {Pointer<Integer>} pulCurrentButton 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentbutton
     */
    GetCurrentButton(pulButtonsAvailable, pulCurrentButton) {
        pulButtonsAvailableMarshal := pulButtonsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentButtonMarshal := pulCurrentButton is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pulButtonsAvailableMarshal, pulButtonsAvailable, pulCurrentButtonMarshal, pulCurrentButton, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulAnglesAvailable 
     * @param {Pointer<Integer>} pulCurrentAngle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentangle
     */
    GetCurrentAngle(pulAnglesAvailable, pulCurrentAngle) {
        pulAnglesAvailableMarshal := pulAnglesAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentAngleMarshal := pulCurrentAngle is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pulAnglesAvailableMarshal, pulAnglesAvailable, pulCurrentAngleMarshal, pulCurrentAngle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStreamsAvailable 
     * @param {Pointer<Integer>} pulCurrentStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentaudio
     */
    GetCurrentAudio(pulStreamsAvailable, pulCurrentStream) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStreamsAvailable 
     * @param {Pointer<Integer>} pulCurrentStream 
     * @param {Pointer<BOOL>} pbIsDisabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentsubpicture
     */
    GetCurrentSubpicture(pulStreamsAvailable, pulCurrentStream, pbIsDisabled) {
        pulStreamsAvailableMarshal := pulStreamsAvailable is VarRef ? "uint*" : "ptr"
        pulCurrentStreamMarshal := pulCurrentStream is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pulStreamsAvailableMarshal, pulStreamsAvailable, pulCurrentStreamMarshal, pulCurrentStream, "ptr", pbIsDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulUOPs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentuops
     */
    GetCurrentUOPS(pulUOPs) {
        pulUOPsMarshal := pulUOPs is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, pulUOPsMarshal, pulUOPs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pRegisterArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getallsprms
     */
    GetAllSPRMs(pRegisterArray) {
        result := ComCall(11, this, "ptr*", pRegisterArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pRegisterArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getallgprms
     */
    GetAllGPRMs(pRegisterArray) {
        result := ComCall(12, this, "ptr*", pRegisterArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<Integer>} pLanguage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getaudiolanguage
     */
    GetAudioLanguage(ulStream, pLanguage) {
        pLanguageMarshal := pLanguage is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", ulStream, pLanguageMarshal, pLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<Integer>} pLanguage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getsubpicturelanguage
     */
    GetSubpictureLanguage(ulStream, pLanguage) {
        pLanguageMarshal := pLanguage is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", ulStream, pLanguageMarshal, pLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<DVD_MenuAttributes>} pMenu 
     * @param {Pointer<DVD_TitleAttributes>} pTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-gettitleattributes
     */
    GetTitleAttributes(ulTitle, pMenu, pTitle) {
        result := ComCall(15, this, "uint", ulTitle, "ptr", pMenu, "ptr", pTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_MenuAttributes>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getvmgattributes
     */
    GetVMGAttributes(pATR) {
        result := ComCall(16, this, "ptr", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_VideoAttributes>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcurrentvideoattributes
     */
    GetCurrentVideoAttributes(pATR) {
        result := ComCall(17, this, "ptr", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<DVD_AudioAttributes>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getaudioattributes
     */
    GetAudioAttributes(ulStream, pATR) {
        result := ComCall(18, this, "uint", ulStream, "ptr", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<DVD_KaraokeAttributes>} pAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getkaraokeattributes
     */
    GetKaraokeAttributes(ulStream, pAttributes) {
        result := ComCall(19, this, "uint", ulStream, "ptr", pAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<DVD_SubpictureAttributes>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getsubpictureattributes
     */
    GetSubpictureAttributes(ulStream, pATR) {
        result := ComCall(20, this, "uint", ulStream, "ptr", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulNumOfVolumes 
     * @param {Pointer<Integer>} pulVolume 
     * @param {Pointer<Integer>} pSide 
     * @param {Pointer<Integer>} pulNumOfTitles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdvolumeinfo
     */
    GetDVDVolumeInfo(pulNumOfVolumes, pulVolume, pSide, pulNumOfTitles) {
        pulNumOfVolumesMarshal := pulNumOfVolumes is VarRef ? "uint*" : "ptr"
        pulVolumeMarshal := pulVolume is VarRef ? "uint*" : "ptr"
        pSideMarshal := pSide is VarRef ? "int*" : "ptr"
        pulNumOfTitlesMarshal := pulNumOfTitles is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pulNumOfVolumesMarshal, pulNumOfVolumes, pulVolumeMarshal, pulVolume, pSideMarshal, pSide, pulNumOfTitlesMarshal, pulNumOfTitles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulNumOfLangs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextnumberoflanguages
     */
    GetDVDTextNumberOfLanguages(pulNumOfLangs) {
        pulNumOfLangsMarshal := pulNumOfLangs is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pulNumOfLangsMarshal, pulNumOfLangs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulLangIndex 
     * @param {Pointer<Integer>} pulNumOfStrings 
     * @param {Pointer<Integer>} pLangCode 
     * @param {Pointer<Integer>} pbCharacterSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextlanguageinfo
     */
    GetDVDTextLanguageInfo(ulLangIndex, pulNumOfStrings, pLangCode, pbCharacterSet) {
        pulNumOfStringsMarshal := pulNumOfStrings is VarRef ? "uint*" : "ptr"
        pLangCodeMarshal := pLangCode is VarRef ? "uint*" : "ptr"
        pbCharacterSetMarshal := pbCharacterSet is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, "uint", ulLangIndex, pulNumOfStringsMarshal, pulNumOfStrings, pLangCodeMarshal, pLangCode, pbCharacterSetMarshal, pbCharacterSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulLangIndex 
     * @param {Integer} ulStringIndex 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Integer} ulMaxBufferSize 
     * @param {Pointer<Integer>} pulActualSize 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasnative
     */
    GetDVDTextStringAsNative(ulLangIndex, ulStringIndex, pbBuffer, ulMaxBufferSize, pulActualSize, pType) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pulActualSizeMarshal := pulActualSize is VarRef ? "uint*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "uint", ulLangIndex, "uint", ulStringIndex, pbBufferMarshal, pbBuffer, "uint", ulMaxBufferSize, pulActualSizeMarshal, pulActualSize, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulLangIndex 
     * @param {Integer} ulStringIndex 
     * @param {PWSTR} pchwBuffer 
     * @param {Integer} ulMaxBufferSize 
     * @param {Pointer<Integer>} pulActualSize 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvdtextstringasunicode
     */
    GetDVDTextStringAsUnicode(ulLangIndex, ulStringIndex, pchwBuffer, ulMaxBufferSize, pulActualSize, pType) {
        pchwBuffer := pchwBuffer is String ? StrPtr(pchwBuffer) : pchwBuffer

        pulActualSizeMarshal := pulActualSize is VarRef ? "uint*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "uint", ulLangIndex, "uint", ulStringIndex, "ptr", pchwBuffer, "uint", ulMaxBufferSize, pulActualSizeMarshal, pulActualSize, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulParentalLevel 
     * @param {Pointer<Integer>} pbCountryCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getplayerparentallevel
     */
    GetPlayerParentalLevel(pulParentalLevel, pbCountryCode) {
        pulParentalLevelMarshal := pulParentalLevel is VarRef ? "uint*" : "ptr"
        pbCountryCodeMarshal := pbCountryCode is VarRef ? "char*" : "ptr"

        result := ComCall(26, this, pulParentalLevelMarshal, pulParentalLevel, pbCountryCodeMarshal, pbCountryCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<Integer>} pulNumOfChapters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getnumberofchapters
     */
    GetNumberOfChapters(ulTitle, pulNumOfChapters) {
        pulNumOfChaptersMarshal := pulNumOfChapters is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, "uint", ulTitle, pulNumOfChaptersMarshal, pulNumOfChapters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<Integer>} pulParentalLevels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-gettitleparentallevels
     */
    GetTitleParentalLevels(ulTitle, pulParentalLevels) {
        pulParentalLevelsMarshal := pulParentalLevels is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, "uint", ulTitle, pulParentalLevelsMarshal, pulParentalLevels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwPath 
     * @param {Integer} ulMaxSize 
     * @param {Pointer<Integer>} pulActualSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdvddirectory
     */
    GetDVDDirectory(pszwPath, ulMaxSize, pulActualSize) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        pulActualSizeMarshal := pulActualSize is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "ptr", pszwPath, "uint", ulMaxSize, pulActualSizeMarshal, pulActualSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStreamNum 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-isaudiostreamenabled
     */
    IsAudioStreamEnabled(ulStreamNum, pbEnabled) {
        result := ComCall(30, this, "uint", ulStreamNum, "ptr", pbEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszwPath 
     * @param {Pointer<Integer>} pullDiscID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdiscid
     */
    GetDiscID(pszwPath, pullDiscID) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        pullDiscIDMarshal := pullDiscID is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "ptr", pszwPath, pullDiscIDMarshal, pullDiscID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDvdState>} pStateData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getstate
     */
    GetState(pStateData) {
        result := ComCall(32, this, "ptr*", pStateData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLanguages 
     * @param {Integer} ulMaxLanguages 
     * @param {Pointer<Integer>} pulActualLanguages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getmenulanguages
     */
    GetMenuLanguages(pLanguages, ulMaxLanguages, pulActualLanguages) {
        pLanguagesMarshal := pLanguages is VarRef ? "uint*" : "ptr"
        pulActualLanguagesMarshal := pulActualLanguages is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, pLanguagesMarshal, pLanguages, "uint", ulMaxLanguages, pulActualLanguagesMarshal, pulActualLanguages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @param {Pointer<Integer>} pulButtonIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getbuttonatposition
     */
    GetButtonAtPosition(point, pulButtonIndex) {
        pulButtonIndexMarshal := pulButtonIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, "ptr", point, pulButtonIndexMarshal, pulButtonIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lParam1 
     * @param {Pointer<IDvdCmd>} pCmdObj 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getcmdfromevent
     */
    GetCmdFromEvent(lParam1, pCmdObj) {
        result := ComCall(35, this, "ptr", lParam1, "ptr*", pCmdObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLanguage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdefaultmenulanguage
     */
    GetDefaultMenuLanguage(pLanguage) {
        pLanguageMarshal := pLanguage is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, pLanguageMarshal, pLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLanguage 
     * @param {Pointer<Integer>} pAudioExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdefaultaudiolanguage
     */
    GetDefaultAudioLanguage(pLanguage, pAudioExtension) {
        pLanguageMarshal := pLanguage is VarRef ? "uint*" : "ptr"
        pAudioExtensionMarshal := pAudioExtension is VarRef ? "int*" : "ptr"

        result := ComCall(37, this, pLanguageMarshal, pLanguage, pAudioExtensionMarshal, pAudioExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLanguage 
     * @param {Pointer<Integer>} pSubpictureExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdefaultsubpicturelanguage
     */
    GetDefaultSubpictureLanguage(pLanguage, pSubpictureExtension) {
        pLanguageMarshal := pLanguage is VarRef ? "uint*" : "ptr"
        pSubpictureExtensionMarshal := pSubpictureExtension is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, pLanguageMarshal, pLanguage, pSubpictureExtensionMarshal, pSubpictureExtension, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_DECODER_CAPS>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getdecodercaps
     */
    GetDecoderCaps(pCaps) {
        result := ComCall(39, this, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-getbuttonrect
     */
    GetButtonRect(ulButton, pRect) {
        result := ComCall(40, this, "uint", ulButton, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStreamNum 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo2-issubpicturestreamenabled
     */
    IsSubpictureStreamEnabled(ulStreamNum, pbEnabled) {
        result := ComCall(41, this, "uint", ulStreamNum, "ptr", pbEnabled, "HRESULT")
        return result
    }
}

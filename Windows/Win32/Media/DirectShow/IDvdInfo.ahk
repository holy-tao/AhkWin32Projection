#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvdinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDvdInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDvdInfo
     * @type {Guid}
     */
    static IID => Guid("{a70efe60-e2a3-11d0-a9be-00aa0061be93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentDomain", "GetCurrentLocation", "GetTotalTitleTime", "GetCurrentButton", "GetCurrentAngle", "GetCurrentAudio", "GetCurrentSubpicture", "GetCurrentUOPS", "GetAllSPRMs", "GetAllGPRMs", "GetAudioLanguage", "GetSubpictureLanguage", "GetTitleAttributes", "GetVMGAttributes", "GetCurrentVideoAttributes", "GetCurrentAudioAttributes", "GetCurrentSubpictureAttributes", "GetCurrentVolumeInfo", "GetDVDTextInfo", "GetPlayerParentalLevel", "GetNumberOfChapters", "GetTitleParentalLevels", "GetRoot"]

    /**
     * 
     * @param {Pointer<Integer>} pDomain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentdomain
     */
    GetCurrentDomain(pDomain) {
        result := ComCall(3, this, "int*", pDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_PLAYBACK_LOCATION>} pLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentlocation
     */
    GetCurrentLocation(pLocation) {
        result := ComCall(4, this, "ptr", pLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulTotalTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-gettotaltitletime
     */
    GetTotalTitleTime(pulTotalTime) {
        result := ComCall(5, this, "uint*", pulTotalTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulButtonsAvailable 
     * @param {Pointer<Integer>} pulCurrentButton 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentbutton
     */
    GetCurrentButton(pulButtonsAvailable, pulCurrentButton) {
        result := ComCall(6, this, "uint*", pulButtonsAvailable, "uint*", pulCurrentButton, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulAnglesAvailable 
     * @param {Pointer<Integer>} pulCurrentAngle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentangle
     */
    GetCurrentAngle(pulAnglesAvailable, pulCurrentAngle) {
        result := ComCall(7, this, "uint*", pulAnglesAvailable, "uint*", pulCurrentAngle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStreamsAvailable 
     * @param {Pointer<Integer>} pulCurrentStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentaudio
     */
    GetCurrentAudio(pulStreamsAvailable, pulCurrentStream) {
        result := ComCall(8, this, "uint*", pulStreamsAvailable, "uint*", pulCurrentStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStreamsAvailable 
     * @param {Pointer<Integer>} pulCurrentStream 
     * @param {Pointer<BOOL>} pIsDisabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentsubpicture
     */
    GetCurrentSubpicture(pulStreamsAvailable, pulCurrentStream, pIsDisabled) {
        result := ComCall(9, this, "uint*", pulStreamsAvailable, "uint*", pulCurrentStream, "ptr", pIsDisabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pUOP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentuops
     */
    GetCurrentUOPS(pUOP) {
        result := ComCall(10, this, "uint*", pUOP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pRegisterArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getallsprms
     */
    GetAllSPRMs(pRegisterArray) {
        result := ComCall(11, this, "ptr*", pRegisterArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pRegisterArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getallgprms
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getaudiolanguage
     */
    GetAudioLanguage(ulStream, pLanguage) {
        result := ComCall(13, this, "uint", ulStream, "uint*", pLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<Integer>} pLanguage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getsubpicturelanguage
     */
    GetSubpictureLanguage(ulStream, pLanguage) {
        result := ComCall(14, this, "uint", ulStream, "uint*", pLanguage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<DVD_ATR>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-gettitleattributes
     */
    GetTitleAttributes(ulTitle, pATR) {
        result := ComCall(15, this, "uint", ulTitle, "ptr", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DVD_ATR>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getvmgattributes
     */
    GetVMGAttributes(pATR) {
        result := ComCall(16, this, "ptr", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentvideoattributes
     */
    GetCurrentVideoAttributes(pATR) {
        result := ComCall(17, this, "ptr*", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentaudioattributes
     */
    GetCurrentAudioAttributes(pATR) {
        result := ComCall(18, this, "ptr*", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pATR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentsubpictureattributes
     */
    GetCurrentSubpictureAttributes(pATR) {
        result := ComCall(19, this, "ptr*", pATR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulNumOfVol 
     * @param {Pointer<Integer>} pulThisVolNum 
     * @param {Pointer<Integer>} pSide 
     * @param {Pointer<Integer>} pulNumOfTitles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getcurrentvolumeinfo
     */
    GetCurrentVolumeInfo(pulNumOfVol, pulThisVolNum, pSide, pulNumOfTitles) {
        result := ComCall(20, this, "uint*", pulNumOfVol, "uint*", pulThisVolNum, "int*", pSide, "uint*", pulNumOfTitles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pTextManager 
     * @param {Integer} ulBufSize 
     * @param {Pointer<Integer>} pulActualSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getdvdtextinfo
     */
    GetDVDTextInfo(pTextManager, ulBufSize, pulActualSize) {
        result := ComCall(21, this, "ptr", pTextManager, "uint", ulBufSize, "uint*", pulActualSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulParentalLevel 
     * @param {Pointer<Integer>} pulCountryCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getplayerparentallevel
     */
    GetPlayerParentalLevel(pulParentalLevel, pulCountryCode) {
        result := ComCall(22, this, "uint*", pulParentalLevel, "uint*", pulCountryCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<Integer>} pulNumberOfChapters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getnumberofchapters
     */
    GetNumberOfChapters(ulTitle, pulNumberOfChapters) {
        result := ComCall(23, this, "uint", ulTitle, "uint*", pulNumberOfChapters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<Integer>} pulParentalLevels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-gettitleparentallevels
     */
    GetTitleParentalLevels(ulTitle, pulParentalLevels) {
        result := ComCall(24, this, "uint", ulTitle, "uint*", pulParentalLevels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pRoot 
     * @param {Integer} ulBufSize 
     * @param {Pointer<Integer>} pulActualSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvdinfo-getroot
     */
    GetRoot(pRoot, ulBufSize, pulActualSize) {
        result := ComCall(25, this, "ptr", pRoot, "uint", ulBufSize, "uint*", pulActualSize, "HRESULT")
        return result
    }
}

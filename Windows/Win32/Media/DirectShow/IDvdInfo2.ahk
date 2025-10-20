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
     * 
     * @param {Pointer<Int32>} pDomain 
     * @returns {HRESULT} 
     */
    GetCurrentDomain(pDomain) {
        result := ComCall(3, this, "int*", pDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DVD_PLAYBACK_LOCATION2>} pLocation 
     * @returns {HRESULT} 
     */
    GetCurrentLocation(pLocation) {
        result := ComCall(4, this, "ptr", pLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DVD_HMSF_TIMECODE>} pTotalTime 
     * @param {Pointer<UInt32>} ulTimeCodeFlags 
     * @returns {HRESULT} 
     */
    GetTotalTitleTime(pTotalTime, ulTimeCodeFlags) {
        result := ComCall(5, this, "ptr", pTotalTime, "uint*", ulTimeCodeFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulButtonsAvailable 
     * @param {Pointer<UInt32>} pulCurrentButton 
     * @returns {HRESULT} 
     */
    GetCurrentButton(pulButtonsAvailable, pulCurrentButton) {
        result := ComCall(6, this, "uint*", pulButtonsAvailable, "uint*", pulCurrentButton, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulAnglesAvailable 
     * @param {Pointer<UInt32>} pulCurrentAngle 
     * @returns {HRESULT} 
     */
    GetCurrentAngle(pulAnglesAvailable, pulCurrentAngle) {
        result := ComCall(7, this, "uint*", pulAnglesAvailable, "uint*", pulCurrentAngle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulStreamsAvailable 
     * @param {Pointer<UInt32>} pulCurrentStream 
     * @returns {HRESULT} 
     */
    GetCurrentAudio(pulStreamsAvailable, pulCurrentStream) {
        result := ComCall(8, this, "uint*", pulStreamsAvailable, "uint*", pulCurrentStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulStreamsAvailable 
     * @param {Pointer<UInt32>} pulCurrentStream 
     * @param {Pointer<BOOL>} pbIsDisabled 
     * @returns {HRESULT} 
     */
    GetCurrentSubpicture(pulStreamsAvailable, pulCurrentStream, pbIsDisabled) {
        result := ComCall(9, this, "uint*", pulStreamsAvailable, "uint*", pulCurrentStream, "ptr", pbIsDisabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulUOPs 
     * @returns {HRESULT} 
     */
    GetCurrentUOPS(pulUOPs) {
        result := ComCall(10, this, "uint*", pulUOPs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pRegisterArray 
     * @returns {HRESULT} 
     */
    GetAllSPRMs(pRegisterArray) {
        result := ComCall(11, this, "ushort*", pRegisterArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pRegisterArray 
     * @returns {HRESULT} 
     */
    GetAllGPRMs(pRegisterArray) {
        result := ComCall(12, this, "ushort*", pRegisterArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<UInt32>} pLanguage 
     * @returns {HRESULT} 
     */
    GetAudioLanguage(ulStream, pLanguage) {
        result := ComCall(13, this, "uint", ulStream, "uint*", pLanguage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<UInt32>} pLanguage 
     * @returns {HRESULT} 
     */
    GetSubpictureLanguage(ulStream, pLanguage) {
        result := ComCall(14, this, "uint", ulStream, "uint*", pLanguage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<DVD_MenuAttributes>} pMenu 
     * @param {Pointer<DVD_TitleAttributes>} pTitle 
     * @returns {HRESULT} 
     */
    GetTitleAttributes(ulTitle, pMenu, pTitle) {
        result := ComCall(15, this, "uint", ulTitle, "ptr", pMenu, "ptr", pTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DVD_MenuAttributes>} pATR 
     * @returns {HRESULT} 
     */
    GetVMGAttributes(pATR) {
        result := ComCall(16, this, "ptr", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DVD_VideoAttributes>} pATR 
     * @returns {HRESULT} 
     */
    GetCurrentVideoAttributes(pATR) {
        result := ComCall(17, this, "ptr", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<DVD_AudioAttributes>} pATR 
     * @returns {HRESULT} 
     */
    GetAudioAttributes(ulStream, pATR) {
        result := ComCall(18, this, "uint", ulStream, "ptr", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<DVD_KaraokeAttributes>} pAttributes 
     * @returns {HRESULT} 
     */
    GetKaraokeAttributes(ulStream, pAttributes) {
        result := ComCall(19, this, "uint", ulStream, "ptr", pAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStream 
     * @param {Pointer<DVD_SubpictureAttributes>} pATR 
     * @returns {HRESULT} 
     */
    GetSubpictureAttributes(ulStream, pATR) {
        result := ComCall(20, this, "uint", ulStream, "ptr", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulNumOfVolumes 
     * @param {Pointer<UInt32>} pulVolume 
     * @param {Pointer<Int32>} pSide 
     * @param {Pointer<UInt32>} pulNumOfTitles 
     * @returns {HRESULT} 
     */
    GetDVDVolumeInfo(pulNumOfVolumes, pulVolume, pSide, pulNumOfTitles) {
        result := ComCall(21, this, "uint*", pulNumOfVolumes, "uint*", pulVolume, "int*", pSide, "uint*", pulNumOfTitles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulNumOfLangs 
     * @returns {HRESULT} 
     */
    GetDVDTextNumberOfLanguages(pulNumOfLangs) {
        result := ComCall(22, this, "uint*", pulNumOfLangs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulLangIndex 
     * @param {Pointer<UInt32>} pulNumOfStrings 
     * @param {Pointer<UInt32>} pLangCode 
     * @param {Pointer<Int32>} pbCharacterSet 
     * @returns {HRESULT} 
     */
    GetDVDTextLanguageInfo(ulLangIndex, pulNumOfStrings, pLangCode, pbCharacterSet) {
        result := ComCall(23, this, "uint", ulLangIndex, "uint*", pulNumOfStrings, "uint*", pLangCode, "int*", pbCharacterSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulLangIndex 
     * @param {Integer} ulStringIndex 
     * @param {Pointer<Byte>} pbBuffer 
     * @param {Integer} ulMaxBufferSize 
     * @param {Pointer<UInt32>} pulActualSize 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetDVDTextStringAsNative(ulLangIndex, ulStringIndex, pbBuffer, ulMaxBufferSize, pulActualSize, pType) {
        result := ComCall(24, this, "uint", ulLangIndex, "uint", ulStringIndex, "char*", pbBuffer, "uint", ulMaxBufferSize, "uint*", pulActualSize, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulLangIndex 
     * @param {Integer} ulStringIndex 
     * @param {PWSTR} pchwBuffer 
     * @param {Integer} ulMaxBufferSize 
     * @param {Pointer<UInt32>} pulActualSize 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetDVDTextStringAsUnicode(ulLangIndex, ulStringIndex, pchwBuffer, ulMaxBufferSize, pulActualSize, pType) {
        pchwBuffer := pchwBuffer is String ? StrPtr(pchwBuffer) : pchwBuffer

        result := ComCall(25, this, "uint", ulLangIndex, "uint", ulStringIndex, "ptr", pchwBuffer, "uint", ulMaxBufferSize, "uint*", pulActualSize, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulParentalLevel 
     * @param {Pointer<Byte>} pbCountryCode 
     * @returns {HRESULT} 
     */
    GetPlayerParentalLevel(pulParentalLevel, pbCountryCode) {
        result := ComCall(26, this, "uint*", pulParentalLevel, "char*", pbCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<UInt32>} pulNumOfChapters 
     * @returns {HRESULT} 
     */
    GetNumberOfChapters(ulTitle, pulNumOfChapters) {
        result := ComCall(27, this, "uint", ulTitle, "uint*", pulNumOfChapters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<UInt32>} pulParentalLevels 
     * @returns {HRESULT} 
     */
    GetTitleParentalLevels(ulTitle, pulParentalLevels) {
        result := ComCall(28, this, "uint", ulTitle, "uint*", pulParentalLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszwPath 
     * @param {Integer} ulMaxSize 
     * @param {Pointer<UInt32>} pulActualSize 
     * @returns {HRESULT} 
     */
    GetDVDDirectory(pszwPath, ulMaxSize, pulActualSize) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(29, this, "ptr", pszwPath, "uint", ulMaxSize, "uint*", pulActualSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStreamNum 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    IsAudioStreamEnabled(ulStreamNum, pbEnabled) {
        result := ComCall(30, this, "uint", ulStreamNum, "ptr", pbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszwPath 
     * @param {Pointer<UInt64>} pullDiscID 
     * @returns {HRESULT} 
     */
    GetDiscID(pszwPath, pullDiscID) {
        pszwPath := pszwPath is String ? StrPtr(pszwPath) : pszwPath

        result := ComCall(31, this, "ptr", pszwPath, "uint*", pullDiscID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDvdState>} pStateData 
     * @returns {HRESULT} 
     */
    GetState(pStateData) {
        result := ComCall(32, this, "ptr", pStateData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pLanguages 
     * @param {Integer} ulMaxLanguages 
     * @param {Pointer<UInt32>} pulActualLanguages 
     * @returns {HRESULT} 
     */
    GetMenuLanguages(pLanguages, ulMaxLanguages, pulActualLanguages) {
        result := ComCall(33, this, "uint*", pLanguages, "uint", ulMaxLanguages, "uint*", pulActualLanguages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} point 
     * @param {Pointer<UInt32>} pulButtonIndex 
     * @returns {HRESULT} 
     */
    GetButtonAtPosition(point, pulButtonIndex) {
        result := ComCall(34, this, "ptr", point, "uint*", pulButtonIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} lParam1 
     * @param {Pointer<IDvdCmd>} pCmdObj 
     * @returns {HRESULT} 
     */
    GetCmdFromEvent(lParam1, pCmdObj) {
        result := ComCall(35, this, "ptr", lParam1, "ptr", pCmdObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pLanguage 
     * @returns {HRESULT} 
     */
    GetDefaultMenuLanguage(pLanguage) {
        result := ComCall(36, this, "uint*", pLanguage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pLanguage 
     * @param {Pointer<Int32>} pAudioExtension 
     * @returns {HRESULT} 
     */
    GetDefaultAudioLanguage(pLanguage, pAudioExtension) {
        result := ComCall(37, this, "uint*", pLanguage, "int*", pAudioExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pLanguage 
     * @param {Pointer<Int32>} pSubpictureExtension 
     * @returns {HRESULT} 
     */
    GetDefaultSubpictureLanguage(pLanguage, pSubpictureExtension) {
        result := ComCall(38, this, "uint*", pLanguage, "int*", pSubpictureExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DVD_DECODER_CAPS>} pCaps 
     * @returns {HRESULT} 
     */
    GetDecoderCaps(pCaps) {
        result := ComCall(39, this, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulButton 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    GetButtonRect(ulButton, pRect) {
        result := ComCall(40, this, "uint", ulButton, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStreamNum 
     * @param {Pointer<BOOL>} pbEnabled 
     * @returns {HRESULT} 
     */
    IsSubpictureStreamEnabled(ulStreamNum, pbEnabled) {
        result := ComCall(41, this, "uint", ulStreamNum, "ptr", pbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

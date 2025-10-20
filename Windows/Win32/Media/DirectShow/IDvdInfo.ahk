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
     * @param {Pointer<DVD_PLAYBACK_LOCATION>} pLocation 
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
     * @param {Pointer<UInt32>} pulTotalTime 
     * @returns {HRESULT} 
     */
    GetTotalTitleTime(pulTotalTime) {
        result := ComCall(5, this, "uint*", pulTotalTime, "int")
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
     * @param {Pointer<BOOL>} pIsDisabled 
     * @returns {HRESULT} 
     */
    GetCurrentSubpicture(pulStreamsAvailable, pulCurrentStream, pIsDisabled) {
        result := ComCall(9, this, "uint*", pulStreamsAvailable, "uint*", pulCurrentStream, "ptr", pIsDisabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pUOP 
     * @returns {HRESULT} 
     */
    GetCurrentUOPS(pUOP) {
        result := ComCall(10, this, "uint*", pUOP, "int")
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
     * @param {Pointer<DVD_ATR>} pATR 
     * @returns {HRESULT} 
     */
    GetTitleAttributes(ulTitle, pATR) {
        result := ComCall(15, this, "uint", ulTitle, "ptr", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DVD_ATR>} pATR 
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
     * @param {Pointer<Byte>} pATR 
     * @returns {HRESULT} 
     */
    GetCurrentVideoAttributes(pATR) {
        result := ComCall(17, this, "char*", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pATR 
     * @returns {HRESULT} 
     */
    GetCurrentAudioAttributes(pATR) {
        result := ComCall(18, this, "char*", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pATR 
     * @returns {HRESULT} 
     */
    GetCurrentSubpictureAttributes(pATR) {
        result := ComCall(19, this, "char*", pATR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulNumOfVol 
     * @param {Pointer<UInt32>} pulThisVolNum 
     * @param {Pointer<Int32>} pSide 
     * @param {Pointer<UInt32>} pulNumOfTitles 
     * @returns {HRESULT} 
     */
    GetCurrentVolumeInfo(pulNumOfVol, pulThisVolNum, pSide, pulNumOfTitles) {
        result := ComCall(20, this, "uint*", pulNumOfVol, "uint*", pulThisVolNum, "int*", pSide, "uint*", pulNumOfTitles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pTextManager 
     * @param {Integer} ulBufSize 
     * @param {Pointer<UInt32>} pulActualSize 
     * @returns {HRESULT} 
     */
    GetDVDTextInfo(pTextManager, ulBufSize, pulActualSize) {
        result := ComCall(21, this, "ptr", pTextManager, "uint", ulBufSize, "uint*", pulActualSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulParentalLevel 
     * @param {Pointer<UInt32>} pulCountryCode 
     * @returns {HRESULT} 
     */
    GetPlayerParentalLevel(pulParentalLevel, pulCountryCode) {
        result := ComCall(22, this, "uint*", pulParentalLevel, "uint*", pulCountryCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTitle 
     * @param {Pointer<UInt32>} pulNumberOfChapters 
     * @returns {HRESULT} 
     */
    GetNumberOfChapters(ulTitle, pulNumberOfChapters) {
        result := ComCall(23, this, "uint", ulTitle, "uint*", pulNumberOfChapters, "int")
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
        result := ComCall(24, this, "uint", ulTitle, "uint*", pulParentalLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pRoot 
     * @param {Integer} ulBufSize 
     * @param {Pointer<UInt32>} pulActualSize 
     * @returns {HRESULT} 
     */
    GetRoot(pRoot, ulBufSize, pulActualSize) {
        result := ComCall(25, this, "ptr", pRoot, "uint", ulBufSize, "uint*", pulActualSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

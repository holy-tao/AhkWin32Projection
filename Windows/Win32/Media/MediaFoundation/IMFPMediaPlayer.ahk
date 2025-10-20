#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains methods to play media files. (Deprecated.).
 * @see https://docs.microsoft.com/windows/win32/api//mfplay/nn-mfplay-imfpmediaplayer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPMediaPlayer extends IUnknown{
    /**
     * The interface identifier for IMFPMediaPlayer
     * @type {Guid}
     */
    static IID => Guid("{a714590a-58af-430a-85bf-44f5ec838d85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Play() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FrameStep() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvPositionValue 
     * @returns {HRESULT} 
     */
    SetPosition(guidPositionType, pvPositionValue) {
        result := ComCall(7, this, "ptr", guidPositionType, "ptr", pvPositionValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvPositionValue 
     * @returns {HRESULT} 
     */
    GetPosition(guidPositionType, pvPositionValue) {
        result := ComCall(8, this, "ptr", guidPositionType, "ptr", pvPositionValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvDurationValue 
     * @returns {HRESULT} 
     */
    GetDuration(guidPositionType, pvDurationValue) {
        result := ComCall(9, this, "ptr", guidPositionType, "ptr", pvDurationValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} flRate 
     * @returns {HRESULT} 
     */
    SetRate(flRate) {
        result := ComCall(10, this, "float", flRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pflRate 
     * @returns {HRESULT} 
     */
    GetRate(pflRate) {
        result := ComCall(11, this, "float*", pflRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fForwardDirection 
     * @param {Pointer<Single>} pflSlowestRate 
     * @param {Pointer<Single>} pflFastestRate 
     * @returns {HRESULT} 
     */
    GetSupportedRates(fForwardDirection, pflSlowestRate, pflFastestRate) {
        result := ComCall(12, this, "int", fForwardDirection, "float*", pflSlowestRate, "float*", pflFastestRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peState 
     * @returns {HRESULT} 
     */
    GetState(peState) {
        result := ComCall(13, this, "int*", peState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {BOOL} fSync 
     * @param {Pointer} dwUserData 
     * @param {Pointer<IMFPMediaItem>} ppMediaItem 
     * @returns {HRESULT} 
     */
    CreateMediaItemFromURL(pwszURL, fSync, dwUserData, ppMediaItem) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(14, this, "ptr", pwszURL, "int", fSync, "ptr", dwUserData, "ptr", ppMediaItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pIUnknownObj 
     * @param {BOOL} fSync 
     * @param {Pointer} dwUserData 
     * @param {Pointer<IMFPMediaItem>} ppMediaItem 
     * @returns {HRESULT} 
     */
    CreateMediaItemFromObject(pIUnknownObj, fSync, dwUserData, ppMediaItem) {
        result := ComCall(15, this, "ptr", pIUnknownObj, "int", fSync, "ptr", dwUserData, "ptr", ppMediaItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPMediaItem>} pIMFPMediaItem 
     * @returns {HRESULT} 
     */
    SetMediaItem(pIMFPMediaItem) {
        result := ComCall(16, this, "ptr", pIMFPMediaItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearMediaItem() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPMediaItem>} ppIMFPMediaItem 
     * @returns {HRESULT} 
     */
    GetMediaItem(ppIMFPMediaItem) {
        result := ComCall(18, this, "ptr", ppIMFPMediaItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pflVolume 
     * @returns {HRESULT} 
     */
    GetVolume(pflVolume) {
        result := ComCall(19, this, "float*", pflVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} flVolume 
     * @returns {HRESULT} 
     */
    SetVolume(flVolume) {
        result := ComCall(20, this, "float", flVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} pflBalance 
     * @returns {HRESULT} 
     */
    GetBalance(pflBalance) {
        result := ComCall(21, this, "float*", pflBalance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} flBalance 
     * @returns {HRESULT} 
     */
    SetBalance(flBalance) {
        result := ComCall(22, this, "float", flBalance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfMute 
     * @returns {HRESULT} 
     */
    GetMute(pfMute) {
        result := ComCall(23, this, "ptr", pfMute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fMute 
     * @returns {HRESULT} 
     */
    SetMute(fMute) {
        result := ComCall(24, this, "int", fMute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszVideo 
     * @param {Pointer<SIZE>} pszARVideo 
     * @returns {HRESULT} 
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(25, this, "ptr", pszVideo, "ptr", pszARVideo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszMin 
     * @param {Pointer<SIZE>} pszMax 
     * @returns {HRESULT} 
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(26, this, "ptr", pszMin, "ptr", pszMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @returns {HRESULT} 
     */
    SetVideoSourceRect(pnrcSource) {
        result := ComCall(27, this, "ptr", pnrcSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @returns {HRESULT} 
     */
    GetVideoSourceRect(pnrcSource) {
        result := ComCall(28, this, "ptr", pnrcSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAspectRatioMode 
     * @returns {HRESULT} 
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(29, this, "uint", dwAspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAspectRatioMode 
     * @returns {HRESULT} 
     */
    GetAspectRatioMode(pdwAspectRatioMode) {
        result := ComCall(30, this, "uint*", pdwAspectRatioMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwndVideo 
     * @returns {HRESULT} 
     */
    GetVideoWindow(phwndVideo) {
        result := ComCall(31, this, "ptr", phwndVideo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateVideo() {
        result := ComCall(32, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     */
    SetBorderColor(Clr) {
        result := ComCall(33, this, "uint", Clr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} pClr 
     * @returns {HRESULT} 
     */
    GetBorderColor(pClr) {
        result := ComCall(34, this, "ptr", pClr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pEffect 
     * @param {BOOL} fOptional 
     * @returns {HRESULT} 
     */
    InsertEffect(pEffect, fOptional) {
        result := ComCall(35, this, "ptr", pEffect, "int", fOptional, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pEffect 
     * @returns {HRESULT} 
     */
    RemoveEffect(pEffect) {
        result := ComCall(36, this, "ptr", pEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllEffects() {
        result := ComCall(37, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(38, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Play", "Pause", "Stop", "FrameStep", "SetPosition", "GetPosition", "GetDuration", "SetRate", "GetRate", "GetSupportedRates", "GetState", "CreateMediaItemFromURL", "CreateMediaItemFromObject", "SetMediaItem", "ClearMediaItem", "GetMediaItem", "GetVolume", "SetVolume", "GetBalance", "SetBalance", "GetMute", "SetMute", "GetNativeVideoSize", "GetIdealVideoSize", "SetVideoSourceRect", "GetVideoSourceRect", "SetAspectRatioMode", "GetAspectRatioMode", "GetVideoWindow", "UpdateVideo", "SetBorderColor", "GetBorderColor", "InsertEffect", "RemoveEffect", "RemoveAllEffects", "Shutdown"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-play
     */
    Play() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-pause
     */
    Pause() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-stop
     */
    Stop() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-framestep
     */
    FrameStep() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvPositionValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setposition
     */
    SetPosition(guidPositionType, pvPositionValue) {
        result := ComCall(7, this, "ptr", guidPositionType, "ptr", pvPositionValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvPositionValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getposition
     */
    GetPosition(guidPositionType, pvPositionValue) {
        result := ComCall(8, this, "ptr", guidPositionType, "ptr", pvPositionValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidPositionType 
     * @param {Pointer<PROPVARIANT>} pvDurationValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getduration
     */
    GetDuration(guidPositionType, pvDurationValue) {
        result := ComCall(9, this, "ptr", guidPositionType, "ptr", pvDurationValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setrate
     */
    SetRate(flRate) {
        result := ComCall(10, this, "float", flRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pflRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getrate
     */
    GetRate(pflRate) {
        result := ComCall(11, this, "float*", pflRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fForwardDirection 
     * @param {Pointer<Float>} pflSlowestRate 
     * @param {Pointer<Float>} pflFastestRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getsupportedrates
     */
    GetSupportedRates(fForwardDirection, pflSlowestRate, pflFastestRate) {
        result := ComCall(12, this, "int", fForwardDirection, "float*", pflSlowestRate, "float*", pflFastestRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getstate
     */
    GetState(peState) {
        result := ComCall(13, this, "int*", peState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {BOOL} fSync 
     * @param {Pointer} dwUserData 
     * @param {Pointer<IMFPMediaItem>} ppMediaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromurl
     */
    CreateMediaItemFromURL(pwszURL, fSync, dwUserData, ppMediaItem) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(14, this, "ptr", pwszURL, "int", fSync, "ptr", dwUserData, "ptr*", ppMediaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pIUnknownObj 
     * @param {BOOL} fSync 
     * @param {Pointer} dwUserData 
     * @param {Pointer<IMFPMediaItem>} ppMediaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-createmediaitemfromobject
     */
    CreateMediaItemFromObject(pIUnknownObj, fSync, dwUserData, ppMediaItem) {
        result := ComCall(15, this, "ptr", pIUnknownObj, "int", fSync, "ptr", dwUserData, "ptr*", ppMediaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFPMediaItem} pIMFPMediaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setmediaitem
     */
    SetMediaItem(pIMFPMediaItem) {
        result := ComCall(16, this, "ptr", pIMFPMediaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-clearmediaitem
     */
    ClearMediaItem() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFPMediaItem>} ppIMFPMediaItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getmediaitem
     */
    GetMediaItem(ppIMFPMediaItem) {
        result := ComCall(18, this, "ptr*", ppIMFPMediaItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pflVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getvolume
     */
    GetVolume(pflVolume) {
        result := ComCall(19, this, "float*", pflVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setvolume
     */
    SetVolume(flVolume) {
        result := ComCall(20, this, "float", flVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pflBalance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getbalance
     */
    GetBalance(pflBalance) {
        result := ComCall(21, this, "float*", pflBalance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} flBalance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setbalance
     */
    SetBalance(flBalance) {
        result := ComCall(22, this, "float", flBalance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfMute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getmute
     */
    GetMute(pfMute) {
        result := ComCall(23, this, "ptr", pfMute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fMute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setmute
     */
    SetMute(fMute) {
        result := ComCall(24, this, "int", fMute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszVideo 
     * @param {Pointer<SIZE>} pszARVideo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getnativevideosize
     */
    GetNativeVideoSize(pszVideo, pszARVideo) {
        result := ComCall(25, this, "ptr", pszVideo, "ptr", pszARVideo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszMin 
     * @param {Pointer<SIZE>} pszMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getidealvideosize
     */
    GetIdealVideoSize(pszMin, pszMax) {
        result := ComCall(26, this, "ptr", pszMin, "ptr", pszMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setvideosourcerect
     */
    SetVideoSourceRect(pnrcSource) {
        result := ComCall(27, this, "ptr", pnrcSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getvideosourcerect
     */
    GetVideoSourceRect(pnrcSource) {
        result := ComCall(28, this, "ptr", pnrcSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setaspectratiomode
     */
    SetAspectRatioMode(dwAspectRatioMode) {
        result := ComCall(29, this, "uint", dwAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwAspectRatioMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getaspectratiomode
     */
    GetAspectRatioMode(pdwAspectRatioMode) {
        result := ComCall(30, this, "uint*", pdwAspectRatioMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwndVideo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getvideowindow
     */
    GetVideoWindow(phwndVideo) {
        result := ComCall(31, this, "ptr", phwndVideo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-updatevideo
     */
    UpdateVideo() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {COLORREF} Clr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-setbordercolor
     */
    SetBorderColor(Clr) {
        result := ComCall(33, this, "uint", Clr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} pClr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-getbordercolor
     */
    GetBorderColor(pClr) {
        result := ComCall(34, this, "ptr", pClr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEffect 
     * @param {BOOL} fOptional 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-inserteffect
     */
    InsertEffect(pEffect, fOptional) {
        result := ComCall(35, this, "ptr", pEffect, "int", fOptional, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEffect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-removeeffect
     */
    RemoveEffect(pEffect) {
        result := ComCall(36, this, "ptr", pEffect, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-removealleffects
     */
    RemoveAllEffects() {
        result := ComCall(37, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfplay/nf-mfplay-imfpmediaplayer-shutdown
     */
    Shutdown() {
        result := ComCall(38, this, "HRESULT")
        return result
    }
}

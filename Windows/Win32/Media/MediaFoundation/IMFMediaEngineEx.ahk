#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaEngine.ahk

/**
 * Extends the IMFMediaEngine interface.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengine">IMFMediaEngine</a> interface contains methods that map to the HTML5 media elements. The <b>IMFMediaEngineEx</b> provides additional functionality that does not correspond directly to HTML5.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineEx extends IMFMediaEngine{
    /**
     * The interface identifier for IMFMediaEngineEx
     * @type {Guid}
     */
    static IID => Guid("{83015ead-b1e6-40d0-a98a-37145ffe1ad1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * 
     * @param {Pointer<IMFByteStream>} pByteStream 
     * @param {BSTR} pURL 
     * @returns {HRESULT} 
     */
    SetSourceFromByteStream(pByteStream, pURL) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL

        result := ComCall(45, this, "ptr", pByteStream, "ptr", pURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StatisticID 
     * @param {Pointer<PROPVARIANT>} pStatistic 
     * @returns {HRESULT} 
     */
    GetStatistics(StatisticID, pStatistic) {
        result := ComCall(46, this, "int", StatisticID, "ptr", pStatistic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<MFARGB>} pBorderClr 
     * @returns {HRESULT} 
     */
    UpdateVideoStream(pSrc, pDst, pBorderClr) {
        result := ComCall(47, this, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetBalance() {
        result := ComCall(48, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} balance 
     * @returns {HRESULT} 
     */
    SetBalance(balance) {
        result := ComCall(49, this, "double", balance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} rate 
     * @returns {BOOL} 
     */
    IsPlaybackRateSupported(rate) {
        result := ComCall(50, this, "double", rate, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} Forward 
     * @returns {HRESULT} 
     */
    FrameStep(Forward) {
        result := ComCall(51, this, "int", Forward, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCharacteristics 
     * @returns {HRESULT} 
     */
    GetResourceCharacteristics(pCharacteristics) {
        result := ComCall(52, this, "uint*", pCharacteristics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     */
    GetPresentationAttribute(guidMFAttribute, pvValue) {
        result := ComCall(53, this, "ptr", guidMFAttribute, "ptr", pvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStreamCount 
     * @returns {HRESULT} 
     */
    GetNumberOfStreams(pdwStreamCount) {
        result := ComCall(54, this, "uint*", pdwStreamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @param {Pointer<PROPVARIANT>} pvValue 
     * @returns {HRESULT} 
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute, pvValue) {
        result := ComCall(55, this, "uint", dwStreamIndex, "ptr", guidMFAttribute, "ptr", pvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @returns {HRESULT} 
     */
    GetStreamSelection(dwStreamIndex, pEnabled) {
        result := ComCall(56, this, "uint", dwStreamIndex, "ptr", pEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} Enabled 
     * @returns {HRESULT} 
     */
    SetStreamSelection(dwStreamIndex, Enabled) {
        result := ComCall(57, this, "uint", dwStreamIndex, "int", Enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyStreamSelections() {
        result := ComCall(58, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pProtected 
     * @returns {HRESULT} 
     */
    IsProtected(pProtected) {
        result := ComCall(59, this, "ptr", pProtected, "int")
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
    InsertVideoEffect(pEffect, fOptional) {
        result := ComCall(60, this, "ptr", pEffect, "int", fOptional, "int")
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
    InsertAudioEffect(pEffect, fOptional) {
        result := ComCall(61, this, "ptr", pEffect, "int", fOptional, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllEffects() {
        result := ComCall(62, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} timeToFire 
     * @returns {HRESULT} 
     */
    SetTimelineMarkerTimer(timeToFire) {
        result := ComCall(63, this, "double", timeToFire, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pTimeToFire 
     * @returns {HRESULT} 
     */
    GetTimelineMarkerTimer(pTimeToFire) {
        result := ComCall(64, this, "double*", pTimeToFire, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelTimelineMarkerTimer() {
        result := ComCall(65, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsStereo3D() {
        result := ComCall(66, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} packMode 
     * @returns {HRESULT} 
     */
    GetStereo3DFramePackingMode(packMode) {
        result := ComCall(67, this, "int*", packMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} packMode 
     * @returns {HRESULT} 
     */
    SetStereo3DFramePackingMode(packMode) {
        result := ComCall(68, this, "int", packMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} outputType 
     * @returns {HRESULT} 
     */
    GetStereo3DRenderMode(outputType) {
        result := ComCall(69, this, "int*", outputType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} outputType 
     * @returns {HRESULT} 
     */
    SetStereo3DRenderMode(outputType) {
        result := ComCall(70, this, "int", outputType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableWindowlessSwapchainMode(fEnable) {
        result := ComCall(71, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phSwapchain 
     * @returns {HRESULT} 
     */
    GetVideoSwapchainHandle(phSwapchain) {
        result := ComCall(72, this, "ptr", phSwapchain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableHorizontalMirrorMode(fEnable) {
        result := ComCall(73, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCategory 
     * @returns {HRESULT} 
     */
    GetAudioStreamCategory(pCategory) {
        result := ComCall(74, this, "uint*", pCategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} category 
     * @returns {HRESULT} 
     */
    SetAudioStreamCategory(category) {
        result := ComCall(75, this, "uint", category, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pRole 
     * @returns {HRESULT} 
     */
    GetAudioEndpointRole(pRole) {
        result := ComCall(76, this, "uint*", pRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} role 
     * @returns {HRESULT} 
     */
    SetAudioEndpointRole(role) {
        result := ComCall(77, this, "uint", role, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    GetRealTimeMode(pfEnabled) {
        result := ComCall(78, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    SetRealTimeMode(fEnable) {
        result := ComCall(79, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} seekTime 
     * @param {Integer} seekMode 
     * @returns {HRESULT} 
     */
    SetCurrentTimeEx(seekTime, seekMode) {
        result := ComCall(80, this, "double", seekTime, "int", seekMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableTimer 
     * @returns {HRESULT} 
     */
    EnableTimeUpdateTimer(fEnableTimer) {
        result := ComCall(81, this, "int", fEnableTimer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

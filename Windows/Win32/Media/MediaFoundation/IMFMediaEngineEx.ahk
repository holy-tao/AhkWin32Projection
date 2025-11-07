#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\Foundation\HANDLE.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSourceFromByteStream", "GetStatistics", "UpdateVideoStream", "GetBalance", "SetBalance", "IsPlaybackRateSupported", "FrameStep", "GetResourceCharacteristics", "GetPresentationAttribute", "GetNumberOfStreams", "GetStreamAttribute", "GetStreamSelection", "SetStreamSelection", "ApplyStreamSelections", "IsProtected", "InsertVideoEffect", "InsertAudioEffect", "RemoveAllEffects", "SetTimelineMarkerTimer", "GetTimelineMarkerTimer", "CancelTimelineMarkerTimer", "IsStereo3D", "GetStereo3DFramePackingMode", "SetStereo3DFramePackingMode", "GetStereo3DRenderMode", "SetStereo3DRenderMode", "EnableWindowlessSwapchainMode", "GetVideoSwapchainHandle", "EnableHorizontalMirrorMode", "GetAudioStreamCategory", "SetAudioStreamCategory", "GetAudioEndpointRole", "SetAudioEndpointRole", "GetRealTimeMode", "SetRealTimeMode", "SetCurrentTimeEx", "EnableTimeUpdateTimer"]

    /**
     * 
     * @param {IMFByteStream} pByteStream 
     * @param {BSTR} pURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setsourcefrombytestream
     */
    SetSourceFromByteStream(pByteStream, pURL) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL

        result := ComCall(45, this, "ptr", pByteStream, "ptr", pURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StatisticID 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstatistics
     */
    GetStatistics(StatisticID) {
        pStatistic := PROPVARIANT()
        result := ComCall(46, this, "int", StatisticID, "ptr", pStatistic, "HRESULT")
        return pStatistic
    }

    /**
     * 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<MFARGB>} pBorderClr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-updatevideostream
     */
    UpdateVideoStream(pSrc, pDst, pBorderClr) {
        result := ComCall(47, this, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getbalance
     */
    GetBalance() {
        result := ComCall(48, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} balance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setbalance
     */
    SetBalance(balance) {
        result := ComCall(49, this, "double", balance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} rate 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-isplaybackratesupported
     */
    IsPlaybackRateSupported(rate) {
        result := ComCall(50, this, "double", rate, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} Forward 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-framestep
     */
    FrameStep(Forward) {
        result := ComCall(51, this, "int", Forward, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getresourcecharacteristics
     */
    GetResourceCharacteristics() {
        result := ComCall(52, this, "uint*", &pCharacteristics := 0, "HRESULT")
        return pCharacteristics
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getpresentationattribute
     */
    GetPresentationAttribute(guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(53, this, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(54, this, "uint*", &pdwStreamCount := 0, "HRESULT")
        return pdwStreamCount
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Guid>} guidMFAttribute 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstreamattribute
     */
    GetStreamAttribute(dwStreamIndex, guidMFAttribute) {
        pvValue := PROPVARIANT()
        result := ComCall(55, this, "uint", dwStreamIndex, "ptr", guidMFAttribute, "ptr", pvValue, "HRESULT")
        return pvValue
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstreamselection
     */
    GetStreamSelection(dwStreamIndex) {
        result := ComCall(56, this, "uint", dwStreamIndex, "int*", &pEnabled := 0, "HRESULT")
        return pEnabled
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {BOOL} Enabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstreamselection
     */
    SetStreamSelection(dwStreamIndex, Enabled) {
        result := ComCall(57, this, "uint", dwStreamIndex, "int", Enabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-applystreamselections
     */
    ApplyStreamSelections() {
        result := ComCall(58, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-isprotected
     */
    IsProtected() {
        result := ComCall(59, this, "int*", &pProtected := 0, "HRESULT")
        return pProtected
    }

    /**
     * 
     * @param {IUnknown} pEffect 
     * @param {BOOL} fOptional 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertvideoeffect
     */
    InsertVideoEffect(pEffect, fOptional) {
        result := ComCall(60, this, "ptr", pEffect, "int", fOptional, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEffect 
     * @param {BOOL} fOptional 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-insertaudioeffect
     */
    InsertAudioEffect(pEffect, fOptional) {
        result := ComCall(61, this, "ptr", pEffect, "int", fOptional, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-removealleffects
     */
    RemoveAllEffects() {
        result := ComCall(62, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} timeToFire 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-settimelinemarkertimer
     */
    SetTimelineMarkerTimer(timeToFire) {
        result := ComCall(63, this, "double", timeToFire, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-gettimelinemarkertimer
     */
    GetTimelineMarkerTimer() {
        result := ComCall(64, this, "double*", &pTimeToFire := 0, "HRESULT")
        return pTimeToFire
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-canceltimelinemarkertimer
     */
    CancelTimelineMarkerTimer() {
        result := ComCall(65, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-isstereo3d
     */
    IsStereo3D() {
        result := ComCall(66, this, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstereo3dframepackingmode
     */
    GetStereo3DFramePackingMode() {
        result := ComCall(67, this, "int*", &packMode := 0, "HRESULT")
        return packMode
    }

    /**
     * 
     * @param {Integer} packMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstereo3dframepackingmode
     */
    SetStereo3DFramePackingMode(packMode) {
        result := ComCall(68, this, "int", packMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getstereo3drendermode
     */
    GetStereo3DRenderMode() {
        result := ComCall(69, this, "int*", &outputType := 0, "HRESULT")
        return outputType
    }

    /**
     * 
     * @param {Integer} outputType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setstereo3drendermode
     */
    SetStereo3DRenderMode(outputType) {
        result := ComCall(70, this, "int", outputType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-enablewindowlessswapchainmode
     */
    EnableWindowlessSwapchainMode(fEnable) {
        result := ComCall(71, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getvideoswapchainhandle
     */
    GetVideoSwapchainHandle() {
        phSwapchain := HANDLE()
        result := ComCall(72, this, "ptr", phSwapchain, "HRESULT")
        return phSwapchain
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-enablehorizontalmirrormode
     */
    EnableHorizontalMirrorMode(fEnable) {
        result := ComCall(73, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getaudiostreamcategory
     */
    GetAudioStreamCategory() {
        result := ComCall(74, this, "uint*", &pCategory := 0, "HRESULT")
        return pCategory
    }

    /**
     * 
     * @param {Integer} category 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setaudiostreamcategory
     */
    SetAudioStreamCategory(category) {
        result := ComCall(75, this, "uint", category, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getaudioendpointrole
     */
    GetAudioEndpointRole() {
        result := ComCall(76, this, "uint*", &pRole := 0, "HRESULT")
        return pRole
    }

    /**
     * 
     * @param {Integer} role 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setaudioendpointrole
     */
    SetAudioEndpointRole(role) {
        result := ComCall(77, this, "uint", role, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getrealtimemode
     */
    GetRealTimeMode() {
        result := ComCall(78, this, "int*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setrealtimemode
     */
    SetRealTimeMode(fEnable) {
        result := ComCall(79, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} seekTime 
     * @param {Integer} seekMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-setcurrenttimeex
     */
    SetCurrentTimeEx(seekTime, seekMode) {
        result := ComCall(80, this, "double", seekTime, "int", seekMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnableTimer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-enabletimeupdatetimer
     */
    EnableTimeUpdateTimer(fEnableTimer) {
        result := ComCall(81, this, "int", fEnableTimer, "HRESULT")
        return result
    }
}

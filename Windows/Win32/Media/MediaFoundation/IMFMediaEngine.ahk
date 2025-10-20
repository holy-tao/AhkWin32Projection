#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an application to play audio or video files.
 * @remarks
 * 
  * The Media Engine implements this interface. To create an instance of the Media Engine, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance">IMFMediaEngineClassFactory::CreateInstance</a>.
  * 
  * This interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengineex">IMFMediaEngineEx</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengine
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngine extends IUnknown{
    /**
     * The interface identifier for IMFMediaEngine
     * @type {Guid}
     */
    static IID => Guid("{98a1b0bb-03eb-4935-ae7c-93c1fa0e1c93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFMediaError>} ppError 
     * @returns {HRESULT} 
     */
    GetError(ppError) {
        result := ComCall(3, this, "ptr", ppError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} error 
     * @returns {HRESULT} 
     */
    SetErrorCode(error) {
        result := ComCall(4, this, "int", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaEngineSrcElements>} pSrcElements 
     * @returns {HRESULT} 
     */
    SetSourceElements(pSrcElements) {
        result := ComCall(5, this, "ptr", pSrcElements, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pUrl 
     * @returns {HRESULT} 
     */
    SetSource(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(6, this, "ptr", pUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUrl 
     * @returns {HRESULT} 
     */
    GetCurrentSource(ppUrl) {
        result := ComCall(7, this, "ptr", ppUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNetworkState() {
        result := ComCall(8, this, "ushort")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPreload() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Preload 
     * @returns {HRESULT} 
     */
    SetPreload(Preload) {
        result := ComCall(10, this, "int", Preload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppBuffered 
     * @returns {HRESULT} 
     */
    GetBuffered(ppBuffered) {
        result := ComCall(11, this, "ptr", ppBuffered, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Load() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {Pointer<Int32>} pAnswer 
     * @returns {HRESULT} 
     */
    CanPlayType(type, pAnswer) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(13, this, "ptr", type, "int*", pAnswer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReadyState() {
        result := ComCall(14, this, "ushort")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSeeking() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetCurrentTime() {
        result := ComCall(16, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} seekTime 
     * @returns {HRESULT} 
     */
    SetCurrentTime(seekTime) {
        result := ComCall(17, this, "double", seekTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetStartTime() {
        result := ComCall(18, this, "double")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDuration() {
        result := ComCall(19, this, "double")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsPaused() {
        result := ComCall(20, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetDefaultPlaybackRate() {
        result := ComCall(21, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} Rate 
     * @returns {HRESULT} 
     */
    SetDefaultPlaybackRate(Rate) {
        result := ComCall(22, this, "double", Rate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetPlaybackRate() {
        result := ComCall(23, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} Rate 
     * @returns {HRESULT} 
     */
    SetPlaybackRate(Rate) {
        result := ComCall(24, this, "double", Rate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppPlayed 
     * @returns {HRESULT} 
     */
    GetPlayed(ppPlayed) {
        result := ComCall(25, this, "ptr", ppPlayed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppSeekable 
     * @returns {HRESULT} 
     */
    GetSeekable(ppSeekable) {
        result := ComCall(26, this, "ptr", ppSeekable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsEnded() {
        result := ComCall(27, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetAutoPlay() {
        result := ComCall(28, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} AutoPlay 
     * @returns {HRESULT} 
     */
    SetAutoPlay(AutoPlay) {
        result := ComCall(29, this, "int", AutoPlay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetLoop() {
        result := ComCall(30, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} Loop 
     * @returns {HRESULT} 
     */
    SetLoop(Loop) {
        result := ComCall(31, this, "int", Loop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Play() {
        result := ComCall(32, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(33, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetMuted() {
        result := ComCall(34, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} Muted 
     * @returns {HRESULT} 
     */
    SetMuted(Muted) {
        result := ComCall(35, this, "int", Muted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetVolume() {
        result := ComCall(36, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} Volume 
     * @returns {HRESULT} 
     */
    SetVolume(Volume) {
        result := ComCall(37, this, "double", Volume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasVideo() {
        result := ComCall(38, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    HasAudio() {
        result := ComCall(39, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} cx 
     * @param {Pointer<UInt32>} cy 
     * @returns {HRESULT} 
     */
    GetNativeVideoSize(cx, cy) {
        result := ComCall(40, this, "uint*", cx, "uint*", cy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} cx 
     * @param {Pointer<UInt32>} cy 
     * @returns {HRESULT} 
     */
    GetVideoAspectRatio(cx, cy) {
        result := ComCall(41, this, "uint*", cx, "uint*", cy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(42, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pDstSurf 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<MFARGB>} pBorderClr 
     * @returns {HRESULT} 
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr) {
        result := ComCall(43, this, "ptr", pDstSurf, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pPts 
     * @returns {HRESULT} 
     */
    OnVideoStreamTick(pPts) {
        result := ComCall(44, this, "int64*", pPts, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}

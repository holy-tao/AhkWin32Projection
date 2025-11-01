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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetError", "SetErrorCode", "SetSourceElements", "SetSource", "GetCurrentSource", "GetNetworkState", "GetPreload", "SetPreload", "GetBuffered", "Load", "CanPlayType", "GetReadyState", "IsSeeking", "GetCurrentTime", "SetCurrentTime", "GetStartTime", "GetDuration", "IsPaused", "GetDefaultPlaybackRate", "SetDefaultPlaybackRate", "GetPlaybackRate", "SetPlaybackRate", "GetPlayed", "GetSeekable", "IsEnded", "GetAutoPlay", "SetAutoPlay", "GetLoop", "SetLoop", "Play", "Pause", "GetMuted", "SetMuted", "GetVolume", "SetVolume", "HasVideo", "HasAudio", "GetNativeVideoSize", "GetVideoAspectRatio", "Shutdown", "TransferVideoFrame", "OnVideoStreamTick"]

    /**
     * 
     * @param {Pointer<IMFMediaError>} ppError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-geterror
     */
    GetError(ppError) {
        result := ComCall(3, this, "ptr*", ppError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} error 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-seterrorcode
     */
    SetErrorCode(error) {
        result := ComCall(4, this, "int", error, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaEngineSrcElements} pSrcElements 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements
     */
    SetSourceElements(pSrcElements) {
        result := ComCall(5, this, "ptr", pSrcElements, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsource
     */
    SetSource(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(6, this, "ptr", pUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrentsource
     */
    GetCurrentSource(ppUrl) {
        result := ComCall(7, this, "ptr", ppUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getnetworkstate
     */
    GetNetworkState() {
        result := ComCall(8, this, "ushort")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getpreload
     */
    GetPreload() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Preload 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setpreload
     */
    SetPreload(Preload) {
        result := ComCall(10, this, "int", Preload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppBuffered 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getbuffered
     */
    GetBuffered(ppBuffered) {
        result := ComCall(11, this, "ptr*", ppBuffered, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load
     */
    Load() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {Pointer<Integer>} pAnswer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-canplaytype
     */
    CanPlayType(type, pAnswer) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(13, this, "ptr", type, "int*", pAnswer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getreadystate
     */
    GetReadyState() {
        result := ComCall(14, this, "ushort")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-isseeking
     */
    IsSeeking() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrenttime
     */
    GetCurrentTime() {
        result := ComCall(16, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} seekTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setcurrenttime
     */
    SetCurrentTime(seekTime) {
        result := ComCall(17, this, "double", seekTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getstarttime
     */
    GetStartTime() {
        result := ComCall(18, this, "double")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getduration
     */
    GetDuration() {
        result := ComCall(19, this, "double")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-ispaused
     */
    IsPaused() {
        result := ComCall(20, this, "int")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getdefaultplaybackrate
     */
    GetDefaultPlaybackRate() {
        result := ComCall(21, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} Rate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setdefaultplaybackrate
     */
    SetDefaultPlaybackRate(Rate) {
        result := ComCall(22, this, "double", Rate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getplaybackrate
     */
    GetPlaybackRate() {
        result := ComCall(23, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} Rate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setplaybackrate
     */
    SetPlaybackRate(Rate) {
        result := ComCall(24, this, "double", Rate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppPlayed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getplayed
     */
    GetPlayed(ppPlayed) {
        result := ComCall(25, this, "ptr*", ppPlayed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaTimeRange>} ppSeekable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getseekable
     */
    GetSeekable(ppSeekable) {
        result := ComCall(26, this, "ptr*", ppSeekable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-isended
     */
    IsEnded() {
        result := ComCall(27, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getautoplay
     */
    GetAutoPlay() {
        result := ComCall(28, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} AutoPlay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setautoplay
     */
    SetAutoPlay(AutoPlay) {
        result := ComCall(29, this, "int", AutoPlay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getloop
     */
    GetLoop() {
        result := ComCall(30, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} Loop_R 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setloop
     */
    SetLoop(Loop_R) {
        result := ComCall(31, this, "int", Loop_R, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play
     */
    Play() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-pause
     */
    Pause() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getmuted
     */
    GetMuted() {
        result := ComCall(34, this, "int")
        return result
    }

    /**
     * 
     * @param {BOOL} Muted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setmuted
     */
    SetMuted(Muted) {
        result := ComCall(35, this, "int", Muted, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getvolume
     */
    GetVolume() {
        result := ComCall(36, this, "double")
        return result
    }

    /**
     * 
     * @param {Float} Volume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setvolume
     */
    SetVolume(Volume) {
        result := ComCall(37, this, "double", Volume, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-hasvideo
     */
    HasVideo() {
        result := ComCall(38, this, "int")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-hasaudio
     */
    HasAudio() {
        result := ComCall(39, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cx 
     * @param {Pointer<Integer>} cy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getnativevideosize
     */
    GetNativeVideoSize(cx, cy) {
        result := ComCall(40, this, "uint*", cx, "uint*", cy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} cx 
     * @param {Pointer<Integer>} cy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getvideoaspectratio
     */
    GetVideoAspectRatio(cx, cy) {
        result := ComCall(41, this, "uint*", cx, "uint*", cy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-shutdown
     */
    Shutdown() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pDstSurf 
     * @param {Pointer<MFVideoNormalizedRect>} pSrc 
     * @param {Pointer<RECT>} pDst 
     * @param {Pointer<MFARGB>} pBorderClr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-transfervideoframe
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr) {
        result := ComCall(43, this, "ptr", pDstSurf, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPts 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-onvideostreamtick
     */
    OnVideoStreamTick(pPts) {
        result := ComCall(44, this, "int64*", pPts, "HRESULT")
        return result
    }
}

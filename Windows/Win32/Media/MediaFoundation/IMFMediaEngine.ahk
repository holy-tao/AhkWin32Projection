#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaError.ahk
#Include .\IMFMediaTimeRange.ahk
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
     * Gets the most recent error status.
     * @returns {IMFMediaError} Receives either a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaerror">IMFMediaError</a> interface, or the value <b>NULL</b>. If the value is <b>non-NULL</b>, the caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-geterror
     */
    GetError() {
        result := ComCall(3, this, "ptr*", &ppError := 0, "HRESULT")
        return IMFMediaError(ppError)
    }

    /**
     * Sets the current error code.
     * @param {Integer} error The error code, as an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_err">MF_MEDIA_ENGINE_ERR</a> value.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-seterrorcode
     */
    SetErrorCode(error) {
        result := ComCall(4, this, "int", error, "HRESULT")
        return result
    }

    /**
     * Sets a list of media sources.
     * @param {IMFMediaEngineSrcElements} pSrcElements A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelements">IMFMediaEngineSrcElements</a> interface. The caller must implement this interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements
     */
    SetSourceElements(pSrcElements) {
        result := ComCall(5, this, "ptr", pSrcElements, "HRESULT")
        return result
    }

    /**
     * Sets the URL of a media resource.
     * @param {BSTR} pUrl The URL of the media resource.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setsource
     */
    SetSource(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(6, this, "ptr", pUrl, "HRESULT")
        return result
    }

    /**
     * Gets the URL of the current media resource, or an empty string if no media resource is present.
     * @returns {BSTR} Receives a <b>BSTR</b> that contains the URL of the current media resource. If there is no media resource, <i>ppUrl</i> receives an empty string. The caller must free the  <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrentsource
     */
    GetCurrentSource() {
        ppUrl := BSTR()
        result := ComCall(7, this, "ptr", ppUrl, "HRESULT")
        return ppUrl
    }

    /**
     * Gets the current network state of the media engine.
     * @returns {Integer} Returns an <a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_network">MF_MEDIA_ENGINE_NETWORK</a> enumeration value.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getnetworkstate
     */
    GetNetworkState() {
        result := ComCall(8, this, "ushort")
        return result
    }

    /**
     * Gets the preload flag.
     * @returns {Integer} Returns an <a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_preload">MF_MEDIA_ENGINE_PRELOAD</a> enumeration value.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getpreload
     */
    GetPreload() {
        result := ComCall(9, this, "int")
        return result
    }

    /**
     * Sets the preload flag.
     * @param {Integer} Preload An <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_preload">MF_MEDIA_ENGINE_PRELOAD</a> value equal to  the preload flag.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setpreload
     */
    SetPreload(Preload) {
        result := ComCall(10, this, "int", Preload, "HRESULT")
        return result
    }

    /**
     * Queries how much resource data the media engine has buffered.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getbuffered
     */
    GetBuffered() {
        result := ComCall(11, this, "ptr*", &ppBuffered := 0, "HRESULT")
        return IMFMediaTimeRange(ppBuffered)
    }

    /**
     * Loads the current media source.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-load
     */
    Load() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Queries how likely it is that the Media Engine can play a specified type of media resource.
     * @param {BSTR} type A string that contains a MIME type with an optional codecs parameter, as defined in RFC 4281.
     * @returns {Integer} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_canplay">MF_MEDIA_ENGINE_CANPLAY</a> enumeration value.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-canplaytype
     */
    CanPlayType(type) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(13, this, "ptr", type, "int*", &pAnswer := 0, "HRESULT")
        return pAnswer
    }

    /**
     * Gets the ready state, which indicates whether the current media resource can be rendered.
     * @returns {Integer} Returns an <a href="/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_ready">MF_MEDIA_ENGINE_READY</a> enumeration value.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getreadystate
     */
    GetReadyState() {
        result := ComCall(14, this, "ushort")
        return result
    }

    /**
     * Queries whether the Media Engine is currently seeking to a new playback position.
     * @returns {BOOL} Returns <b>TRUE</b> if the Media Engine is seeking, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-isseeking
     */
    IsSeeking() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * Gets the current playback position.
     * @returns {Float} Returns the playback position, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrenttime
     */
    GetCurrentTime() {
        result := ComCall(16, this, "double")
        return result
    }

    /**
     * Seeks to a new playback position.
     * @param {Float} seekTime The new playback position, in seconds.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setcurrenttime
     */
    SetCurrentTime(seekTime) {
        result := ComCall(17, this, "double", seekTime, "HRESULT")
        return result
    }

    /**
     * Gets the initial playback position.
     * @returns {Float} Returns the initial playback position, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getstarttime
     */
    GetStartTime() {
        result := ComCall(18, this, "double")
        return result
    }

    /**
     * Gets the duration of the media resource.
     * @returns {Float} Returns the duration, in seconds. If no media data is available, the method returns not-a-number (NaN). If the duration is unbounded, the method returns an infinite value.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getduration
     */
    GetDuration() {
        result := ComCall(19, this, "double")
        return result
    }

    /**
     * Queries whether playback is currently paused.
     * @returns {BOOL} Returns <b>TRUE</b> if playback is paused, or  <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-ispaused
     */
    IsPaused() {
        result := ComCall(20, this, "int")
        return result
    }

    /**
     * Gets the default playback rate.
     * @returns {Float} Returns the default playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getdefaultplaybackrate
     */
    GetDefaultPlaybackRate() {
        result := ComCall(21, this, "double")
        return result
    }

    /**
     * Sets the default playback rate.
     * @param {Float} Rate The default playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setdefaultplaybackrate
     */
    SetDefaultPlaybackRate(Rate) {
        result := ComCall(22, this, "double", Rate, "HRESULT")
        return result
    }

    /**
     * Gets the current playback rate.
     * @returns {Float} Returns the playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getplaybackrate
     */
    GetPlaybackRate() {
        result := ComCall(23, this, "double")
        return result
    }

    /**
     * Sets the current playback rate.
     * @param {Float} Rate The playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setplaybackrate
     */
    SetPlaybackRate(Rate) {
        result := ComCall(24, this, "double", Rate, "HRESULT")
        return result
    }

    /**
     * Gets the time ranges that have been rendered.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getplayed
     */
    GetPlayed() {
        result := ComCall(25, this, "ptr*", &ppPlayed := 0, "HRESULT")
        return IMFMediaTimeRange(ppPlayed)
    }

    /**
     * Gets the time ranges to which the Media Engine can currently seek.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getseekable
     */
    GetSeekable() {
        result := ComCall(26, this, "ptr*", &ppSeekable := 0, "HRESULT")
        return IMFMediaTimeRange(ppSeekable)
    }

    /**
     * Queries whether playback has ended.
     * @returns {BOOL} Returns <b>TRUE</b> if the direction of playback is forward and playback has reached the end of the media resource. Returns <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-isended
     */
    IsEnded() {
        result := ComCall(27, this, "int")
        return result
    }

    /**
     * Queries whether the Media Engine automatically begins playback.
     * @returns {BOOL} Returns <b>TRUE</b> if the Media Engine automatically begins playback, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getautoplay
     */
    GetAutoPlay() {
        result := ComCall(28, this, "int")
        return result
    }

    /**
     * Specifies whether the Media Engine automatically begins playback.
     * @param {BOOL} AutoPlay If <b>TRUE</b>, the Media Engine automatically begins playback after it loads a media source. Otherwise, playback does not begin until the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play">IMFMediaEngine::Play</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setautoplay
     */
    SetAutoPlay(AutoPlay) {
        result := ComCall(29, this, "int", AutoPlay, "HRESULT")
        return result
    }

    /**
     * Queries whether the Media Engine will loop playback.
     * @returns {BOOL} Returns <b>TRUE</b> if looping is enabled, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getloop
     */
    GetLoop() {
        result := ComCall(30, this, "int")
        return result
    }

    /**
     * Specifies whether the Media Engine loops playback.
     * @param {BOOL} Loop_R 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setloop
     */
    SetLoop(Loop_R) {
        result := ComCall(31, this, "int", Loop_R, "HRESULT")
        return result
    }

    /**
     * Starts playback.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-play
     */
    Play() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * Pauses playback.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-pause
     */
    Pause() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * Queries whether the audio is muted.
     * @returns {BOOL} Returns <b>TRUE</b> if the audio is muted, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getmuted
     */
    GetMuted() {
        result := ComCall(34, this, "int")
        return result
    }

    /**
     * Mutes or unmutes the audio.
     * @param {BOOL} Muted Specify <b>TRUE</b> to mute the audio, or <b>FALSE</b> to unmute the audio.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setmuted
     */
    SetMuted(Muted) {
        result := ComCall(35, this, "int", Muted, "HRESULT")
        return result
    }

    /**
     * Gets the audio volume level.
     * @returns {Float} Returns the volume level. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getvolume
     */
    GetVolume() {
        result := ComCall(36, this, "double")
        return result
    }

    /**
     * Sets the audio volume level.
     * @param {Float} Volume The volume level. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-setvolume
     */
    SetVolume(Volume) {
        result := ComCall(37, this, "double", Volume, "HRESULT")
        return result
    }

    /**
     * Queries whether the current media resource contains a video stream.
     * @returns {BOOL} Returns <b>TRUE</b> if the current media resource contains a video stream. Returns <b>FALSE</b> if there is no media resource or the media resource does not contain a video stream.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-hasvideo
     */
    HasVideo() {
        result := ComCall(38, this, "int")
        return result
    }

    /**
     * Queries whether the current media resource contains an audio stream.
     * @returns {BOOL} Returns <b>TRUE</b> if the current media resource contains an audio stream. Returns <b>FALSE</b> if there is no media resource or the media resource does not contain an audio stream.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-hasaudio
     */
    HasAudio() {
        result := ComCall(39, this, "int")
        return result
    }

    /**
     * Gets the size of the video frame, adjusted for aspect ratio.
     * @param {Pointer<Integer>} cx Receives the width in pixels.
     * @param {Pointer<Integer>} cy Receives the height in pixels.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getnativevideosize
     */
    GetNativeVideoSize(cx, cy) {
        cxMarshal := cx is VarRef ? "uint*" : "ptr"
        cyMarshal := cy is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, cxMarshal, cx, cyMarshal, cy, "HRESULT")
        return result
    }

    /**
     * Gets the picture aspect ratio of the video stream.
     * @param {Pointer<Integer>} cx Receives the x component of the aspect ratio.
     * @param {Pointer<Integer>} cy Receives the y component of the aspect ratio.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-getvideoaspectratio
     */
    GetVideoAspectRatio(cx, cy) {
        cxMarshal := cx is VarRef ? "uint*" : "ptr"
        cyMarshal := cy is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, cxMarshal, cx, cyMarshal, cy, "HRESULT")
        return result
    }

    /**
     * Shuts down the Media Engine and releases the resources it is using.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-shutdown
     */
    Shutdown() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * Copies the current video frame to a DXGI surface or WIC bitmap.
     * @param {IUnknown} pDstSurf A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the destination surface.
     * @param {Pointer<MFVideoNormalizedRect>} pSrc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle.
     * @param {Pointer<RECT>} pDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle.
     * @param {Pointer<MFARGB>} pBorderClr A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-transfervideoframe
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr) {
        result := ComCall(43, this, "ptr", pDstSurf, "ptr", pSrc, "ptr", pDst, "ptr", pBorderClr, "HRESULT")
        return result
    }

    /**
     * Queries the Media Engine to find out whether a new video frame is ready.
     * @returns {Integer} If a new frame is ready, receives the presentation time of the frame.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediaengine-onvideostreamtick
     */
    OnVideoStreamTick() {
        result := ComCall(44, this, "int64*", &pPts := 0, "HRESULT")
        return pPts
    }
}

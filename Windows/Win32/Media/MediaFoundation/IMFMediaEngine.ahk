#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFARGB.ahk" { MFARGB }
#Import ".\MF_MEDIA_ENGINE_PRELOAD.ahk" { MF_MEDIA_ENGINE_PRELOAD }
#Import ".\IMFMediaTimeRange.ahk" { IMFMediaTimeRange }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMFMediaEngineSrcElements.ahk" { IMFMediaEngineSrcElements }
#Import ".\IMFMediaError.ahk" { IMFMediaError }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\MF_MEDIA_ENGINE_ERR.ahk" { MF_MEDIA_ENGINE_ERR }
#Import ".\MF_MEDIA_ENGINE_CANPLAY.ahk" { MF_MEDIA_ENGINE_CANPLAY }
#Import ".\MFVideoNormalizedRect.ahk" { MFVideoNormalizedRect }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Enables an application to play audio or video files.
 * @remarks
 * The Media Engine implements this interface. To create an instance of the Media Engine, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactory-createinstance">IMFMediaEngineClassFactory::CreateInstance</a>.
 * 
 * This interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaengineex">IMFMediaEngineEx</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengine
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngine extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngine
     * @type {Guid}
     */
    static IID := Guid("{98a1b0bb-03eb-4935-ae7c-93c1fa0e1c93}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetError               : IntPtr
        SetErrorCode           : IntPtr
        SetSourceElements      : IntPtr
        SetSource              : IntPtr
        GetCurrentSource       : IntPtr
        GetNetworkState        : IntPtr
        GetPreload             : IntPtr
        SetPreload             : IntPtr
        GetBuffered            : IntPtr
        Load                   : IntPtr
        CanPlayType            : IntPtr
        GetReadyState          : IntPtr
        IsSeeking              : IntPtr
        GetCurrentTime         : IntPtr
        SetCurrentTime         : IntPtr
        GetStartTime           : IntPtr
        GetDuration            : IntPtr
        IsPaused               : IntPtr
        GetDefaultPlaybackRate : IntPtr
        SetDefaultPlaybackRate : IntPtr
        GetPlaybackRate        : IntPtr
        SetPlaybackRate        : IntPtr
        GetPlayed              : IntPtr
        GetSeekable            : IntPtr
        IsEnded                : IntPtr
        GetAutoPlay            : IntPtr
        SetAutoPlay            : IntPtr
        GetLoop                : IntPtr
        SetLoop                : IntPtr
        Play                   : IntPtr
        Pause                  : IntPtr
        GetMuted               : IntPtr
        SetMuted               : IntPtr
        GetVolume              : IntPtr
        SetVolume              : IntPtr
        HasVideo               : IntPtr
        HasAudio               : IntPtr
        GetNativeVideoSize     : IntPtr
        GetVideoAspectRatio    : IntPtr
        Shutdown               : IntPtr
        TransferVideoFrame     : IntPtr
        OnVideoStreamTick      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the most recent error status.
     * @remarks
     * This method returns the last error status, if any, that resulted from loading the media source. If there has not been an error, <i>ppError</i> receives the value <b>NULL</b>.
     * 
     * This method corresponds to the <b>error</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {IMFMediaError} Receives either a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaerror">IMFMediaError</a> interface, or the value <b>NULL</b>. If the value is <b>non-NULL</b>, the caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-geterror
     */
    GetError() {
        result := ComCall(3, this, "ptr*", &ppError := 0, "HRESULT")
        return IMFMediaError(ppError)
    }

    /**
     * Sets the current error code.
     * @param {MF_MEDIA_ENGINE_ERR} _error The error code, as an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_err">MF_MEDIA_ENGINE_ERR</a> value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-seterrorcode
     */
    SetErrorCode(_error) {
        result := ComCall(4, this, MF_MEDIA_ENGINE_ERR, _error, "HRESULT")
        return result
    }

    /**
     * Sets a list of media sources.
     * @remarks
     * This method corresponds to adding a list of <b>source</b> elements to a media element in HTML5. 
     * 
     * The Media Engine tries to load each item in the <i>pSrcElements</i> list, until it finds one that loads successfully. After this method is called, the application can use the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelements">IMFMediaEngineSrcElements</a> interface to update the list at any time. To reload the list, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">IMFMediaEngine::Load</a>.
     * 
     * This method completes asynchronously. When the operation starts, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_LOADSTART</b> event. If no errors occur during the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">Load</a> operation, several other events are generated, including the following.
     * 
     * <ul>
     * <li><b>MF_MEDIA_ENGINE_EVENT_LOADEDMETADATA</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_LOADEDDATA</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_CANPLAY</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_CANPLAYTHROUGH</b></li>
     * </ul>
     * If the Media Engine is unable to load a URL, it sends an <b>MF_MEDIA_ENGINE_EVENT_ERROR</b> event. 
     * 
     * For more information about event handling in the Media Engine, see <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaenginenotify">IMFMediaEngineNotify</a>.
     * 
     * If the application also calls <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsource">IMFMediaEngine::SetSource</a>, the URL passed to <b>SetSource</b> takes precedence over the list given to <b>SetSourceElements</b>.
     * @param {IMFMediaEngineSrcElements} pSrcElements A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelements">IMFMediaEngineSrcElements</a> interface. The caller must implement this interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements
     */
    SetSourceElements(pSrcElements) {
        result := ComCall(5, this, "ptr", pSrcElements, "HRESULT")
        return result
    }

    /**
     * Sets the URL of a media resource.
     * @remarks
     * This method corresponds to setting the <b>src</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * The URL specified by this method takes precedence over media resources specified in the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements">IMFMediaEngine::SetSourceElements</a> method. To load the URL, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">IMFMediaEngine::Load</a>.
     * 
     * This method asynchronously loads the URL. When the operation starts, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_LOADSTART</b> event. If no errors occur during the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">Load</a> operation, several other events are generated, including the following.
     * 
     * <ul>
     * <li><b>MF_MEDIA_ENGINE_EVENT_LOADEDMETADATA</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_LOADEDDATA</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_CANPLAY</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_CANPLAYTHROUGH</b></li>
     * </ul>
     * If the Media Engine is unable to load the URL, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_ERROR</b> event. 
     * 
     * For more information about event handling in the Media Engine, see <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaenginenotify">IMFMediaEngineNotify</a>.
     * @param {BSTR} pUrl The URL of the media resource.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsource
     */
    SetSource(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(6, this, BSTR, pUrl, "HRESULT")
        return result
    }

    /**
     * Gets the URL of the current media resource, or an empty string if no media resource is present.
     * @remarks
     * This method corresponds to the <b>currentSrc</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * Initially, the current media resource is empty. It is updated when the Media Engine performs the resource selection algorithm.
     * @returns {BSTR} Receives a <b>BSTR</b> that contains the URL of the current media resource. If there is no media resource, <i>ppUrl</i> receives an empty string. The caller must free the  <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrentsource
     */
    GetCurrentSource() {
        ppUrl := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, ppUrl, "HRESULT")
        return ppUrl
    }

    /**
     * Gets the current network state of the media engine.
     * @remarks
     * This method corresponds to the <b>networkState</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {Integer} Returns an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_network">MF_MEDIA_ENGINE_NETWORK</a> enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getnetworkstate
     */
    GetNetworkState() {
        result := ComCall(8, this, UInt16)
        return result
    }

    /**
     * Gets the preload flag.
     * @remarks
     * This method corresponds to the <b>preload</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5. The value is a hint to the user-agent whether to preload the media resource.
     * @returns {MF_MEDIA_ENGINE_PRELOAD} Returns an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_preload">MF_MEDIA_ENGINE_PRELOAD</a> enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getpreload
     */
    GetPreload() {
        result := ComCall(9, this, MF_MEDIA_ENGINE_PRELOAD)
        return result
    }

    /**
     * Sets the preload flag.
     * @remarks
     * This method corresponds to setting the <b>preload</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5. The value is a hint to the user-agent whether to preload the media resource.
     * @param {MF_MEDIA_ENGINE_PRELOAD} Preload An <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_preload">MF_MEDIA_ENGINE_PRELOAD</a> value equal to  the preload flag.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setpreload
     */
    SetPreload(Preload) {
        result := ComCall(10, this, MF_MEDIA_ENGINE_PRELOAD, Preload, "HRESULT")
        return result
    }

    /**
     * Queries how much resource data the media engine has buffered.
     * @remarks
     * This method corresponds to the <b>buffered</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * The returned  <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface represents a list of time ranges. The time ranges indicate which portions of the media resource have been downloaded. The time range list can be empty.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getbuffered
     */
    GetBuffered() {
        result := ComCall(11, this, "ptr*", &ppBuffered := 0, "HRESULT")
        return IMFMediaTimeRange(ppBuffered)
    }

    /**
     * Loads the current media source.
     * @remarks
     * The main purpose of this method is to reload a list of source elements after updating the list. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements">SetSourceElements</a>. Otherwise, calling this method is generally not required. To load a new media source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsource">IMFMediaEngine::SetSource</a> or <b>IMFMediaEngine::SetSourceElements</b>.
     * 
     * The <b>Load</b> method explicitly invokes the Media Engine's media resource loading algorithm. Before calling this method, you must set the media resource by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsource">IMFMediaEngine::SetSource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setsourceelements">IMFMediaEngine::SetSourceElements</a>. 
     * 
     * This method completes asynchronously. When the <b>Load</b> operation starts, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_LOADSTART</b> event. If no errors occur during the <b>Load</b> operation, several other events are generated, including the following.
     * 
     * <ul>
     * <li><b>MF_MEDIA_ENGINE_EVENT_LOADEDMETADATA</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_LOADEDDATA</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_CANPLAY</b></li>
     * <li><b>MF_MEDIA_ENGINE_EVENT_CANPLAYTHROUGH</b></li>
     * </ul>
     * If the Media Engine is unable to load the file, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_ERROR</b> event. 
     * 
     * For more information about event handling in the Media Engine, see <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediaenginenotify">IMFMediaEngineNotify</a>.
     * 
     * This method corresponds to the <b>load</b> method of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load
     */
    Load() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Queries how likely it is that the Media Engine can play a specified type of media resource.
     * @remarks
     * This method corresponds to the <b>canPlayType</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * The <b>canPlayType</b> attribute defines the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>"" (empty string)</td>
     * <td>The user-agent cannot play the resource, or the resource type is "application/octet-stream".</td>
     * </tr>
     * <tr>
     * <td>"probably"</td>
     * <td>The user-agent probably can play the resource.</td>
     * </tr>
     * <tr>
     * <td>"maybe"</td>
     * <td>Neither of the previous values applies.</td>
     * </tr>
     * </table>
     *  
     * 
     * The value "probably" is used because a MIME type for a media resource is generally not a complete description of the resource. For example, "video/mp4" specifies an MP4 file with video, but does not describe the codec. Even with the optional codecs parameter, the MIME type omits some information, such as the actual coded bit rate. Therefore, it is usually impossible to be certain that playback is possible until the actual media resource is opened.
     * @param {BSTR} type A string that contains a MIME type with an optional codecs parameter, as defined in RFC 4281.
     * @returns {MF_MEDIA_ENGINE_CANPLAY} Receives an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_canplay">MF_MEDIA_ENGINE_CANPLAY</a> enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-canplaytype
     */
    CanPlayType(type) {
        type := type is String ? BSTR.Alloc(type).Value : type

        result := ComCall(13, this, BSTR, type, "int*", &pAnswer := 0, "HRESULT")
        return pAnswer
    }

    /**
     * Gets the ready state, which indicates whether the current media resource can be rendered.
     * @remarks
     * This method corresponds to the <b>readyState</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {Integer} Returns an <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_ready">MF_MEDIA_ENGINE_READY</a> enumeration value.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getreadystate
     */
    GetReadyState() {
        result := ComCall(14, this, UInt16)
        return result
    }

    /**
     * Queries whether the Media Engine is currently seeking to a new playback position.
     * @remarks
     * This method corresponds to the <b>seeking</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {BOOL} Returns <b>TRUE</b> if the Media Engine is seeking, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-isseeking
     */
    IsSeeking() {
        result := ComCall(15, this, BOOL)
        return result
    }

    /**
     * Gets the current playback position. (IMFMediaEngine.GetCurrentTime)
     * @remarks
     * This method corresponds to the <b>currentTime</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5. 
     * 
     * Note that after you call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-pause">Pause</a>, the time returned by <b>GetCurrentTime</b> may not be precisely accurate. Apps that need a frame-accurate position value, such as media editors, should call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-framestep">FrameStep</a> immediately after calling **Pause** before calling <b>GetCurrentTime</b>.
     * @returns {Float} Returns the playback position, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrenttime
     */
    GetCurrentTime() {
        result := ComCall(16, this, Float64)
        return result
    }

    /**
     * Seeks to a new playback position.
     * @remarks
     * This method corresponds to setting the <b>currentTime</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * The method completes asynchronously. When the seek operation starts, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_SEEKING</b> event. When the seek operation completes, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_SEEKED</b> event. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEventNotify::EventNotify</a>.
     * @param {Float} seekTime The new playback position, in seconds.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setcurrenttime
     */
    SetCurrentTime(seekTime) {
        result := ComCall(17, this, "double", seekTime, "HRESULT")
        return result
    }

    /**
     * Gets the initial playback position.
     * @remarks
     * This method corresponds to the <b>initialTime</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {Float} Returns the initial playback position, in seconds.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getstarttime
     */
    GetStartTime() {
        result := ComCall(18, this, Float64)
        return result
    }

    /**
     * Gets the duration of the media resource.
     * @remarks
     * This method corresponds to the <b>duration</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * If the duration changes, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_DURATIONCHANGE</b> event. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEngineNotify::EventNotify</a>.
     * @returns {Float} Returns the duration, in seconds. If no media data is available, the method returns not-a-number (NaN). If the duration is unbounded, the method returns an infinite value.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getduration
     */
    GetDuration() {
        result := ComCall(19, this, Float64)
        return result
    }

    /**
     * Queries whether playback is currently paused.
     * @remarks
     * This method corresponds to the <b>paused</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {BOOL} Returns <b>TRUE</b> if playback is paused, or  <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-ispaused
     */
    IsPaused() {
        result := ComCall(20, this, BOOL)
        return result
    }

    /**
     * Gets the default playback rate.
     * @remarks
     * This method corresponds to getting the <b>defaultPlaybackRate</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5. 
     * 
     * The default playback rate is used for the next call to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play">IMFMediaEngine::Play</a> method. To change the current playback rate, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setplaybackrate">IMFMediaEngine::SetPlaybackRate</a>.
     * @returns {Float} Returns the default playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getdefaultplaybackrate
     */
    GetDefaultPlaybackRate() {
        result := ComCall(21, this, Float64)
        return result
    }

    /**
     * Sets the default playback rate.
     * @remarks
     * This method corresponds to setting the <b>defaultPlaybackRate</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @param {Float} Rate The default playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setdefaultplaybackrate
     */
    SetDefaultPlaybackRate(Rate) {
        result := ComCall(22, this, "double", Rate, "HRESULT")
        return result
    }

    /**
     * Gets the current playback rate. (IMFMediaEngine.GetPlaybackRate)
     * @remarks
     * This method corresponds to getting the <b>playbackRate</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {Float} Returns the playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getplaybackrate
     */
    GetPlaybackRate() {
        result := ComCall(23, this, Float64)
        return result
    }

    /**
     * Sets the current playback rate.
     * @remarks
     * This method corresponds to setting the <b>playbackRate</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @param {Float} Rate The playback rate, as a multiple of normal (1×) playback. A negative value indicates reverse playback.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setplaybackrate
     */
    SetPlaybackRate(Rate) {
        result := ComCall(24, this, "double", Rate, "HRESULT")
        return result
    }

    /**
     * Gets the time ranges that have been rendered.
     * @remarks
     * This method corresponds to the <b>played</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getplayed
     */
    GetPlayed() {
        result := ComCall(25, this, "ptr*", &ppPlayed := 0, "HRESULT")
        return IMFMediaTimeRange(ppPlayed)
    }

    /**
     * Gets the time ranges to which the Media Engine can currently seek.
     * @remarks
     * This method corresponds to the <b>seekable</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * To find out whether the media source supports seeking, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-getresourcecharacteristics">IMFMediaEngineEx::GetResourceCharacteristics</a>.
     * @returns {IMFMediaTimeRange} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediatimerange">IMFMediaTimeRange</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getseekable
     */
    GetSeekable() {
        result := ComCall(26, this, "ptr*", &ppSeekable := 0, "HRESULT")
        return IMFMediaTimeRange(ppSeekable)
    }

    /**
     * Queries whether playback has ended.
     * @remarks
     * This method corresponds to the <b>ended</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @returns {BOOL} Returns <b>TRUE</b> if the direction of playback is forward and playback has reached the end of the media resource. Returns <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-isended
     */
    IsEnded() {
        result := ComCall(27, this, BOOL)
        return result
    }

    /**
     * Queries whether the Media Engine automatically begins playback.
     * @remarks
     * This method corresponds to the <b>autoplay</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * If this method returns <b>TRUE</b>, playback begins automatically after the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-load">IMFMediaEngine::Load</a> method completes. Otherwise, playback begins when the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play">IMFMediaEngine::Play</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if the Media Engine automatically begins playback, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getautoplay
     */
    GetAutoPlay() {
        result := ComCall(28, this, BOOL)
        return result
    }

    /**
     * Specifies whether the Media Engine automatically begins playback.
     * @remarks
     * This method corresponds to setting the <b>autoplay</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @param {BOOL} AutoPlay If <b>TRUE</b>, the Media Engine automatically begins playback after it loads a media source. Otherwise, playback does not begin until the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play">IMFMediaEngine::Play</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setautoplay
     */
    SetAutoPlay(AutoPlay) {
        result := ComCall(29, this, BOOL, AutoPlay, "HRESULT")
        return result
    }

    /**
     * Queries whether the Media Engine will loop playback.
     * @remarks
     * This method corresponds to getting the <b>loop</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * If looping is enabled, the Media Engine seeks to the start of the content when playback reaches the end.
     * @returns {BOOL} Returns <b>TRUE</b> if looping is enabled, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getloop
     */
    GetLoop() {
        result := ComCall(30, this, BOOL)
        return result
    }

    /**
     * Specifies whether the Media Engine loops playback.
     * @remarks
     * If <i>Loop</i> is <b>TRUE</b>, playback loops back to the beginning when it reaches the end of the source.
     * 
     * This method corresponds to setting the <b>loop</b> attribute of the <b>HTMLMediaElement</b> interface in HTML5.
     * @param {BOOL} _Loop Specify <b>TRUE</b> to enable looping, or <b>FALSE</b> to disable looping.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setloop
     */
    SetLoop(_Loop) {
        result := ComCall(31, this, BOOL, _Loop, "HRESULT")
        return result
    }

    /**
     * Starts playback. (IMFMediaEngine.Play)
     * @remarks
     * This method corresponds to the <b>play</b> method of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * The method completes asynchronously. When the operation starts, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_PLAY</b> event. When playback is under way, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_PLAYING</b> event. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEventNotify::EventNotify</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-play
     */
    Play() {
        result := ComCall(32, this, "HRESULT")
        return result
    }

    /**
     * Pauses playback. (IMFMediaEngine.Pause)
     * @remarks
     * This method corresponds to the <b>pause</b> method of the <b>HTMLMediaElement</b> interface in HTML5.
     * 
     * The method completes asynchronously. When the transition to paused is complete, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_PAUSE                </b> event. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEventNotify::EventNotify</a>.
     * 
     * Note that after you call <b>Pause</b>, the time returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getcurrenttime">GetCurrentTime</a> may not be precisely accurate. Apps that need a frame-accurate position value, such as media editors, should call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineex-framestep">FrameStep</a> immediately after calling **Pause** before calling <b>GetCurrentTime</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-pause
     */
    Pause() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    /**
     * Queries whether the audio is muted. (IMFMediaEngine.GetMuted)
     * @returns {BOOL} Returns <b>TRUE</b> if the audio is muted, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getmuted
     */
    GetMuted() {
        result := ComCall(34, this, BOOL)
        return result
    }

    /**
     * Mutes or unmutes the audio. (IMFMediaEngine.SetMuted)
     * @param {BOOL} Muted Specify <b>TRUE</b> to mute the audio, or <b>FALSE</b> to unmute the audio.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setmuted
     */
    SetMuted(Muted) {
        result := ComCall(35, this, BOOL, Muted, "HRESULT")
        return result
    }

    /**
     * Gets the audio volume level.
     * @returns {Float} Returns the volume level. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getvolume
     */
    GetVolume() {
        result := ComCall(36, this, Float64)
        return result
    }

    /**
     * Sets the audio volume level.
     * @remarks
     * When the audio balance changes, the Media Engine sends an <b>MF_MEDIA_ENGINE_EVENT_VOLUMECHANGE</b> event. See <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaenginenotify-eventnotify">IMFMediaEventNotify::EventNotify</a>.
     * @param {Float} Volume The volume level. Volume is expressed as an attenuation level, where 0.0 indicates silence and 1.0 indicates full volume (no attenuation).
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-setvolume
     */
    SetVolume(Volume) {
        result := ComCall(37, this, "double", Volume, "HRESULT")
        return result
    }

    /**
     * Queries whether the current media resource contains a video stream.
     * @returns {BOOL} Returns <b>TRUE</b> if the current media resource contains a video stream. Returns <b>FALSE</b> if there is no media resource or the media resource does not contain a video stream.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-hasvideo
     */
    HasVideo() {
        result := ComCall(38, this, BOOL)
        return result
    }

    /**
     * Queries whether the current media resource contains an audio stream.
     * @returns {BOOL} Returns <b>TRUE</b> if the current media resource contains an audio stream. Returns <b>FALSE</b> if there is no media resource or the media resource does not contain an audio stream.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-hasaudio
     */
    HasAudio() {
        result := ComCall(39, this, BOOL)
        return result
    }

    /**
     * Gets the size of the video frame, adjusted for aspect ratio.
     * @remarks
     * This method adjusts for the correct picture aspect ratio.
     * For example, if the encoded frame is 720 × 420 and the picture aspect ratio is 4:3, the method will return a size equal to 640 × 480 pixels.
     * @param {Pointer<Integer>} cx Receives the width in pixels.
     * @param {Pointer<Integer>} _cy Receives the height in pixels.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getnativevideosize
     */
    GetNativeVideoSize(cx, _cy) {
        cxMarshal := cx is VarRef ? "uint*" : "ptr"
        _cyMarshal := _cy is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, cxMarshal, cx, _cyMarshal, _cy, "HRESULT")
        return result
    }

    /**
     * Gets the picture aspect ratio of the video stream.
     * @remarks
     * The Media Engine automatically converts the pixel aspect ratio to 1:1 (square pixels).
     * @param {Pointer<Integer>} cx Receives the x component of the aspect ratio.
     * @param {Pointer<Integer>} _cy Receives the y component of the aspect ratio.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-getvideoaspectratio
     */
    GetVideoAspectRatio(cx, _cy) {
        cxMarshal := cx is VarRef ? "uint*" : "ptr"
        _cyMarshal := _cy is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, cxMarshal, cx, _cyMarshal, _cy, "HRESULT")
        return result
    }

    /**
     * Shuts down the Media Engine and releases the resources it is using.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-shutdown
     */
    Shutdown() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * Copies the current video frame to a DXGI surface or WIC bitmap.
     * @remarks
     * In frame-server mode, call this method to blit the video frame to a DXGI or WIC surface. The application can call this method at any time after the Media Engine loads a video resource. Typically, however, the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-onvideostreamtick">IMFMediaEngine::OnVideoStreamTick</a> first, to determine whether a new frame is available. If <b>OnVideoStreamTick</b> returns <b>S_OK</b>, the application then calls <b>TransferVideoFrame</b>.
     * 
     * The Media Engine scales and letterboxes the video to fit the destination rectangle. It fills the letterbox area with the border color.
     * 
     * For protected content, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengineprotectedcontent-transfervideoframe">IMFMediaEngineProtectedContent::TransferVideoFrame</a> method instead of this method.
     * @param {IUnknown} pDstSurf A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the destination surface.
     * @param {Pointer<MFVideoNormalizedRect>} pSrc A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/evr/ns-evr-mfvideonormalizedrect">MFVideoNormalizedRect</a> structure that specifies the source rectangle.
     * @param {Pointer<RECT>} pDst A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the destination rectangle.
     * @param {Pointer<MFARGB>} pBorderClr A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfargb">MFARGB</a> structure that specifies the border color.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-transfervideoframe
     */
    TransferVideoFrame(pDstSurf, pSrc, pDst, pBorderClr) {
        result := ComCall(43, this, "ptr", pDstSurf, MFVideoNormalizedRect.Ptr, pSrc, RECT.Ptr, pDst, MFARGB.Ptr, pBorderClr, "HRESULT")
        return result
    }

    /**
     * Queries the Media Engine to find out whether a new video frame is ready.
     * @remarks
     * In frame-server mode, the application should call this method whenever a vertical blank occurs in the display device. If the method returns <b>S_OK</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-transfervideoframe">IMFMediaEngine::TransferVideoFrame</a> to blit the frame to the render target. If the method returns <b>S_FALSE</b>, wait for the next vertical blank and call the method again.
     * 
     * Do not call this method in rendering mode or audio-only mode.
     * @returns {Integer} If a new frame is ready, receives the presentation time of the frame.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-onvideostreamtick
     */
    OnVideoStreamTick() {
        result := ComCall(44, this, "int64*", &pPts := 0, "HRESULT")
        return pPts
    }

    Query(iid) {
        if (IMFMediaEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetError := CallbackCreate(GetMethod(implObj, "GetError"), flags, 2)
        this.vtbl.SetErrorCode := CallbackCreate(GetMethod(implObj, "SetErrorCode"), flags, 2)
        this.vtbl.SetSourceElements := CallbackCreate(GetMethod(implObj, "SetSourceElements"), flags, 2)
        this.vtbl.SetSource := CallbackCreate(GetMethod(implObj, "SetSource"), flags, 2)
        this.vtbl.GetCurrentSource := CallbackCreate(GetMethod(implObj, "GetCurrentSource"), flags, 2)
        this.vtbl.GetNetworkState := CallbackCreate(GetMethod(implObj, "GetNetworkState"), flags, 1)
        this.vtbl.GetPreload := CallbackCreate(GetMethod(implObj, "GetPreload"), flags, 1)
        this.vtbl.SetPreload := CallbackCreate(GetMethod(implObj, "SetPreload"), flags, 2)
        this.vtbl.GetBuffered := CallbackCreate(GetMethod(implObj, "GetBuffered"), flags, 2)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 1)
        this.vtbl.CanPlayType := CallbackCreate(GetMethod(implObj, "CanPlayType"), flags, 3)
        this.vtbl.GetReadyState := CallbackCreate(GetMethod(implObj, "GetReadyState"), flags, 1)
        this.vtbl.IsSeeking := CallbackCreate(GetMethod(implObj, "IsSeeking"), flags, 1)
        this.vtbl.GetCurrentTime := CallbackCreate(GetMethod(implObj, "GetCurrentTime"), flags, 1)
        this.vtbl.SetCurrentTime := CallbackCreate(GetMethod(implObj, "SetCurrentTime"), flags, 2)
        this.vtbl.GetStartTime := CallbackCreate(GetMethod(implObj, "GetStartTime"), flags, 1)
        this.vtbl.GetDuration := CallbackCreate(GetMethod(implObj, "GetDuration"), flags, 1)
        this.vtbl.IsPaused := CallbackCreate(GetMethod(implObj, "IsPaused"), flags, 1)
        this.vtbl.GetDefaultPlaybackRate := CallbackCreate(GetMethod(implObj, "GetDefaultPlaybackRate"), flags, 1)
        this.vtbl.SetDefaultPlaybackRate := CallbackCreate(GetMethod(implObj, "SetDefaultPlaybackRate"), flags, 2)
        this.vtbl.GetPlaybackRate := CallbackCreate(GetMethod(implObj, "GetPlaybackRate"), flags, 1)
        this.vtbl.SetPlaybackRate := CallbackCreate(GetMethod(implObj, "SetPlaybackRate"), flags, 2)
        this.vtbl.GetPlayed := CallbackCreate(GetMethod(implObj, "GetPlayed"), flags, 2)
        this.vtbl.GetSeekable := CallbackCreate(GetMethod(implObj, "GetSeekable"), flags, 2)
        this.vtbl.IsEnded := CallbackCreate(GetMethod(implObj, "IsEnded"), flags, 1)
        this.vtbl.GetAutoPlay := CallbackCreate(GetMethod(implObj, "GetAutoPlay"), flags, 1)
        this.vtbl.SetAutoPlay := CallbackCreate(GetMethod(implObj, "SetAutoPlay"), flags, 2)
        this.vtbl.GetLoop := CallbackCreate(GetMethod(implObj, "GetLoop"), flags, 1)
        this.vtbl.SetLoop := CallbackCreate(GetMethod(implObj, "SetLoop"), flags, 2)
        this.vtbl.Play := CallbackCreate(GetMethod(implObj, "Play"), flags, 1)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.GetMuted := CallbackCreate(GetMethod(implObj, "GetMuted"), flags, 1)
        this.vtbl.SetMuted := CallbackCreate(GetMethod(implObj, "SetMuted"), flags, 2)
        this.vtbl.GetVolume := CallbackCreate(GetMethod(implObj, "GetVolume"), flags, 1)
        this.vtbl.SetVolume := CallbackCreate(GetMethod(implObj, "SetVolume"), flags, 2)
        this.vtbl.HasVideo := CallbackCreate(GetMethod(implObj, "HasVideo"), flags, 1)
        this.vtbl.HasAudio := CallbackCreate(GetMethod(implObj, "HasAudio"), flags, 1)
        this.vtbl.GetNativeVideoSize := CallbackCreate(GetMethod(implObj, "GetNativeVideoSize"), flags, 3)
        this.vtbl.GetVideoAspectRatio := CallbackCreate(GetMethod(implObj, "GetVideoAspectRatio"), flags, 3)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
        this.vtbl.TransferVideoFrame := CallbackCreate(GetMethod(implObj, "TransferVideoFrame"), flags, 5)
        this.vtbl.OnVideoStreamTick := CallbackCreate(GetMethod(implObj, "OnVideoStreamTick"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetError)
        CallbackFree(this.vtbl.SetErrorCode)
        CallbackFree(this.vtbl.SetSourceElements)
        CallbackFree(this.vtbl.SetSource)
        CallbackFree(this.vtbl.GetCurrentSource)
        CallbackFree(this.vtbl.GetNetworkState)
        CallbackFree(this.vtbl.GetPreload)
        CallbackFree(this.vtbl.SetPreload)
        CallbackFree(this.vtbl.GetBuffered)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.CanPlayType)
        CallbackFree(this.vtbl.GetReadyState)
        CallbackFree(this.vtbl.IsSeeking)
        CallbackFree(this.vtbl.GetCurrentTime)
        CallbackFree(this.vtbl.SetCurrentTime)
        CallbackFree(this.vtbl.GetStartTime)
        CallbackFree(this.vtbl.GetDuration)
        CallbackFree(this.vtbl.IsPaused)
        CallbackFree(this.vtbl.GetDefaultPlaybackRate)
        CallbackFree(this.vtbl.SetDefaultPlaybackRate)
        CallbackFree(this.vtbl.GetPlaybackRate)
        CallbackFree(this.vtbl.SetPlaybackRate)
        CallbackFree(this.vtbl.GetPlayed)
        CallbackFree(this.vtbl.GetSeekable)
        CallbackFree(this.vtbl.IsEnded)
        CallbackFree(this.vtbl.GetAutoPlay)
        CallbackFree(this.vtbl.SetAutoPlay)
        CallbackFree(this.vtbl.GetLoop)
        CallbackFree(this.vtbl.SetLoop)
        CallbackFree(this.vtbl.Play)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.GetMuted)
        CallbackFree(this.vtbl.SetMuted)
        CallbackFree(this.vtbl.GetVolume)
        CallbackFree(this.vtbl.SetVolume)
        CallbackFree(this.vtbl.HasVideo)
        CallbackFree(this.vtbl.HasAudio)
        CallbackFree(this.vtbl.GetNativeVideoSize)
        CallbackFree(this.vtbl.GetVideoAspectRatio)
        CallbackFree(this.vtbl.Shutdown)
        CallbackFree(this.vtbl.TransferVideoFrame)
        CallbackFree(this.vtbl.OnVideoStreamTick)
    }
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastBackgroundServiceStreamInfo.ahk
#Include .\IAppBroadcastBackgroundServiceStreamInfo2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastBackgroundServiceStreamInfo.ahk
#Include .\AppBroadcastStreamStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Manages the stream state of the app broadcast background service.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicestreaminfo
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastBackgroundServiceStreamInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastBackgroundServiceStreamInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastBackgroundServiceStreamInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the app broadcast stream state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicestreaminfo.streamstate
     * @type {Integer} 
     */
    StreamState {
        get => this.get_StreamState()
    }

    /**
     * Gets or sets the desired video encoding bitrate for the app broadcast background service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicestreaminfo.desiredvideoencodingbitrate
     * @type {Integer} 
     */
    DesiredVideoEncodingBitrate {
        get => this.get_DesiredVideoEncodingBitrate()
        set => this.put_DesiredVideoEncodingBitrate(value)
    }

    /**
     * Gets or sets the bandwidth test bitrate for the app broadcast background service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicestreaminfo.bandwidthtestbitrate
     * @type {Integer} 
     */
    BandwidthTestBitrate {
        get => this.get_BandwidthTestBitrate()
        set => this.put_BandwidthTestBitrate(value)
    }

    /**
     * Gets or sets the audio codec used by the app broadcast background service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicestreaminfo.audiocodec
     * @type {HSTRING} 
     */
    AudioCodec {
        get => this.get_AudioCodec()
        set => this.put_AudioCodec(value)
    }

    /**
     * Gets the broadcast stream reader for the app broadcast background service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicestreaminfo.broadcaststreamreader
     * @type {AppBroadcastStreamReader} 
     */
    BroadcastStreamReader {
        get => this.get_BroadcastStreamReader()
    }

    /**
     * Occurs when the app broadcast stream state changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, AppBroadcastStreamStateChangedEventArgs>}
    */
    OnStreamStateChanged {
        get {
            if(!this.HasProp("__OnStreamStateChanged")){
                this.__OnStreamStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0c110cb8-b08a-5c07-b295-229049a46c22}"),
                    AppBroadcastBackgroundServiceStreamInfo,
                    AppBroadcastStreamStateChangedEventArgs
                )
                this.__OnStreamStateChangedToken := this.add_StreamStateChanged(this.__OnStreamStateChanged.iface)
            }
            return this.__OnStreamStateChanged
        }
    }

    /**
     * Occurs when the app broadcast video encoding resolution changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, IInspectable>}
    */
    OnVideoEncodingResolutionChanged {
        get {
            if(!this.HasProp("__OnVideoEncodingResolutionChanged")){
                this.__OnVideoEncodingResolutionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{73c8ec4b-f104-5536-b8b4-4d9aad61c9b4}"),
                    AppBroadcastBackgroundServiceStreamInfo,
                    IInspectable
                )
                this.__OnVideoEncodingResolutionChangedToken := this.add_VideoEncodingResolutionChanged(this.__OnVideoEncodingResolutionChanged.iface)
            }
            return this.__OnVideoEncodingResolutionChanged
        }
    }

    /**
     * Occurs when the app broadcast video encoding bitrate changes.
     * @type {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, IInspectable>}
    */
    OnVideoEncodingBitrateChanged {
        get {
            if(!this.HasProp("__OnVideoEncodingBitrateChanged")){
                this.__OnVideoEncodingBitrateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{73c8ec4b-f104-5536-b8b4-4d9aad61c9b4}"),
                    AppBroadcastBackgroundServiceStreamInfo,
                    IInspectable
                )
                this.__OnVideoEncodingBitrateChangedToken := this.add_VideoEncodingBitrateChanged(this.__OnVideoEncodingBitrateChanged.iface)
            }
            return this.__OnVideoEncodingBitrateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStreamStateChangedToken")) {
            this.remove_StreamStateChanged(this.__OnStreamStateChangedToken)
            this.__OnStreamStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVideoEncodingResolutionChangedToken")) {
            this.remove_VideoEncodingResolutionChanged(this.__OnVideoEncodingResolutionChangedToken)
            this.__OnVideoEncodingResolutionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVideoEncodingBitrateChangedToken")) {
            this.remove_VideoEncodingBitrateChanged(this.__OnVideoEncodingBitrateChangedToken)
            this.__OnVideoEncodingBitrateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StreamState() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.get_StreamState()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredVideoEncodingBitrate(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.put_DesiredVideoEncodingBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredVideoEncodingBitrate() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.get_DesiredVideoEncodingBitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BandwidthTestBitrate(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.put_BandwidthTestBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BandwidthTestBitrate() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.get_BandwidthTestBitrate()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AudioCodec(value) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.put_AudioCodec(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AudioCodec() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.get_AudioCodec()
    }

    /**
     * 
     * @returns {AppBroadcastStreamReader} 
     */
    get_BroadcastStreamReader() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.get_BroadcastStreamReader()
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, AppBroadcastStreamStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StreamStateChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.add_StreamStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StreamStateChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.remove_StreamStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoEncodingResolutionChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.add_VideoEncodingResolutionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoEncodingResolutionChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.remove_VideoEncodingResolutionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastBackgroundServiceStreamInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoEncodingBitrateChanged(handler) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.add_VideoEncodingBitrateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoEncodingBitrateChanged(token) {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo := IAppBroadcastBackgroundServiceStreamInfo(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo.remove_VideoEncodingBitrateChanged(token)
    }

    /**
     * Notifies the system that a problem with the broadcast stream has been detected.
     * @remarks
     * The may be a problem with the broadcast stream if the [FrameId](/uwp/api/windows.media.capture.appbroadcaststreamvideoheader.FrameId) of an audio or video frame is not an increment of 1 from the previous frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastbackgroundservicestreaminfo.reportproblemwithstream
     */
    ReportProblemWithStream() {
        if (!this.HasProp("__IAppBroadcastBackgroundServiceStreamInfo2")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastBackgroundServiceStreamInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastBackgroundServiceStreamInfo2 := IAppBroadcastBackgroundServiceStreamInfo2(outPtr)
        }

        return this.__IAppBroadcastBackgroundServiceStreamInfo2.ReportProblemWithStream()
    }

;@endregion Instance Methods
}

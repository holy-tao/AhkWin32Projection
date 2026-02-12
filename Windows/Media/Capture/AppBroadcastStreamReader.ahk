#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastStreamReader.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastStreamReader.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides methods and events for obtaining audio and video frames from an app broadcast stream.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by accessing the [AppBroadcastBackgroundServiceStreamInfo.BroadcastStreamReader](appbroadcastbackgroundservicestreaminfo_broadcaststreamreader.md)
 * 
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastStreamReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastStreamReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastStreamReader.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of channels in the audio stream associated with the [AppBroadcastStreamReader](appbroadcaststreamreader.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.audiochannels
     * @type {Integer} 
     */
    AudioChannels {
        get => this.get_AudioChannels()
    }

    /**
     * Gets the sample rate of the audio stream associated with the [AppBroadcastStreamReader](appbroadcaststreamreader.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.audiosamplerate
     * @type {Integer} 
     */
    AudioSampleRate {
        get => this.get_AudioSampleRate()
    }

    /**
     * Gets a buffer containing the sequence header for the AAC audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.audioaacsequence
     * @type {IBuffer} 
     */
    AudioAacSequence {
        get => this.get_AudioAacSequence()
    }

    /**
     * Gets the bitrate of the audio stream associated with the [AppBroadcastStreamReader](appbroadcaststreamreader.md), in bits per second.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.audiobitrate
     * @type {Integer} 
     */
    AudioBitrate {
        get => this.get_AudioBitrate()
    }

    /**
     * Gets the width of the frames in the video stream associated with the [AppBroadcastStreamReader](appbroadcaststreamreader.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.videowidth
     * @type {Integer} 
     */
    VideoWidth {
        get => this.get_VideoWidth()
    }

    /**
     * Gets the height of the frames in the video stream associated with the [AppBroadcastStreamReader](appbroadcaststreamreader.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.videoheight
     * @type {Integer} 
     */
    VideoHeight {
        get => this.get_VideoHeight()
    }

    /**
     * Gets the bitrate of the video stream associated with the [AppBroadcastStreamReader](appbroadcaststreamreader.md), in bits per second.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.videobitrate
     * @type {Integer} 
     */
    VideoBitrate {
        get => this.get_VideoBitrate()
    }

    /**
     * Raised when a new audio frame from the broadcast stream arrives.
     * @type {TypedEventHandler<AppBroadcastStreamReader, IInspectable>}
    */
    OnAudioFrameArrived {
        get {
            if(!this.HasProp("__OnAudioFrameArrived")){
                this.__OnAudioFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{66d1378b-0e04-5801-8bdd-feb1081bbecb}"),
                    AppBroadcastStreamReader,
                    IInspectable
                )
                this.__OnAudioFrameArrivedToken := this.add_AudioFrameArrived(this.__OnAudioFrameArrived.iface)
            }
            return this.__OnAudioFrameArrived
        }
    }

    /**
     * Raised when a new video frame from the broadcast stream arrives.
     * @type {TypedEventHandler<AppBroadcastStreamReader, IInspectable>}
    */
    OnVideoFrameArrived {
        get {
            if(!this.HasProp("__OnVideoFrameArrived")){
                this.__OnVideoFrameArrived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{66d1378b-0e04-5801-8bdd-feb1081bbecb}"),
                    AppBroadcastStreamReader,
                    IInspectable
                )
                this.__OnVideoFrameArrivedToken := this.add_VideoFrameArrived(this.__OnVideoFrameArrived.iface)
            }
            return this.__OnVideoFrameArrived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAudioFrameArrivedToken")) {
            this.remove_AudioFrameArrived(this.__OnAudioFrameArrivedToken)
            this.__OnAudioFrameArrived.iface.Dispose()
        }

        if(this.HasProp("__OnVideoFrameArrivedToken")) {
            this.remove_VideoFrameArrived(this.__OnVideoFrameArrivedToken)
            this.__OnVideoFrameArrived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioChannels() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.get_AudioChannels()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioSampleRate() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.get_AudioSampleRate()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AudioAacSequence() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.get_AudioAacSequence()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioBitrate() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.get_AudioBitrate()
    }

    /**
     * Attempts to obtain an [AppBroadcastStreamAudioFrame](appbroadcaststreamaudioframe.md) object representing the latest audio frame from the broadcast stream.
     * @remarks
     * In order to avoid unnecessary copying of frame data, this method returns a reference to frame data stored in a circular buffer. After acquiring a frame, you should make a copy of frame data and release the buffer as quickly as possible.
     * @returns {AppBroadcastStreamAudioFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.trygetnextaudioframe
     */
    TryGetNextAudioFrame() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.TryGetNextAudioFrame()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoWidth() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.get_VideoWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoHeight() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.get_VideoHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VideoBitrate() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.get_VideoBitrate()
    }

    /**
     * Attempts to obtain an [AppBroadcastStreamVideoFrame](appbroadcaststreamvideoframe.md) object representing the latest video frame from the broadcast stream.
     * @remarks
     * In order to avoid unnecessary copying of frame data, this method returns a reference to frame data stored in a circular buffer. After acquiring a frame, you should make a copy of frame data and release the buffer as quickly as possible.
     * @returns {AppBroadcastStreamVideoFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcaststreamreader.trygetnextvideoframe
     */
    TryGetNextVideoFrame() {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.TryGetNextVideoFrame()
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastStreamReader, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_AudioFrameArrived(value) {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.add_AudioFrameArrived(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AudioFrameArrived(token) {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.remove_AudioFrameArrived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastStreamReader, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VideoFrameArrived(value) {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.add_VideoFrameArrived(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoFrameArrived(token) {
        if (!this.HasProp("__IAppBroadcastStreamReader")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastStreamReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastStreamReader := IAppBroadcastStreamReader(outPtr)
        }

        return this.__IAppBroadcastStreamReader.remove_VideoFrameArrived(token)
    }

;@endregion Instance Methods
}

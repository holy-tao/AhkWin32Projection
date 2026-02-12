#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSource.ahk
#Include .\IAdaptiveMediaSource2.ahk
#Include .\IAdaptiveMediaSource3.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IAdaptiveMediaSourceStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\AdaptiveMediaSource.ahk
#Include .\AdaptiveMediaSourceDownloadBitrateChangedEventArgs.ahk
#Include .\AdaptiveMediaSourcePlaybackBitrateChangedEventArgs.ahk
#Include .\AdaptiveMediaSourceDownloadRequestedEventArgs.ahk
#Include .\AdaptiveMediaSourceDownloadCompletedEventArgs.ahk
#Include .\AdaptiveMediaSourceDownloadFailedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the source of adaptive streaming content.
 * @remarks
 * Call one of the [CreateFromStreamAsync](adaptivemediasource_createfromstreamasync_337009516.md) or [CreateFromUriAsync](adaptivemediasource_createfromuriasync_832683104.md) methods to create a AdaptiveMediaSource object with a specific adaptive streaming manifest source.
 * 
 * For how-to guidance for using adaptive streaming in your app, see [Adaptive streaming](/windows/uwp/audio-video-camera/adaptive-streaming).
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Determines whether the content type of the source is supported.
     * @param {HSTRING} contentType A string that identifies the content type of the source. Can be a Http Live Streaming (HLS) or Dynamic Adaptive Streaming over HTTP (DASH) content type.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.iscontenttypesupported
     */
    static IsContentTypeSupported(contentType) {
        if (!AdaptiveMediaSource.HasProp("__IAdaptiveMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveMediaSourceStatics.IID)
            AdaptiveMediaSource.__IAdaptiveMediaSourceStatics := IAdaptiveMediaSourceStatics(factoryPtr)
        }

        return AdaptiveMediaSource.__IAdaptiveMediaSourceStatics.IsContentTypeSupported(contentType)
    }

    /**
     * Asynchronously creates a [AdaptiveMediaSource](adaptivemediasource.md) object from the Uniform Resource Identifier (URI) of the source.
     * @remarks
     * > [!NOTE]
     * > When called from a desktop app that doesn't have package identity (see [Features that require package identity](/windows/apps/desktop/modernize/modernize-packaged-apps)), this API doesn't support the `ms-appx` and `ms-resource` URI formats.
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the source.
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.createfromuriasync
     */
    static CreateFromUriAsync(uri_) {
        if (!AdaptiveMediaSource.HasProp("__IAdaptiveMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveMediaSourceStatics.IID)
            AdaptiveMediaSource.__IAdaptiveMediaSourceStatics := IAdaptiveMediaSourceStatics(factoryPtr)
        }

        return AdaptiveMediaSource.__IAdaptiveMediaSourceStatics.CreateFromUriAsync(uri_)
    }

    /**
     * Asynchronously creates a [AdaptiveMediaSource](adaptivemediasource.md) object from the Uniform Resource Identifier (URI) of the source.
     * @remarks
     * > [!NOTE]
     * > When called from a desktop app that doesn't have package identity (see [Features that require package identity](/windows/apps/desktop/modernize/modernize-packaged-apps)), this API doesn't support the `ms-appx` and `ms-resource` URI formats.
     * @param {Uri} uri_ T he Uniform Resource Identifier (URI) of the source.
     * @param {HttpClient} httpClient_ 
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.createfromuriasync
     */
    static CreateFromUriWithDownloaderAsync(uri_, httpClient_) {
        if (!AdaptiveMediaSource.HasProp("__IAdaptiveMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveMediaSourceStatics.IID)
            AdaptiveMediaSource.__IAdaptiveMediaSourceStatics := IAdaptiveMediaSourceStatics(factoryPtr)
        }

        return AdaptiveMediaSource.__IAdaptiveMediaSourceStatics.CreateFromUriWithDownloaderAsync(uri_, httpClient_)
    }

    /**
     * Asynchronously creates a [AdaptiveMediaSource](adaptivemediasource.md) object from the provided input stream.
     * @param {IInputStream} stream The input stream from which the [AdaptiveMediaSource](adaptivemediasource.md) is created.
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the source. This is used by the [AdaptiveMediaSource](adaptivemediasource.md) to resolve relative URIs.
     * @param {HSTRING} contentType A string that identifies the MIME content type of the source. This can be an Http Live Streaming (HLS) or a Dynamic Adaptive Streaming over HTTP (DASH) content type.
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.createfromstreamasync
     */
    static CreateFromStreamAsync(stream, uri_, contentType) {
        if (!AdaptiveMediaSource.HasProp("__IAdaptiveMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveMediaSourceStatics.IID)
            AdaptiveMediaSource.__IAdaptiveMediaSourceStatics := IAdaptiveMediaSourceStatics(factoryPtr)
        }

        return AdaptiveMediaSource.__IAdaptiveMediaSourceStatics.CreateFromStreamAsync(stream, uri_, contentType)
    }

    /**
     * Asynchronously creates a [AdaptiveMediaSource](adaptivemediasource.md) object from the provided input stream.
     * @param {IInputStream} stream The input stream from which the [AdaptiveMediaSource](adaptivemediasource.md) is created.
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the source. This is used by the [AdaptiveMediaSource](adaptivemediasource.md) to resolve relative URIs.
     * @param {HSTRING} contentType A string that identifies the MIME content type of the source. This can be an Http Live Streaming (HLS) or a Dynamic Adaptive Streaming over HTTP (DASH) content type.
     * @param {HttpClient} httpClient_ 
     * @returns {IAsyncOperation<AdaptiveMediaSourceCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.createfromstreamasync
     */
    static CreateFromStreamWithDownloaderAsync(stream, uri_, contentType, httpClient_) {
        if (!AdaptiveMediaSource.HasProp("__IAdaptiveMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Streaming.Adaptive.AdaptiveMediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdaptiveMediaSourceStatics.IID)
            AdaptiveMediaSource.__IAdaptiveMediaSourceStatics := IAdaptiveMediaSourceStatics(factoryPtr)
        }

        return AdaptiveMediaSource.__IAdaptiveMediaSourceStatics.CreateFromStreamWithDownloaderAsync(stream, uri_, contentType, httpClient_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the media source is live.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.islive
     * @type {Boolean} 
     */
    IsLive {
        get => this.get_IsLive()
    }

    /**
     * Gets or sets the desired offset of live playback from the end of the known media content that has been downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.desiredliveoffset
     * @type {TimeSpan} 
     */
    DesiredLiveOffset {
        get => this.get_DesiredLiveOffset()
        set => this.put_DesiredLiveOffset(value)
    }

    /**
     * Gets and sets the initial bit rate to use for playback of the media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.initialbitrate
     * @type {Integer} 
     */
    InitialBitrate {
        get => this.get_InitialBitrate()
        set => this.put_InitialBitrate(value)
    }

    /**
     * Gets a value indicating the current download bitrate for the media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.currentdownloadbitrate
     * @type {Integer} 
     */
    CurrentDownloadBitrate {
        get => this.get_CurrentDownloadBitrate()
    }

    /**
     * Gets a value indicating the current playback bitrate for the media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.currentplaybackbitrate
     * @type {Integer} 
     */
    CurrentPlaybackBitrate {
        get => this.get_CurrentPlaybackBitrate()
    }

    /**
     * Gets the available adaptive bit rates of the adaptive streaming manifest that is the source of the adaptive streaming object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.availablebitrates
     * @type {IVectorView<Integer>} 
     */
    AvailableBitrates {
        get => this.get_AvailableBitrates()
    }

    /**
     * Gets or sets the desired minimum bitrate for the media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.desiredminbitrate
     * @type {IReference<Integer>} 
     */
    DesiredMinBitrate {
        get => this.get_DesiredMinBitrate()
        set => this.put_DesiredMinBitrate(value)
    }

    /**
     * Gets or sets the desired maximum bitrate for the media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.desiredmaxbitrate
     * @type {IReference<Integer>} 
     */
    DesiredMaxBitrate {
        get => this.get_DesiredMaxBitrate()
        set => this.put_DesiredMaxBitrate(value)
    }

    /**
     * Gets a value indicating if the content streamed by the media source contains only audio.
     * @remarks
     * Check the value of this property to determine if the media content is audio-only and adjust your UI accordingly.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.audioonlyplayback
     * @type {Boolean} 
     */
    AudioOnlyPlayback {
        get => this.get_AudioOnlyPlayback()
    }

    /**
     * Gets a value indicating the inbound bits per second statistic over the time window specified by the [InboundBitsPerSecondWindow](adaptivemediasource_inboundbitspersecondwindow.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.inboundbitspersecond
     * @type {Integer} 
     */
    InboundBitsPerSecond {
        get => this.get_InboundBitsPerSecond()
    }

    /**
     * Gets or sets the time span over which the [InboundBitsPerSecond](adaptivemediasource_inboundbitspersecond.md) property is calculated.
     * @remarks
     * The default value for this property is a time span of 5 minutes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.inboundbitspersecondwindow
     * @type {TimeSpan} 
     */
    InboundBitsPerSecondWindow {
        get => this.get_InboundBitsPerSecondWindow()
        set => this.put_InboundBitsPerSecondWindow(value)
    }

    /**
     * Gets the advanced settings for the adaptive media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.advancedsettings
     * @type {AdaptiveMediaSourceAdvancedSettings} 
     */
    AdvancedSettings {
        get => this.get_AdvancedSettings()
    }

    /**
     * Gets the minimum offset of live playback from the end of the known media content that has been downloaded.
     * @remarks
     * This property specifies the minimum value to which the [DesiredLiveOffset](adaptivemediasource_desiredliveoffset.md) property can be set. This value is specified by the media content or platform.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.minliveoffset
     * @type {IReference<TimeSpan>} 
     */
    MinLiveOffset {
        get => this.get_MinLiveOffset()
    }

    /**
     * Gets the maximum time window within which the user can seek within the streaming media.
     * @remarks
     * This time window is calculated by taking the total duration of media that has been downloaded and subtracting the value of the [DesiredLiveOffset](adaptivemediasource_desiredliveoffset.md) property. This value is specified by the media content.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.maxseekablewindowsize
     * @type {IReference<TimeSpan>} 
     */
    MaxSeekableWindowSize {
        get => this.get_MaxSeekableWindowSize()
    }

    /**
     * Gets or sets the requested maximum size of the time window within which the user can seek within the streaming media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.desiredseekablewindowsize
     * @type {IReference<TimeSpan>} 
     */
    DesiredSeekableWindowSize {
        get => this.get_DesiredSeekableWindowSize()
        set => this.put_DesiredSeekableWindowSize(value)
    }

    /**
     * Gets an object that provides an event that is raised when diagnostic information about the adaptive media source is available.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.diagnostics
     * @type {AdaptiveMediaSourceDiagnostics} 
     */
    Diagnostics {
        get => this.get_Diagnostics()
    }

    /**
     * Occurs when the [CurrentDownloadBitrate](adaptivemediasource_currentdownloadbitrate.md) changes.
     * @type {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadBitrateChangedEventArgs>}
    */
    OnDownloadBitrateChanged {
        get {
            if(!this.HasProp("__OnDownloadBitrateChanged")){
                this.__OnDownloadBitrateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ad268caf-7da0-5ad4-8585-ceeb903dbd50}"),
                    AdaptiveMediaSource,
                    AdaptiveMediaSourceDownloadBitrateChangedEventArgs
                )
                this.__OnDownloadBitrateChangedToken := this.add_DownloadBitrateChanged(this.__OnDownloadBitrateChanged.iface)
            }
            return this.__OnDownloadBitrateChanged
        }
    }

    /**
     * Occurs when the [CurrentPlaybackBitrate](adaptivemediasource_currentplaybackbitrate.md) changes.
     * @type {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourcePlaybackBitrateChangedEventArgs>}
    */
    OnPlaybackBitrateChanged {
        get {
            if(!this.HasProp("__OnPlaybackBitrateChanged")){
                this.__OnPlaybackBitrateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{df4f4e89-6173-539b-94d8-69b7cb7578a7}"),
                    AdaptiveMediaSource,
                    AdaptiveMediaSourcePlaybackBitrateChangedEventArgs
                )
                this.__OnPlaybackBitrateChangedToken := this.add_PlaybackBitrateChanged(this.__OnPlaybackBitrateChanged.iface)
            }
            return this.__OnPlaybackBitrateChanged
        }
    }

    /**
     * Occurs when a resource download operation is requested.
     * @remarks
     * Handle this event to modify parameters of the resource download operation before the operation begins.
     * @type {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadRequestedEventArgs>}
    */
    OnDownloadRequested {
        get {
            if(!this.HasProp("__OnDownloadRequested")){
                this.__OnDownloadRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d3b7dbf1-fd8e-589e-9c7f-ba67397e50cd}"),
                    AdaptiveMediaSource,
                    AdaptiveMediaSourceDownloadRequestedEventArgs
                )
                this.__OnDownloadRequestedToken := this.add_DownloadRequested(this.__OnDownloadRequested.iface)
            }
            return this.__OnDownloadRequested
        }
    }

    /**
     * Occurs when a resource download operation completes
     * @type {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadCompletedEventArgs>}
    */
    OnDownloadCompleted {
        get {
            if(!this.HasProp("__OnDownloadCompleted")){
                this.__OnDownloadCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cef775dd-25b2-5588-8d51-dacdea660a7d}"),
                    AdaptiveMediaSource,
                    AdaptiveMediaSourceDownloadCompletedEventArgs
                )
                this.__OnDownloadCompletedToken := this.add_DownloadCompleted(this.__OnDownloadCompleted.iface)
            }
            return this.__OnDownloadCompleted
        }
    }

    /**
     * Occurs when a resource download operation fails.
     * @type {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadFailedEventArgs>}
    */
    OnDownloadFailed {
        get {
            if(!this.HasProp("__OnDownloadFailed")){
                this.__OnDownloadFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6ee5cc44-49ad-5138-ab47-f5c075a2bc34}"),
                    AdaptiveMediaSource,
                    AdaptiveMediaSourceDownloadFailedEventArgs
                )
                this.__OnDownloadFailedToken := this.add_DownloadFailed(this.__OnDownloadFailed.iface)
            }
            return this.__OnDownloadFailed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDownloadBitrateChangedToken")) {
            this.remove_DownloadBitrateChanged(this.__OnDownloadBitrateChangedToken)
            this.__OnDownloadBitrateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPlaybackBitrateChangedToken")) {
            this.remove_PlaybackBitrateChanged(this.__OnPlaybackBitrateChangedToken)
            this.__OnPlaybackBitrateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnDownloadRequestedToken")) {
            this.remove_DownloadRequested(this.__OnDownloadRequestedToken)
            this.__OnDownloadRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDownloadCompletedToken")) {
            this.remove_DownloadCompleted(this.__OnDownloadCompletedToken)
            this.__OnDownloadCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnDownloadFailedToken")) {
            this.remove_DownloadFailed(this.__OnDownloadFailedToken)
            this.__OnDownloadFailed.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLive() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_IsLive()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DesiredLiveOffset() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_DesiredLiveOffset()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DesiredLiveOffset(value) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.put_DesiredLiveOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialBitrate() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_InitialBitrate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InitialBitrate(value) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.put_InitialBitrate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentDownloadBitrate() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_CurrentDownloadBitrate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentPlaybackBitrate() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_CurrentPlaybackBitrate()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_AvailableBitrates() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_AvailableBitrates()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesiredMinBitrate() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_DesiredMinBitrate()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DesiredMinBitrate(value) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.put_DesiredMinBitrate(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesiredMaxBitrate() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_DesiredMaxBitrate()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_DesiredMaxBitrate(value) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.put_DesiredMaxBitrate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AudioOnlyPlayback() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_AudioOnlyPlayback()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InboundBitsPerSecond() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_InboundBitsPerSecond()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_InboundBitsPerSecondWindow() {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.get_InboundBitsPerSecondWindow()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_InboundBitsPerSecondWindow(value) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.put_InboundBitsPerSecondWindow(value)
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadBitrateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadBitrateChanged(handler) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.add_DownloadBitrateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadBitrateChanged(token) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.remove_DownloadBitrateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourcePlaybackBitrateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackBitrateChanged(handler) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.add_PlaybackBitrateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackBitrateChanged(token) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.remove_PlaybackBitrateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadRequested(handler) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.add_DownloadRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadRequested(token) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.remove_DownloadRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadCompleted(handler) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.add_DownloadCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadCompleted(token) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.remove_DownloadCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSource, AdaptiveMediaSourceDownloadFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadFailed(handler) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.add_DownloadFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadFailed(token) {
        if (!this.HasProp("__IAdaptiveMediaSource")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource := IAdaptiveMediaSource(outPtr)
        }

        return this.__IAdaptiveMediaSource.remove_DownloadFailed(token)
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceAdvancedSettings} 
     */
    get_AdvancedSettings() {
        if (!this.HasProp("__IAdaptiveMediaSource2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource2 := IAdaptiveMediaSource2(outPtr)
        }

        return this.__IAdaptiveMediaSource2.get_AdvancedSettings()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_MinLiveOffset() {
        if (!this.HasProp("__IAdaptiveMediaSource3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource3 := IAdaptiveMediaSource3(outPtr)
        }

        return this.__IAdaptiveMediaSource3.get_MinLiveOffset()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_MaxSeekableWindowSize() {
        if (!this.HasProp("__IAdaptiveMediaSource3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource3 := IAdaptiveMediaSource3(outPtr)
        }

        return this.__IAdaptiveMediaSource3.get_MaxSeekableWindowSize()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_DesiredSeekableWindowSize() {
        if (!this.HasProp("__IAdaptiveMediaSource3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource3 := IAdaptiveMediaSource3(outPtr)
        }

        return this.__IAdaptiveMediaSource3.get_DesiredSeekableWindowSize()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_DesiredSeekableWindowSize(value) {
        if (!this.HasProp("__IAdaptiveMediaSource3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource3 := IAdaptiveMediaSource3(outPtr)
        }

        return this.__IAdaptiveMediaSource3.put_DesiredSeekableWindowSize(value)
    }

    /**
     * 
     * @returns {AdaptiveMediaSourceDiagnostics} 
     */
    get_Diagnostics() {
        if (!this.HasProp("__IAdaptiveMediaSource3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource3 := IAdaptiveMediaSource3(outPtr)
        }

        return this.__IAdaptiveMediaSource3.get_Diagnostics()
    }

    /**
     * Gets an object that provides timing information that is correlated between timestamps in the media or date/time information from the manifest with the presentation clock timeline.
     * @returns {AdaptiveMediaSourceCorrelatedTimes} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.getcorrelatedtimes
     */
    GetCorrelatedTimes() {
        if (!this.HasProp("__IAdaptiveMediaSource3")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSource3 := IAdaptiveMediaSource3(outPtr)
        }

        return this.__IAdaptiveMediaSource3.GetCorrelatedTimes()
    }

    /**
     * Closes the adaptive media source and frees up associated resources.
     * @remarks
     * Call this method when you are done with the adaptive media source, such as when switching to a different media source, to ensure that the resources are cleaned up and that network operations for this adaptive media source are stopped.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasource.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}

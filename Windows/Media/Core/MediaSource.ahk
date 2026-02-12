#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaSource2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMediaSource3.ahk
#Include .\IMediaSource4.ahk
#Include .\IMediaSource5.ahk
#Include .\IMediaSourceStatics3.ahk
#Include .\IMediaSourceStatics.ahk
#Include .\IMediaSourceStatics4.ahk
#Include .\IMediaSourceStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaSource.ahk
#Include .\MediaSourceOpenOperationCompletedEventArgs.ahk
#Include .\MediaSourceStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a media source. Provides a common way to reference media from different sources and exposes a common model for accessing media data regardless of the underlying media format.
 * @remarks
 * Using one of the factory methods, you can create an instance of MediaSource from many different media source representations, including:
 * + [AdaptiveMediaSource](../windows.media.streaming.adaptive/adaptivemediasource.md)
 * + [MediaStreamSource](mediastreamsource.md)
 * + [MseStreamSource](msestreamsource.md)
 * + [IStorageFile](../windows.storage/istoragefile.md)
 * + [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md)
 * + [IRandomAccessStreamReference](../windows.storage.streams/irandomaccessstreamreference.md)
 * + [Uri](../windows.foundation/uri.md)
 * 
 * After getting a MediaSource instance, create a new [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) wrapping the media source and pass the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) to one of the media playback objects, such as [MediaPlayer](../windows.media.playback/mediaplayer.md) or [MediaElement](../windows.ui.xaml.controls/mediaelement.md).
 * 
 * For how-to guidance for using **MediaSource** to play back media, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaSource2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaSource2.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [AdaptiveMediaSource](../windows.media.streaming.adaptive/adaptivemediasource.md).
     * @remarks
     * For more information on using media frame sources, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
     * @param {MediaFrameSource} frameSource The [AdaptiveMediaSource](../windows.media.streaming.adaptive/adaptivemediasource.md) from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfrommediaframesource
     */
    static CreateFromMediaFrameSource(frameSource) {
        if (!MediaSource.HasProp("__IMediaSourceStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics3.IID)
            MediaSource.__IMediaSourceStatics3 := IMediaSourceStatics3(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics3.CreateFromMediaFrameSource(frameSource)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [AdaptiveMediaSource](../windows.media.streaming.adaptive/adaptivemediasource.md).
     * @param {AdaptiveMediaSource} mediaSource_ The [AdaptiveMediaSource](../windows.media.streaming.adaptive/adaptivemediasource.md) from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfromadaptivemediasource
     */
    static CreateFromAdaptiveMediaSource(mediaSource_) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromAdaptiveMediaSource(mediaSource_)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [MediaStreamSource](mediastreamsource.md).
     * @param {MediaStreamSource} mediaSource_ The [MediaStreamSource](mediastreamsource.md) from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfrommediastreamsource
     */
    static CreateFromMediaStreamSource(mediaSource_) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromMediaStreamSource(mediaSource_)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [MseStreamSource](msestreamsource.md).
     * @param {MseStreamSource} mediaSource_ The [MediaStreamSource](mediastreamsource.md) from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfrommsestreamsource
     */
    static CreateFromMseStreamSource(mediaSource_) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromMseStreamSource(mediaSource_)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [IMediaSource](imediasource.md).
     * @param {IMediaSource} mediaSource_ The [IMediaSource](imediasource.md) from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfromimediasource
     */
    static CreateFromIMediaSource(mediaSource_) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromIMediaSource(mediaSource_)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [IStorageFile](../windows.storage/istoragefile.md).
     * @param {IStorageFile} file_ The [IStorageFile](../windows.storage/istoragefile.md) from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfromstoragefile
     */
    static CreateFromStorageFile(file_) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromStorageFile(file_)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md).
     * @param {IRandomAccessStream} stream The stream from which the [MediaSource](mediasource.md) is created.
     * @param {HSTRING} contentType The MIME type of the contents of the stream.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfromstream
     */
    static CreateFromStream(stream, contentType) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromStream(stream, contentType)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [IRandomAccessStreamReference](../windows.storage.streams/irandomaccessstreamreference.md).
     * @param {IRandomAccessStreamReference} stream The stream reference from which the [MediaSource](mediasource.md) is created.
     * @param {HSTRING} contentType The MIME type of the contents of the stream.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfromstreamreference
     */
    static CreateFromStreamReference(stream, contentType) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromStreamReference(stream, contentType)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [Uri](../windows.foundation/uri.md).
     * @param {Uri} uri_ The URI from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfromuri
     */
    static CreateFromUri(uri_) {
        if (!MediaSource.HasProp("__IMediaSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics.IID)
            MediaSource.__IMediaSourceStatics := IMediaSourceStatics(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics.CreateFromUri(uri_)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md).
     * @remarks
     * Use the [BackgroundDownloader](../windows.networking.backgroundtransfer/backgrounddownloader.md) class to create a [DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md).
     * 
     * Use the [MediaSource.DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md) property to get a reference to the download operation set with this method from the **MediaSource**. 
     * 
     * You can use the [MediaBinder](mediabinder.md) class to defer associating the **DownloadOperation** with the **MediaSource** until the system preparing to play the item. For more information on late binding media content, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @param {DownloadOperation} downloadOperation_ The [DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md) from which the [MediaSource](mediasource.md) is created.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfromdownloadoperation
     */
    static CreateFromDownloadOperation(downloadOperation_) {
        if (!MediaSource.HasProp("__IMediaSourceStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics4.IID)
            MediaSource.__IMediaSourceStatics4 := IMediaSourceStatics4(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics4.CreateFromDownloadOperation(downloadOperation_)
    }

    /**
     * Creates an instance of [MediaSource](mediasource.md) from the provided [MediaBinder](mediabinder.md).
     * @param {MediaBinder} binder The [MediaBinder](mediabinder.md) with which the **MediaSource** is associated.
     * @returns {MediaSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.createfrommediabinder
     */
    static CreateFromMediaBinder(binder) {
        if (!MediaSource.HasProp("__IMediaSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceStatics2.IID)
            MediaSource.__IMediaSourceStatics2 := IMediaSourceStatics2(factoryPtr)
        }

        return MediaSource.__IMediaSourceStatics2.CreateFromMediaBinder(binder)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a set of properties that can be used to associate app-specific data with a [MediaSource](mediasource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.customproperties
     * @type {ValueSet} 
     */
    CustomProperties {
        get => this.get_CustomProperties()
    }

    /**
     * Gets the duration of the content in the [MediaSource](mediasource.md).
     * @remarks
     * Adaptive sources can support multiple periods or discontinuities that contribute to the overall presentation timeline. The **Duration** property represents this complete presentation timeline.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets a value indicating whether the media source is currently open.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.isopen
     * @type {Boolean} 
     */
    IsOpen {
        get => this.get_IsOpen()
    }

    /**
     * A collection of external timed text sources associated with the [MediaSource](mediasource.md).
     * @remarks
     * You can create a [TimedTextSource](timedtextsource.md) from a URL or stream and then set this property to populate the [ExternalTimedMetadataTracks](mediasource_externaltimedmetadatatracks.md) collection, or you can generate [TimedMetadataTrack](timedmetadatatrack.md) objects in code and add them to tthe [ExternalTimedMetadataTracks](mediasource_externaltimedmetadatatracks.md) collection directly.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.externaltimedtextsources
     * @type {IObservableVector<TimedTextSource>} 
     */
    ExternalTimedTextSources {
        get => this.get_ExternalTimedTextSources()
    }

    /**
     * A collection of external timed metadata tracks associated with the [MediaSource](mediasource.md).
     * @remarks
     * You can generate [TimedMetadataTrack](timedmetadatatrack.md) objects in code and add them to this collection directly, or you can create a [TimedTextSource](timedtextsource.md) from a URL or stream and use the [ExternalTimedTextSources](mediasource_externaltimedtextsources.md) property to populate the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.externaltimedmetadatatracks
     * @type {IObservableVector<TimedMetadataTrack>} 
     */
    ExternalTimedMetadataTracks {
        get => this.get_ExternalTimedMetadataTracks()
    }

    /**
     * Gets the current state of the [MediaSource](mediasource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the [AdaptiveMediaSource](../windows.media.streaming.adaptive/adaptivemediasource.md) associated with the **MediaSource**.
     * @remarks
     * If the **MediaSource** does not have an associated **AdaptiveMediaSource**, this property value is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.adaptivemediasource
     * @type {AdaptiveMediaSource} 
     */
    AdaptiveMediaSource {
        get => this.get_AdaptiveMediaSource()
    }

    /**
     * Gets the [MediaStreamSource](mediastreamsource.md) associated with the **MediaSource**.
     * @remarks
     * If the **MediaSource** does not have an associated **MediaStreamSource**, this property value is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.mediastreamsource
     * @type {MediaStreamSource} 
     */
    MediaStreamSource {
        get => this.get_MediaStreamSource()
    }

    /**
     * Gets the [MseStreamSource](msestreamsource.md) associated with the **MediaSource**.
     * @remarks
     * If the **MediaSource** does not have an associated **MseStreamSource**, this property value is null.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.msestreamsource
     * @type {MseStreamSource} 
     */
    MseStreamSource {
        get => this.get_MseStreamSource()
    }

    /**
     * Gets the URI associated with the **MediaSource**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Retrieves the [DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md) with which the **MediaSource** is associated
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.downloadoperation
     * @type {DownloadOperation} 
     */
    DownloadOperation {
        get => this.get_DownloadOperation()
    }

    /**
     * Occurs when a [MediaSource](mediasource.md) open operation completes.
     * @type {TypedEventHandler<MediaSource, MediaSourceOpenOperationCompletedEventArgs>}
    */
    OnOpenOperationCompleted {
        get {
            if(!this.HasProp("__OnOpenOperationCompleted")){
                this.__OnOpenOperationCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{425d53e3-fba6-5ea3-b713-db4d70787436}"),
                    MediaSource,
                    MediaSourceOpenOperationCompletedEventArgs
                )
                this.__OnOpenOperationCompletedToken := this.add_OpenOperationCompleted(this.__OnOpenOperationCompleted.iface)
            }
            return this.__OnOpenOperationCompleted
        }
    }

    /**
     * Occurs when the current state of the [MediaSource](mediasource.md) changes.
     * @type {TypedEventHandler<MediaSource, MediaSourceStateChangedEventArgs>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2274d3a6-1ba0-5230-bb86-de90058b6403}"),
                    MediaSource,
                    MediaSourceStateChangedEventArgs
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOpenOperationCompletedToken")) {
            this.remove_OpenOperationCompleted(this.__OnOpenOperationCompletedToken)
            this.__OnOpenOperationCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaSource, MediaSourceOpenOperationCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OpenOperationCompleted(handler) {
        if (!this.HasProp("__IMediaSource2")) {
            if ((queryResult := this.QueryInterface(IMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource2 := IMediaSource2(outPtr)
        }

        return this.__IMediaSource2.add_OpenOperationCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OpenOperationCompleted(token) {
        if (!this.HasProp("__IMediaSource2")) {
            if ((queryResult := this.QueryInterface(IMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource2 := IMediaSource2(outPtr)
        }

        return this.__IMediaSource2.remove_OpenOperationCompleted(token)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_CustomProperties() {
        if (!this.HasProp("__IMediaSource2")) {
            if ((queryResult := this.QueryInterface(IMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource2 := IMediaSource2(outPtr)
        }

        return this.__IMediaSource2.get_CustomProperties()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaSource2")) {
            if ((queryResult := this.QueryInterface(IMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource2 := IMediaSource2(outPtr)
        }

        return this.__IMediaSource2.get_Duration()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOpen() {
        if (!this.HasProp("__IMediaSource2")) {
            if ((queryResult := this.QueryInterface(IMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource2 := IMediaSource2(outPtr)
        }

        return this.__IMediaSource2.get_IsOpen()
    }

    /**
     * 
     * @returns {IObservableVector<TimedTextSource>} 
     */
    get_ExternalTimedTextSources() {
        if (!this.HasProp("__IMediaSource2")) {
            if ((queryResult := this.QueryInterface(IMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource2 := IMediaSource2(outPtr)
        }

        return this.__IMediaSource2.get_ExternalTimedTextSources()
    }

    /**
     * 
     * @returns {IObservableVector<TimedMetadataTrack>} 
     */
    get_ExternalTimedMetadataTracks() {
        if (!this.HasProp("__IMediaSource2")) {
            if ((queryResult := this.QueryInterface(IMediaSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource2 := IMediaSource2(outPtr)
        }

        return this.__IMediaSource2.get_ExternalTimedMetadataTracks()
    }

    /**
     * Closes the [MediaSource](mediasource.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaSource, MediaSourceStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IMediaSource3")) {
            if ((queryResult := this.QueryInterface(IMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource3 := IMediaSource3(outPtr)
        }

        return this.__IMediaSource3.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IMediaSource3")) {
            if ((queryResult := this.QueryInterface(IMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource3 := IMediaSource3(outPtr)
        }

        return this.__IMediaSource3.remove_StateChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IMediaSource3")) {
            if ((queryResult := this.QueryInterface(IMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource3 := IMediaSource3(outPtr)
        }

        return this.__IMediaSource3.get_State()
    }

    /**
     * Resets the internal state of the [MediaSource](mediasource.md).
     * @remarks
     * After **Reset** is called, the **MediaSource** will be reopened the next time it is used.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.reset
     */
    Reset() {
        if (!this.HasProp("__IMediaSource3")) {
            if ((queryResult := this.QueryInterface(IMediaSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource3 := IMediaSource3(outPtr)
        }

        return this.__IMediaSource3.Reset()
    }

    /**
     * 
     * @returns {AdaptiveMediaSource} 
     */
    get_AdaptiveMediaSource() {
        if (!this.HasProp("__IMediaSource4")) {
            if ((queryResult := this.QueryInterface(IMediaSource4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource4 := IMediaSource4(outPtr)
        }

        return this.__IMediaSource4.get_AdaptiveMediaSource()
    }

    /**
     * 
     * @returns {MediaStreamSource} 
     */
    get_MediaStreamSource() {
        if (!this.HasProp("__IMediaSource4")) {
            if ((queryResult := this.QueryInterface(IMediaSource4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource4 := IMediaSource4(outPtr)
        }

        return this.__IMediaSource4.get_MediaStreamSource()
    }

    /**
     * 
     * @returns {MseStreamSource} 
     */
    get_MseStreamSource() {
        if (!this.HasProp("__IMediaSource4")) {
            if ((queryResult := this.QueryInterface(IMediaSource4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource4 := IMediaSource4(outPtr)
        }

        return this.__IMediaSource4.get_MseStreamSource()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IMediaSource4")) {
            if ((queryResult := this.QueryInterface(IMediaSource4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource4 := IMediaSource4(outPtr)
        }

        return this.__IMediaSource4.get_Uri()
    }

    /**
     * opens the backing data source for the **MediaSource** and reads the metadata and track information.
     * @remarks
     * This method can be called to preload the associated media for performance reasons or to verify that the media loads successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasource.openasync
     */
    OpenAsync() {
        if (!this.HasProp("__IMediaSource4")) {
            if ((queryResult := this.QueryInterface(IMediaSource4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource4 := IMediaSource4(outPtr)
        }

        return this.__IMediaSource4.OpenAsync()
    }

    /**
     * 
     * @returns {DownloadOperation} 
     */
    get_DownloadOperation() {
        if (!this.HasProp("__IMediaSource5")) {
            if ((queryResult := this.QueryInterface(IMediaSource5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSource5 := IMediaSource5(outPtr)
        }

        return this.__IMediaSource5.get_DownloadOperation()
    }

;@endregion Instance Methods
}

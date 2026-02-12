#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBindingEventArgs.ahk
#Include .\IMediaBindingEventArgs2.ahk
#Include .\IMediaBindingEventArgs3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaBindingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides data for the [Binding](mediabinder_binding.md) event and methods for binding media content to the associated [MediaSource](mediasource.md).
 * @remarks
 * Get an instance of this class by handling the [Binding](mediabinder_binding.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaBindingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBindingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBindingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaBinder](mediabinder.md) associated with the binding event.
     * @remarks
     * Use the [Token](mediabinder_token.md) property of the **MediaBinder** to determine what media content should be bound.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.mediabinder
     * @type {MediaBinder} 
     */
    MediaBinder {
        get => this.get_MediaBinder()
    }

    /**
     * Occurs when the binding operation is cancelled.
     * @type {TypedEventHandler<MediaBindingEventArgs, IInspectable>}
    */
    OnCanceled {
        get {
            if(!this.HasProp("__OnCanceled")){
                this.__OnCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f3b10e2-b2e9-55c6-abb3-4a258072ebb9}"),
                    MediaBindingEventArgs,
                    IInspectable
                )
                this.__OnCanceledToken := this.add_Canceled(this.__OnCanceled.iface)
            }
            return this.__OnCanceled
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCanceledToken")) {
            this.remove_Canceled(this.__OnCanceledToken)
            this.__OnCanceled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBindingEventArgs, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Canceled(handler) {
        if (!this.HasProp("__IMediaBindingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs := IMediaBindingEventArgs(outPtr)
        }

        return this.__IMediaBindingEventArgs.add_Canceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Canceled(token) {
        if (!this.HasProp("__IMediaBindingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs := IMediaBindingEventArgs(outPtr)
        }

        return this.__IMediaBindingEventArgs.remove_Canceled(token)
    }

    /**
     * 
     * @returns {MediaBinder} 
     */
    get_MediaBinder() {
        if (!this.HasProp("__IMediaBindingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs := IMediaBindingEventArgs(outPtr)
        }

        return this.__IMediaBindingEventArgs.get_MediaBinder()
    }

    /**
     * Informs the system that the app might continue to perform work after the [Binding](mediabinder_binding.md) event handler returns.
     * @remarks
     * Since retrieving and binding the media content may take a significant amount of time, this should typically be performed asynchronously. Requesting a deferral lets the system know that your app is continuing to perform asynchronous work after the [Binding](mediabinder_binding.md) event handler has returned. Call the [Complete](../windows.foundation/deferral_complete_1807836922.md) method when your binding operation is finished.
     * 
     * Subscribe to the [Canceled](mediabindingeventargs_canceled.md) event to be alerted by the system if the binding operation should be canceled.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaBindingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs := IMediaBindingEventArgs(outPtr)
        }

        return this.__IMediaBindingEventArgs.GetDeferral()
    }

    /**
     * Sets the URI of the media content to be bound to the [MediaSource](mediasource.md).
     * @param {Uri} uri_ The URI of the media content to be bound.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.seturi
     */
    SetUri(uri_) {
        if (!this.HasProp("__IMediaBindingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs := IMediaBindingEventArgs(outPtr)
        }

        return this.__IMediaBindingEventArgs.SetUri(uri_)
    }

    /**
     * Sets the media content to be bound to the [MediaSource](mediasource.md).
     * @param {IRandomAccessStream} stream A stream containing the media content.
     * @param {HSTRING} contentType A string specifying the content type of the media content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.setstream
     */
    SetStream(stream, contentType) {
        if (!this.HasProp("__IMediaBindingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs := IMediaBindingEventArgs(outPtr)
        }

        return this.__IMediaBindingEventArgs.SetStream(stream, contentType)
    }

    /**
     * Binds a media content stream reference to the [MediaSource](mediasource.md) associated with the event.
     * @param {IRandomAccessStreamReference} stream A stream reference containing the media content to be bound.
     * @param {HSTRING} contentType A string specifying the content type of the media content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.setstreamreference
     */
    SetStreamReference(stream, contentType) {
        if (!this.HasProp("__IMediaBindingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs := IMediaBindingEventArgs(outPtr)
        }

        return this.__IMediaBindingEventArgs.SetStreamReference(stream, contentType)
    }

    /**
     * Binds an adaptive media source to the [MediaSource](mediasource.md) associated with the event.
     * @param {AdaptiveMediaSource} mediaSource_ The [AdaptiveMediaSource](../windows.media.streaming.adaptive/adaptivemediasource.md) representing the media content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.setadaptivemediasource
     */
    SetAdaptiveMediaSource(mediaSource_) {
        if (!this.HasProp("__IMediaBindingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs2 := IMediaBindingEventArgs2(outPtr)
        }

        return this.__IMediaBindingEventArgs2.SetAdaptiveMediaSource(mediaSource_)
    }

    /**
     * Binds a storage file to the [MediaSource](mediasource.md) associated with the event.
     * @param {IStorageFile} file_ The [StorageFile](../windows.storage/storagefile.md) containing media content.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.setstoragefile
     */
    SetStorageFile(file_) {
        if (!this.HasProp("__IMediaBindingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs2 := IMediaBindingEventArgs2(outPtr)
        }

        return this.__IMediaBindingEventArgs2.SetStorageFile(file_)
    }

    /**
     * Binds a [DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md) to the [MediaSource](mediasource.md) associated with the event.
     * @remarks
     * Use the [BackgroundDownloader](../windows.networking.backgroundtransfer/backgrounddownloader.md) class to create a [DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md).
     * 
     * You can create a **MediaSource** directly from a **DownloadOperation**, without using media binding by calling [CreateFromDownloadOperation](mediasource_createfromdownloadoperation_1781039899.md).
     * 
     * Use the [MediaSource.DownloadOperation](../windows.networking.backgroundtransfer/downloadoperation.md) property to get a reference to the download operation set with this method from the **MediaSource**.
     * @param {DownloadOperation} downloadOperation_ The **DownloadOperation** to bind to the **MediaSource**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediabindingeventargs.setdownloadoperation
     */
    SetDownloadOperation(downloadOperation_) {
        if (!this.HasProp("__IMediaBindingEventArgs3")) {
            if ((queryResult := this.QueryInterface(IMediaBindingEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBindingEventArgs3 := IMediaBindingEventArgs3(outPtr)
        }

        return this.__IMediaBindingEventArgs3.SetDownloadOperation(downloadOperation_)
    }

;@endregion Instance Methods
}

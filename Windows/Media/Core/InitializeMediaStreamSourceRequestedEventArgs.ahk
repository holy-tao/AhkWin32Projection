#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInitializeMediaStreamSourceRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [InitializeMediaStreamSourceRequested](/uwp/api/windows.media.core.mediasourceappserviceconnection.InitializeMediaStreamSourceRequested) event.
 * @remarks
 * Get an instance of this class by registering a handler for the [InitializeMediaStreamSourceRequested](/uwp/api/windows.media.core.mediasourceappserviceconnection.InitializeMediaStreamSourceRequested) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.initializemediastreamsourcerequestedeventargs
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class InitializeMediaStreamSourceRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInitializeMediaStreamSourceRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInitializeMediaStreamSourceRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the uninitialized [MediaStreamSource](/uwp/api/windows.media.core.mediastreamsource) object that the app service should initialize and use to provide samples to the requesting app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.initializemediastreamsourcerequestedeventargs.source
     * @type {MediaStreamSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets the [IRandomAccessStream](/uwp/api/windows.storage.streams.irandomaccessstream) associated with the media stream source request.
     * @remarks
     * The app service should parse the **IRandomAccessStream** to create an [IMediaStreamDescriptor](/uwp/api/windows.media.core.imediastreamdescriptor). If the requested stream format is supported, then the app service can initialize the [MediaStreamSource](/uwp/api/windows.media.core.mediastreamsource) provided in the event args and begin providing samples.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.initializemediastreamsourcerequestedeventargs.randomaccessstream
     * @type {IRandomAccessStream} 
     */
    RandomAccessStream {
        get => this.get_RandomAccessStream()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaStreamSource} 
     */
    get_Source() {
        if (!this.HasProp("__IInitializeMediaStreamSourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInitializeMediaStreamSourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInitializeMediaStreamSourceRequestedEventArgs := IInitializeMediaStreamSourceRequestedEventArgs(outPtr)
        }

        return this.__IInitializeMediaStreamSourceRequestedEventArgs.get_Source()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_RandomAccessStream() {
        if (!this.HasProp("__IInitializeMediaStreamSourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInitializeMediaStreamSourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInitializeMediaStreamSourceRequestedEventArgs := IInitializeMediaStreamSourceRequestedEventArgs(outPtr)
        }

        return this.__IInitializeMediaStreamSourceRequestedEventArgs.get_RandomAccessStream()
    }

    /**
     * Gets a [Deferral](/uwp/api/windows.foundation.deferral) object that instructs the system to wait for the app service to complete media source stream initialization before continuing processing the request.
     * @remarks
     * You must request a deferral if your stream source initialization perfoms any asynchronous actions. Call [Complete](/uwp/api/windows.foundation.deferral.Complete) when intitialization is complete to notify the system to continue processing the request.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.initializemediastreamsourcerequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IInitializeMediaStreamSourceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInitializeMediaStreamSourceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInitializeMediaStreamSourceRequestedEventArgs := IInitializeMediaStreamSourceRequestedEventArgs(outPtr)
        }

        return this.__IInitializeMediaStreamSourceRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}

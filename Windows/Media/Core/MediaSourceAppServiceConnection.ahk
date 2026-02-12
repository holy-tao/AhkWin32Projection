#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaSourceAppServiceConnection.ahk
#Include .\IMediaSourceAppServiceConnectionFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaSourceAppServiceConnection.ahk
#Include .\InitializeMediaStreamSourceRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables the implementation of an app service that provides a custom media source that can be consumed by UWP apps.
 * @remarks
 * This feature must be implemented in a background task. When the background task is launched and the [Run](/uwp/api/Windows.ApplicationModel.Background.IBackgroundTask#Windows_ApplicationModel_Background_IBackgroundTask_Run_Windows_ApplicationModel_Background_IBackgroundTaskInstance_), the app should create a new instance of this class, register a handler for the [InitializeMediaStreamSourceRequested](/uwp/api/windows.media.core.mediasourceappserviceconnection.InitializeMediaStreamSourceRequested) event, and call [Start](/uwp/api/windows.media.core.mediasourceappserviceconnection.Start) to notify the system that the app service is ready to handle stream source requests.
 * 
 * The system passes an [IRandomAccessStream](/uwp/api/windows.storage.streams.irandomaccessstream) and an a uninitialized [MediaStreamSource](/uwp/api/windows.media.core.mediastreamsource) object into the **InitializeMediaStreamSourceRequested** event handler. The app service should parse the **IRandomAccessStream** to create an [IMediaStreamDescriptor](/uwp/api/windows.media.core.imediastreamdescriptor). If the requested stream format is supported, then the app service can initialize the **MediaStreamSource** and begin providing samples.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourceappserviceconnection
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaSourceAppServiceConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaSourceAppServiceConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaSourceAppServiceConnection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the **MediaSourceAppServiceConnection** class.
     * @remarks
     * Get an instance of the **AppServiceConnection** class by casting the [TriggerDetails](/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance.TriggerDetails) property of the [IBackgroundTaskInstance](/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance) object passed into the background task's [Run](/uwp/api/Windows.ApplicationModel.Background.IBackgroundTask#Windows_ApplicationModel_Background_IBackgroundTask_Run_Windows_ApplicationModel_Background_IBackgroundTaskInstance_) method to an [AppServiceTriggerDetails](/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails) object and then accessing the [AppServiceConnection](/uwp/api/windows.applicationmodel.appservice.appservicetriggerdetails.AppServiceConnection) property.
     * @param {AppServiceConnection} appServiceConnection_ An [AppServiceConnection](/uwp/api/windows.applicationmodel.appservice.appserviceconnection) object representing the connection to the endpoint for an app service.
     * @returns {MediaSourceAppServiceConnection} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourceappserviceconnection.#ctor
     */
    static Create(appServiceConnection_) {
        if (!MediaSourceAppServiceConnection.HasProp("__IMediaSourceAppServiceConnectionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaSourceAppServiceConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaSourceAppServiceConnectionFactory.IID)
            MediaSourceAppServiceConnection.__IMediaSourceAppServiceConnectionFactory := IMediaSourceAppServiceConnectionFactory(factoryPtr)
        }

        return MediaSourceAppServiceConnection.__IMediaSourceAppServiceConnectionFactory.Create(appServiceConnection_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInitializeMediaStreamSourceRequestedToken")) {
            this.remove_InitializeMediaStreamSourceRequested(this.__OnInitializeMediaStreamSourceRequestedToken)
            this.__OnInitializeMediaStreamSourceRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaSourceAppServiceConnection, InitializeMediaStreamSourceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InitializeMediaStreamSourceRequested(handler) {
        if (!this.HasProp("__IMediaSourceAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IMediaSourceAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSourceAppServiceConnection := IMediaSourceAppServiceConnection(outPtr)
        }

        return this.__IMediaSourceAppServiceConnection.add_InitializeMediaStreamSourceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InitializeMediaStreamSourceRequested(token) {
        if (!this.HasProp("__IMediaSourceAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IMediaSourceAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSourceAppServiceConnection := IMediaSourceAppServiceConnection(outPtr)
        }

        return this.__IMediaSourceAppServiceConnection.remove_InitializeMediaStreamSourceRequested(token)
    }

    /**
     * Notifies the system that the app service is ready to receive media stream source requests.
     * @remarks
     * Register for the [InitializeMediaStreamSourceRequested](/uwp/api/windows.media.core.mediasourceappserviceconnection.InitializeMediaStreamSourceRequested) event handler before calling **Start**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediasourceappserviceconnection.start
     */
    Start() {
        if (!this.HasProp("__IMediaSourceAppServiceConnection")) {
            if ((queryResult := this.QueryInterface(IMediaSourceAppServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaSourceAppServiceConnection := IMediaSourceAppServiceConnection(outPtr)
        }

        return this.__IMediaSourceAppServiceConnection.Start()
    }

;@endregion Instance Methods
}

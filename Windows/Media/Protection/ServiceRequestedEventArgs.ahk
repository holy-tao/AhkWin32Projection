#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IServiceRequestedEventArgs.ahk
#Include .\IServiceRequestedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for a [MediaProtectionManager](mediaprotectionmanager_mediaprotectionmanager_1221375020.md) object when a service is requested.
 * @remarks
 * This object is not instantiated directly. It is created by the [MediaProtectionManager.ServiceRequested](mediaprotectionmanager_servicerequested.md) event and is returned as an argument to the [ServiceRequestedEventHandler](servicerequestedeventhandler.md) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.servicerequestedeventargs
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class ServiceRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IServiceRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IServiceRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Contains the service request.
     * @remarks
     * This object will probably implement other properties and methods which are specific to the content protection system being used. In order to successfully process the request, these properties and methods must be understood and acted upon by the application.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.servicerequestedeventargs.request
     * @type {IMediaProtectionServiceRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * Returns an indication of the completion of the service request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.servicerequestedeventargs.completion
     * @type {MediaProtectionServiceCompletion} 
     */
    Completion {
        get => this.get_Completion()
    }

    /**
     * Gets the [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md) associated with the service request.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.servicerequestedeventargs.mediaplaybackitem
     * @type {MediaPlaybackItem} 
     */
    MediaPlaybackItem {
        get => this.get_MediaPlaybackItem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMediaProtectionServiceRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IServiceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IServiceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServiceRequestedEventArgs := IServiceRequestedEventArgs(outPtr)
        }

        return this.__IServiceRequestedEventArgs.get_Request()
    }

    /**
     * 
     * @returns {MediaProtectionServiceCompletion} 
     */
    get_Completion() {
        if (!this.HasProp("__IServiceRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IServiceRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServiceRequestedEventArgs := IServiceRequestedEventArgs(outPtr)
        }

        return this.__IServiceRequestedEventArgs.get_Completion()
    }

    /**
     * 
     * @returns {MediaPlaybackItem} 
     */
    get_MediaPlaybackItem() {
        if (!this.HasProp("__IServiceRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IServiceRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServiceRequestedEventArgs2 := IServiceRequestedEventArgs2(outPtr)
        }

        return this.__IServiceRequestedEventArgs2.get_MediaPlaybackItem()
    }

;@endregion Instance Methods
}

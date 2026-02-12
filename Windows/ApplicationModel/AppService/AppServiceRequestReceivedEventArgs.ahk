#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceRequestReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppServiceConnection.RequestReceived](appserviceconnection_requestreceived.md) event that occurs when a message arrives from the other endpoint of the app service connection. App services enable app-to-app communication by allowing you to provide services from your Universal Windows app to other Universal Windows app.
 * @remarks
 * An instance of this class is passed to the event handler that you implement for the [AppServiceConnection.RequestReceived](appserviceconnection_requestreceived.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicerequestreceivedeventargs
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceRequestReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppServiceRequestReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppServiceRequestReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the request that was received from the app service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicerequestreceivedeventargs.request
     * @type {AppServiceRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppServiceRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IAppServiceRequestReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppServiceRequestReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceRequestReceivedEventArgs := IAppServiceRequestReceivedEventArgs(outPtr)
        }

        return this.__IAppServiceRequestReceivedEventArgs.get_Request()
    }

    /**
     * Informs the system that the event handler might continue to perform work after the event handler returns.
     * @returns {AppServiceDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicerequestreceivedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IAppServiceRequestReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppServiceRequestReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceRequestReceivedEventArgs := IAppServiceRequestReceivedEventArgs(outPtr)
        }

        return this.__IAppServiceRequestReceivedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}

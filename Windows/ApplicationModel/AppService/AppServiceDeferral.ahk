#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables the background task for an app service to get a deferral so that the app service can respond to subsequent requests. App service providers enable app-to-app communication by providing services that other Universal Windows app can consume.
 * @remarks
 * Use [AppServiceRequestReceivedEventArgs.GetDeferral](appservicerequestreceivedeventargs_getdeferral_254836512.md) to get this deferral.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicedeferral
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppServiceDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppServiceDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates that the content for an asynchronous handler for the [AppServiceConnection.RequestReceived](appserviceconnection_requestreceived.md) event is ready, or that an error occurred.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicedeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IAppServiceDeferral")) {
            if ((queryResult := this.QueryInterface(IAppServiceDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceDeferral := IAppServiceDeferral(outPtr)
        }

        return this.__IAppServiceDeferral.Complete()
    }

;@endregion Instance Methods
}

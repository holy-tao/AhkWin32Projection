#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppServiceConnection.ServiceClosed](appserviceconnection_serviceclosed.md) event that occurs when the other endpoint closes connection to the app service. App services enable app-to-app communication by allowing you to provide services from your Universal Windows app to other Universal Windows app.
 * @remarks
 * An instance of this class is passed to the event handler that you implement for the [AppServiceConnection.ServiceClosed](appserviceconnection_serviceclosed.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceclosedeventargs
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceClosedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppServiceClosedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppServiceClosedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status that was set when the endpoint for the app service was closed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceclosedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAppServiceClosedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppServiceClosedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceClosedEventArgs := IAppServiceClosedEventArgs(outPtr)
        }

        return this.__IAppServiceClosedEventArgs.get_Status()
    }

;@endregion Instance Methods
}

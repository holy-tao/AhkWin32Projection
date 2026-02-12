#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a message that the endpoint for one app service sends to another app service. App services enable app-to-app communication by allowing you to provide services from your Universal Windows app to other Universal Windows app.
 * @remarks
 * To get an AppServiceRequest, use the [AppServiceRequestReceivedEventArgs.Request](appservicerequestreceivedeventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicerequest
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppServiceRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppServiceRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the message that request from the app service contains.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicerequest.message
     * @type {ValueSet} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Message() {
        if (!this.HasProp("__IAppServiceRequest")) {
            if ((queryResult := this.QueryInterface(IAppServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceRequest := IAppServiceRequest(outPtr)
        }

        return this.__IAppServiceRequest.get_Message()
    }

    /**
     * Sends a response to a received request.
     * @remarks
     * Calling [AppServiceRequest](appservicerequest.md) is optional. An endpoint for an app service does not have to return a response to a request.
     * @param {ValueSet} message The message that you want to include in the response.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appservicerequest.sendresponseasync
     */
    SendResponseAsync(message) {
        if (!this.HasProp("__IAppServiceRequest")) {
            if ((queryResult := this.QueryInterface(IAppServiceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceRequest := IAppServiceRequest(outPtr)
        }

        return this.__IAppServiceRequest.SendResponseAsync(message)
    }

;@endregion Instance Methods
}

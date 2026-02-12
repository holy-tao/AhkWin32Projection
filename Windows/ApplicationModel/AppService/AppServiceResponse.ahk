#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppServiceResponse.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the message that the app service sent in response to a request. App services enable app-to-app communication by allowing you to provide services from your Universal Windows app to other Universal Windows app.
 * @remarks
 * In JavaScript, an instance of this class is passed to the event handler that you implement for the operation that the [AppServiceConnection.SendMessageAsync](appserviceconnection_sendmessageasync_1777128850.md) method returns.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceresponse
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class AppServiceResponse extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppServiceResponse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppServiceResponse.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the message that the response from the app service contains.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceresponse.message
     * @type {ValueSet} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * Gets the status for the response from the app service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.appserviceresponse.status
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
     * @returns {ValueSet} 
     */
    get_Message() {
        if (!this.HasProp("__IAppServiceResponse")) {
            if ((queryResult := this.QueryInterface(IAppServiceResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceResponse := IAppServiceResponse(outPtr)
        }

        return this.__IAppServiceResponse.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IAppServiceResponse")) {
            if ((queryResult := this.QueryInterface(IAppServiceResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppServiceResponse := IAppServiceResponse(outPtr)
        }

        return this.__IAppServiceResponse.get_Status()
    }

;@endregion Instance Methods
}

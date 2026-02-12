#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStatelessAppServiceResponse.ahk
#Include ..\..\..\Guid.ahk

/**
 * The response to an SendStatelessMessageAsync call, containing the response message and connection status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.statelessappserviceresponse
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class StatelessAppServiceResponse extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStatelessAppServiceResponse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStatelessAppServiceResponse.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The response to the the SendStatelessMessageAsync operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.statelessappserviceresponse.message
     * @type {ValueSet} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * The response status.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appservice.statelessappserviceresponse.status
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
        if (!this.HasProp("__IStatelessAppServiceResponse")) {
            if ((queryResult := this.QueryInterface(IStatelessAppServiceResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStatelessAppServiceResponse := IStatelessAppServiceResponse(outPtr)
        }

        return this.__IStatelessAppServiceResponse.get_Message()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStatelessAppServiceResponse")) {
            if ((queryResult := this.QueryInterface(IStatelessAppServiceResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStatelessAppServiceResponse := IStatelessAppServiceResponse(outPtr)
        }

        return this.__IStatelessAppServiceResponse.get_Status()
    }

;@endregion Instance Methods
}

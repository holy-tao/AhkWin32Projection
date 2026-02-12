#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceServiceCommandResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the result of a mobile broadband device service command.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * A MobileBroadbandDeviceServiceCommandResult instance is created when the [SendQueryCommandAsync](mobilebroadbanddeviceservicecommandsession_sendquerycommandasync_1203981658.md) or [SendSetCommandAsync](mobilebroadbanddeviceservicecommandsession_sendsetcommandasync_422276589.md) method is called on the [MobileBroadbandDeviceServiceCommandSession](mobilebroadbanddeviceservicecommandsession.md) and the result of the command has been received.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandresult
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceServiceCommandResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceServiceCommandResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceServiceCommandResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status code of the command execution on a mobile broadband device service.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandresult.statuscode
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * Gets the response data from the command execution on a mobile broadband device service.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandresult.responsedata
     * @type {IBuffer} 
     */
    ResponseData {
        get => this.get_ResponseData()
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
    get_StatusCode() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandResult := IMobileBroadbandDeviceServiceCommandResult(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandResult.get_StatusCode()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ResponseData() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandResult")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandResult := IMobileBroadbandDeviceServiceCommandResult(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandResult.get_ResponseData()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceServiceCommandSession.ahk
#Include .\IMobileBroadbandDeviceServiceCommandSession2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MobileBroadbandDeviceServiceCommandSession.ahk
#Include .\MobileBroadbandDeviceServiceCommandEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a device service command session which allows the caller to submit predefined commands to the modem on a mobile broadband device service.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * A MobileBroadbandDeviceServiceCommandSession instance is returned when the [OpenCommandSession](mobilebroadbanddeviceservice_opencommandsession_1948323689.md) method is called on the [MobileBroadbandDeviceService](mobilebroadbanddeviceservice.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandsession
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceServiceCommandSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceServiceCommandSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceServiceCommandSession.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCommandReceivedToken")) {
            this.remove_CommandReceived(this.__OnCommandReceivedToken)
            this.__OnCommandReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts an asynchronous operation on a mobile broadband device service to send a query command to the command session.
     * @param {Integer} commandId The command identifier for the query command to be executed.
     * @param {IBuffer} data The data to be submitted as part of the command.
     * @returns {IAsyncOperation<MobileBroadbandDeviceServiceCommandResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandsession.sendquerycommandasync
     */
    SendQueryCommandAsync(commandId, data) {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandSession")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandSession := IMobileBroadbandDeviceServiceCommandSession(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandSession.SendQueryCommandAsync(commandId, data)
    }

    /**
     * Starts an asynchronous operation on a mobile broadband device service to send a set command to the command session.
     * @param {Integer} commandId The command identifier for the set command to be executed.
     * @param {IBuffer} data The data to be submitted as part of the command.
     * @returns {IAsyncOperation<MobileBroadbandDeviceServiceCommandResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandsession.sendsetcommandasync
     */
    SendSetCommandAsync(commandId, data) {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandSession")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandSession := IMobileBroadbandDeviceServiceCommandSession(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandSession.SendSetCommandAsync(commandId, data)
    }

    /**
     * Closes the command session on a mobile broadband device service.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicecommandsession.closesession
     */
    CloseSession() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandSession")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandSession := IMobileBroadbandDeviceServiceCommandSession(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandSession.CloseSession()
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandDeviceServiceCommandSession, MobileBroadbandDeviceServiceCommandEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CommandReceived(handler) {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandSession2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandSession2 := IMobileBroadbandDeviceServiceCommandSession2(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandSession2.add_CommandReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CommandReceived(token) {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceCommandSession2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceCommandSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceCommandSession2 := IMobileBroadbandDeviceServiceCommandSession2(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceCommandSession2.remove_CommandReceived(token)
    }

;@endregion Instance Methods
}

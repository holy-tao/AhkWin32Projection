#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceServiceDataSession.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MobileBroadbandDeviceServiceDataSession.ahk
#Include .\MobileBroadbandDeviceServiceDataReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a device service data session which allows the caller to write data to the modem on a mobile broadband device service.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * A MobileBroadbandDeviceServiceDataSession instance is returned when the [OpenDataSession](mobilebroadbanddeviceservice_opendatasession_2126087991.md) method is called on the [MobileBroadbandDeviceService](mobilebroadbanddeviceservice.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicedatasession
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceServiceDataSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceServiceDataSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceServiceDataSession.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDataReceivedToken")) {
            this.remove_DataReceived(this.__OnDataReceivedToken)
            this.__OnDataReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts an asynchronous operation on a mobile broadband device service to write data to the data session.
     * @param {IBuffer} value The data to be submitted as part of the write operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicedatasession.writedataasync
     */
    WriteDataAsync(value) {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceDataSession")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceDataSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceDataSession := IMobileBroadbandDeviceServiceDataSession(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceDataSession.WriteDataAsync(value)
    }

    /**
     * Closes the data session on a mobile broadband device service.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservicedatasession.closesession
     */
    CloseSession() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceDataSession")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceDataSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceDataSession := IMobileBroadbandDeviceServiceDataSession(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceDataSession.CloseSession()
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandDeviceServiceDataSession, MobileBroadbandDeviceServiceDataReceivedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DataReceived(eventHandler) {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceDataSession")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceDataSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceDataSession := IMobileBroadbandDeviceServiceDataSession(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceDataSession.add_DataReceived(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_DataReceived(eventCookie) {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceDataSession")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceDataSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceDataSession := IMobileBroadbandDeviceServiceDataSession(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceDataSession.remove_DataReceived(eventCookie)
    }

;@endregion Instance Methods
}

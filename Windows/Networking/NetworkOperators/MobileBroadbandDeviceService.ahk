#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceService.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a mobile broadband device service.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * The [GetDeviceService](mobilebroadbandmodem_getdeviceservice_1135670295.md) method on the [MobileBroadbandModem](mobilebroadbandmodem.md) gets a specific device service for the mobile broadband modem.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservice
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceService.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique device service identity for the mobile broadband device service.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservice.deviceserviceid
     * @type {Guid} 
     */
    DeviceServiceId {
        get => this.get_DeviceServiceId()
    }

    /**
     * Gets a list of supported device service commands for the mobile broadband device service.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservice.supportedcommands
     * @type {IVectorView<Integer>} 
     */
    SupportedCommands {
        get => this.get_SupportedCommands()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DeviceServiceId() {
        if (!this.HasProp("__IMobileBroadbandDeviceService")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceService := IMobileBroadbandDeviceService(outPtr)
        }

        return this.__IMobileBroadbandDeviceService.get_DeviceServiceId()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedCommands() {
        if (!this.HasProp("__IMobileBroadbandDeviceService")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceService := IMobileBroadbandDeviceService(outPtr)
        }

        return this.__IMobileBroadbandDeviceService.get_SupportedCommands()
    }

    /**
     * Opens a new [MobileBroadbandDeviceServiceDataSession](mobilebroadbanddeviceservicedatasession.md) for the mobile broadband device service.
     * @returns {MobileBroadbandDeviceServiceDataSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservice.opendatasession
     */
    OpenDataSession() {
        if (!this.HasProp("__IMobileBroadbandDeviceService")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceService := IMobileBroadbandDeviceService(outPtr)
        }

        return this.__IMobileBroadbandDeviceService.OpenDataSession()
    }

    /**
     * Opens a new [MobileBroadbandDeviceServiceCommandSession](mobilebroadbanddeviceservicecommandsession.md) for the mobile broadband device service.
     * @returns {MobileBroadbandDeviceServiceCommandSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceservice.opencommandsession
     */
    OpenCommandSession() {
        if (!this.HasProp("__IMobileBroadbandDeviceService")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceService := IMobileBroadbandDeviceService(outPtr)
        }

        return this.__IMobileBroadbandDeviceService.OpenCommandSession()
    }

;@endregion Instance Methods
}

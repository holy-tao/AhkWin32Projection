#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandDeviceServiceInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a mobile broadband device service.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * A list of device service information objects is retrieved by the [DeviceServices](mobilebroadbandmodem_deviceservices.md) property on the [MobileBroadbandModem](mobilebroadbandmodem.md).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceserviceinformation
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandDeviceServiceInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandDeviceServiceInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandDeviceServiceInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique device service identifier for the mobile broadband device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceserviceinformation.deviceserviceid
     * @type {Guid} 
     */
    DeviceServiceId {
        get => this.get_DeviceServiceId()
    }

    /**
     * Determines if the mobile broadband device service is able to read data.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceserviceinformation.isdatareadsupported
     * @type {Boolean} 
     */
    IsDataReadSupported {
        get => this.get_IsDataReadSupported()
    }

    /**
     * Determines if the mobile broadband device service is able to write data.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbanddeviceserviceinformation.isdatawritesupported
     * @type {Boolean} 
     */
    IsDataWriteSupported {
        get => this.get_IsDataWriteSupported()
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
        if (!this.HasProp("__IMobileBroadbandDeviceServiceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceInformation := IMobileBroadbandDeviceServiceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceInformation.get_DeviceServiceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataReadSupported() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceInformation := IMobileBroadbandDeviceServiceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceInformation.get_IsDataReadSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataWriteSupported() {
        if (!this.HasProp("__IMobileBroadbandDeviceServiceInformation")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandDeviceServiceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandDeviceServiceInformation := IMobileBroadbandDeviceServiceInformation(outPtr)
        }

        return this.__IMobileBroadbandDeviceServiceInformation.get_IsDataWriteSupported()
    }

;@endregion Instance Methods
}

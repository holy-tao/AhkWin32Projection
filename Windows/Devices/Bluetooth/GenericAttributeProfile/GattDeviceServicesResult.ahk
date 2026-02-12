#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattDeviceServicesResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The status of [GetIncludedServicesForUuidAsync](./gattdeviceservice_getincludedservicesforuuidasync_744552179.md) and [GetIncludedServicesForUuidAsync](./gattdeviceservice_getincludedservicesforuuidasync_744552179.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservicesresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattDeviceServicesResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattDeviceServicesResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattDeviceServicesResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the communication status of the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservicesresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the protocol error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservicesresult.protocolerror
     * @type {IReference<Integer>} 
     */
    ProtocolError {
        get => this.get_ProtocolError()
    }

    /**
     * Gets the services.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservicesresult.services
     * @type {IVectorView<GattDeviceService>} 
     */
    Services {
        get => this.get_Services()
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
        if (!this.HasProp("__IGattDeviceServicesResult")) {
            if ((queryResult := this.QueryInterface(IGattDeviceServicesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceServicesResult := IGattDeviceServicesResult(outPtr)
        }

        return this.__IGattDeviceServicesResult.get_Status()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ProtocolError() {
        if (!this.HasProp("__IGattDeviceServicesResult")) {
            if ((queryResult := this.QueryInterface(IGattDeviceServicesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceServicesResult := IGattDeviceServicesResult(outPtr)
        }

        return this.__IGattDeviceServicesResult.get_ProtocolError()
    }

    /**
     * 
     * @returns {IVectorView<GattDeviceService>} 
     */
    get_Services() {
        if (!this.HasProp("__IGattDeviceServicesResult")) {
            if ((queryResult := this.QueryInterface(IGattDeviceServicesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceServicesResult := IGattDeviceServicesResult(outPtr)
        }

        return this.__IGattDeviceServicesResult.get_Services()
    }

;@endregion Instance Methods
}

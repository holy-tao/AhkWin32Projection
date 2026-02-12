#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommDeviceServicesResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The result of an Rfcomm device service request.
 * @remarks
 * This class is returned as a result of calling the [GetRfcommServicesAsync](../windows.devices.bluetooth/bluetoothdevice_getrfcommservicesasync_1314819113.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservicesresult
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class RfcommDeviceServicesResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommDeviceServicesResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommDeviceServicesResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates that an error occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservicesresult.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * The [RfcommDeviceService](rfcommdeviceservice.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservicesresult.services
     * @type {IVectorView<RfcommDeviceService>} 
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
    get_Error() {
        if (!this.HasProp("__IRfcommDeviceServicesResult")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceServicesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceServicesResult := IRfcommDeviceServicesResult(outPtr)
        }

        return this.__IRfcommDeviceServicesResult.get_Error()
    }

    /**
     * 
     * @returns {IVectorView<RfcommDeviceService>} 
     */
    get_Services() {
        if (!this.HasProp("__IRfcommDeviceServicesResult")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceServicesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceServicesResult := IRfcommDeviceServicesResult(outPtr)
        }

        return this.__IRfcommDeviceServicesResult.get_Services()
    }

;@endregion Instance Methods
}

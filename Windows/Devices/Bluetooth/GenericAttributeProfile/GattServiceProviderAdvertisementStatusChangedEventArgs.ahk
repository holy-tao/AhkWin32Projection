#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceProviderAdvertisementStatusChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The event args for the [GattServiceProvider](gattserviceprovider_advertisementstatuschanged.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisementstatuschangedeventargs
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderAdvertisementStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattServiceProviderAdvertisementStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattServiceProviderAdvertisementStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error of the GATT service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisementstatuschangedeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Gets the status of the GATT service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovideradvertisementstatuschangedeventargs.status
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
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IGattServiceProviderAdvertisementStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisementStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisementStatusChangedEventArgs := IGattServiceProviderAdvertisementStatusChangedEventArgs(outPtr)
        }

        return this.__IGattServiceProviderAdvertisementStatusChangedEventArgs.get_Error()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IGattServiceProviderAdvertisementStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderAdvertisementStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderAdvertisementStatusChangedEventArgs := IGattServiceProviderAdvertisementStatusChangedEventArgs(outPtr)
        }

        return this.__IGattServiceProviderAdvertisementStatusChangedEventArgs.get_Status()
    }

;@endregion Instance Methods
}

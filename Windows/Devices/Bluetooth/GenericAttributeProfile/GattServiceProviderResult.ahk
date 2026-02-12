#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceProviderResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class is the result of the [CreateAsync](gattserviceprovider_createasync_1929238600.md) operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceproviderresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattServiceProviderResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattServiceProviderResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceproviderresult.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Gets the service provider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceproviderresult.serviceprovider
     * @type {GattServiceProvider} 
     */
    ServiceProvider {
        get => this.get_ServiceProvider()
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
        if (!this.HasProp("__IGattServiceProviderResult")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderResult := IGattServiceProviderResult(outPtr)
        }

        return this.__IGattServiceProviderResult.get_Error()
    }

    /**
     * 
     * @returns {GattServiceProvider} 
     */
    get_ServiceProvider() {
        if (!this.HasProp("__IGattServiceProviderResult")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderResult := IGattServiceProviderResult(outPtr)
        }

        return this.__IGattServiceProviderResult.get_ServiceProvider()
    }

;@endregion Instance Methods
}

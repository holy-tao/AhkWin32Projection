#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattLocalService.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class represents a GATT local service.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalservice
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattLocalService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattLocalService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattLocalService.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the local service UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalservice.uuid
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * Gets a vector list of the characteristics available for this local service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalservice.characteristics
     * @type {IVectorView<GattLocalCharacteristic>} 
     */
    Characteristics {
        get => this.get_Characteristics()
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
    get_Uuid() {
        if (!this.HasProp("__IGattLocalService")) {
            if ((queryResult := this.QueryInterface(IGattLocalService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalService := IGattLocalService(outPtr)
        }

        return this.__IGattLocalService.get_Uuid()
    }

    /**
     * Creates a characteristic for this local service.
     * @param {Guid} characteristicUuid The characteristic UUID.
     * @param {GattLocalCharacteristicParameters} parameters The characteristic parameters.
     * @returns {IAsyncOperation<GattLocalCharacteristicResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalservice.createcharacteristicasync
     */
    CreateCharacteristicAsync(characteristicUuid, parameters) {
        if (!this.HasProp("__IGattLocalService")) {
            if ((queryResult := this.QueryInterface(IGattLocalService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalService := IGattLocalService(outPtr)
        }

        return this.__IGattLocalService.CreateCharacteristicAsync(characteristicUuid, parameters)
    }

    /**
     * 
     * @returns {IVectorView<GattLocalCharacteristic>} 
     */
    get_Characteristics() {
        if (!this.HasProp("__IGattLocalService")) {
            if ((queryResult := this.QueryInterface(IGattLocalService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalService := IGattLocalService(outPtr)
        }

        return this.__IGattLocalService.get_Characteristics()
    }

;@endregion Instance Methods
}

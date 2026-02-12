#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattLocalCharacteristicResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A result of [CreateCharacteristicAsync](gattlocalservice_createcharacteristicasync_1504398290.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicresult
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattLocalCharacteristicResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattLocalCharacteristicResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattLocalCharacteristicResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the characteristic of the GATT service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicresult.characteristic
     * @type {GattLocalCharacteristic} 
     */
    Characteristic {
        get => this.get_Characteristic()
    }

    /**
     * Gets the error.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocalcharacteristicresult.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GattLocalCharacteristic} 
     */
    get_Characteristic() {
        if (!this.HasProp("__IGattLocalCharacteristicResult")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicResult := IGattLocalCharacteristicResult(outPtr)
        }

        return this.__IGattLocalCharacteristicResult.get_Characteristic()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IGattLocalCharacteristicResult")) {
            if ((queryResult := this.QueryInterface(IGattLocalCharacteristicResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalCharacteristicResult := IGattLocalCharacteristicResult(outPtr)
        }

        return this.__IGattLocalCharacteristicResult.get_Error()
    }

;@endregion Instance Methods
}

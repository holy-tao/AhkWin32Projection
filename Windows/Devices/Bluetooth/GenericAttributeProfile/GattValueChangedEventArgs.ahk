#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattValueChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the arguments received by a [GattCharacteristic.ValueChanged](gattcharacteristic_valuechanged.md) event handler used to process characteristic value change notification and indication events sent by a Bluetooth LE device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattvaluechangedeventargs
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattValueChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattValueChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new Characteristic Value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattvaluechangedeventargs.characteristicvalue
     * @type {IBuffer} 
     */
    CharacteristicValue {
        get => this.get_CharacteristicValue()
    }

    /**
     * Gets the time at which the system was notified of the Characteristic Value change.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattvaluechangedeventargs.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CharacteristicValue() {
        if (!this.HasProp("__IGattValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattValueChangedEventArgs := IGattValueChangedEventArgs(outPtr)
        }

        return this.__IGattValueChangedEventArgs.get_CharacteristicValue()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IGattValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGattValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattValueChangedEventArgs := IGattValueChangedEventArgs(outPtr)
        }

        return this.__IGattValueChangedEventArgs.get_Timestamp()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattCharacteristicNotificationTriggerDetails.ahk
#Include .\IGattCharacteristicNotificationTriggerDetails2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the Bluetooth LE device that caused this trigger to fire.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattcharacteristicnotificationtriggerdetails
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class GattCharacteristicNotificationTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattCharacteristicNotificationTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattCharacteristicNotificationTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the GATT characteristic that changed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattcharacteristicnotificationtriggerdetails.characteristic
     * @type {GattCharacteristic} 
     */
    Characteristic {
        get => this.get_Characteristic()
    }

    /**
     * Gets a byte stream containing the new value of the characteristic.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattcharacteristicnotificationtriggerdetails.value
     * @type {IBuffer} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets the error status for the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattcharacteristicnotificationtriggerdetails.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * Gets the event trigger mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattcharacteristicnotificationtriggerdetails.eventtriggeringmode
     * @type {Integer} 
     */
    EventTriggeringMode {
        get => this.get_EventTriggeringMode()
    }

    /**
     * Gets the value changes events for this trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattcharacteristicnotificationtriggerdetails.valuechangedevents
     * @type {IVectorView<GattValueChangedEventArgs>} 
     */
    ValueChangedEvents {
        get => this.get_ValueChangedEvents()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GattCharacteristic} 
     */
    get_Characteristic() {
        if (!this.HasProp("__IGattCharacteristicNotificationTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicNotificationTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicNotificationTriggerDetails := IGattCharacteristicNotificationTriggerDetails(outPtr)
        }

        return this.__IGattCharacteristicNotificationTriggerDetails.get_Characteristic()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Value() {
        if (!this.HasProp("__IGattCharacteristicNotificationTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicNotificationTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicNotificationTriggerDetails := IGattCharacteristicNotificationTriggerDetails(outPtr)
        }

        return this.__IGattCharacteristicNotificationTriggerDetails.get_Value()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IGattCharacteristicNotificationTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicNotificationTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicNotificationTriggerDetails2 := IGattCharacteristicNotificationTriggerDetails2(outPtr)
        }

        return this.__IGattCharacteristicNotificationTriggerDetails2.get_Error()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventTriggeringMode() {
        if (!this.HasProp("__IGattCharacteristicNotificationTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicNotificationTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicNotificationTriggerDetails2 := IGattCharacteristicNotificationTriggerDetails2(outPtr)
        }

        return this.__IGattCharacteristicNotificationTriggerDetails2.get_EventTriggeringMode()
    }

    /**
     * 
     * @returns {IVectorView<GattValueChangedEventArgs>} 
     */
    get_ValueChangedEvents() {
        if (!this.HasProp("__IGattCharacteristicNotificationTriggerDetails2")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicNotificationTriggerDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicNotificationTriggerDetails2 := IGattCharacteristicNotificationTriggerDetails2(outPtr)
        }

        return this.__IGattCharacteristicNotificationTriggerDetails2.get_ValueChangedEvents()
    }

;@endregion Instance Methods
}

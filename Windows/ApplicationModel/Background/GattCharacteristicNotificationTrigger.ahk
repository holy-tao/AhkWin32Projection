#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattCharacteristicNotificationTrigger.ahk
#Include .\IGattCharacteristicNotificationTrigger2.ahk
#Include .\IGattCharacteristicNotificationTriggerFactory2.ahk
#Include .\IGattCharacteristicNotificationTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task when an incoming change notification is received for a Bluetooth LE GATT characteristic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattcharacteristicnotificationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class GattCharacteristicNotificationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattCharacteristicNotificationTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattCharacteristicNotificationTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the **GattCharacteristicNotificationTrigger** class with the specified characteristic and triggering mode.
     * @param {GattCharacteristic} characteristic The GATT characteristic that you want value change notifications for.
     * @param {Integer} eventTriggeringMode Specifies when the trigger is activated.
     * @returns {GattCharacteristicNotificationTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattcharacteristicnotificationtrigger.#ctor
     */
    static CreateWithEventTriggeringMode(characteristic, eventTriggeringMode) {
        if (!GattCharacteristicNotificationTrigger.HasProp("__IGattCharacteristicNotificationTriggerFactory2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.GattCharacteristicNotificationTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicNotificationTriggerFactory2.IID)
            GattCharacteristicNotificationTrigger.__IGattCharacteristicNotificationTriggerFactory2 := IGattCharacteristicNotificationTriggerFactory2(factoryPtr)
        }

        return GattCharacteristicNotificationTrigger.__IGattCharacteristicNotificationTriggerFactory2.CreateWithEventTriggeringMode(characteristic, eventTriggeringMode)
    }

    /**
     * Initializes a new instance of the [GattCharacteristicNotificationTrigger](gattcharacteristicnotificationtrigger.md) class.
     * @remarks
     * To register for notifications when the value of a GATT characteristic changes, an app does the following:
     * 
     * 1. Create an instance of the [GattCharacteristicNotificationTrigger](gattcharacteristicnotificationtrigger.md) object.
     * 
     * 2. Create an instance of the [BackgroundTaskBuilder](backgroundtaskbuilder.md) object, and call [SetTrigger](backgroundtaskbuilder_settrigger_2125876510.md) to attach the GattCharacteristicNotificationTrigger.
     * 
     * 3. Call [Register](backgroundtaskbuilder_register_292201929.md) on the BackgroundTaskBuilder object.
     * 
     * Note that this can only be done for Bluetooth LE devices, and only for characteristics for which the device is willing to generate notifications or indications. The system will attempt to keep the specified Bluetooth LE device in a connected state as long as at least one of the notification triggers is outstanding.
     * @param {GattCharacteristic} characteristic The GATT characteristic for which value change notifications are desired.
     * @returns {GattCharacteristicNotificationTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattcharacteristicnotificationtrigger.#ctor
     */
    static Create(characteristic) {
        if (!GattCharacteristicNotificationTrigger.HasProp("__IGattCharacteristicNotificationTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.GattCharacteristicNotificationTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicNotificationTriggerFactory.IID)
            GattCharacteristicNotificationTrigger.__IGattCharacteristicNotificationTriggerFactory := IGattCharacteristicNotificationTriggerFactory(factoryPtr)
        }

        return GattCharacteristicNotificationTrigger.__IGattCharacteristicNotificationTriggerFactory.Create(characteristic)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the GATT characteristic for which value change notifications are desired.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattcharacteristicnotificationtrigger.characteristic
     * @type {GattCharacteristic} 
     */
    Characteristic {
        get => this.get_Characteristic()
    }

    /**
     * Gets the mode for the trigger. The mode specifies when the trigger is activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattcharacteristicnotificationtrigger.eventtriggeringmode
     * @type {Integer} 
     */
    EventTriggeringMode {
        get => this.get_EventTriggeringMode()
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
        if (!this.HasProp("__IGattCharacteristicNotificationTrigger")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicNotificationTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicNotificationTrigger := IGattCharacteristicNotificationTrigger(outPtr)
        }

        return this.__IGattCharacteristicNotificationTrigger.get_Characteristic()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventTriggeringMode() {
        if (!this.HasProp("__IGattCharacteristicNotificationTrigger2")) {
            if ((queryResult := this.QueryInterface(IGattCharacteristicNotificationTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattCharacteristicNotificationTrigger2 := IGattCharacteristicNotificationTrigger2(outPtr)
        }

        return this.__IGattCharacteristicNotificationTrigger2.get_EventTriggeringMode()
    }

;@endregion Instance Methods
}

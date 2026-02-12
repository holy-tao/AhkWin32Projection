#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceManufacturerNotificationTrigger.ahk
#Include .\IDeviceManufacturerNotificationTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task to enable device manufacturer operations.
 * @remarks
 * Starting with Windows 10, version 1803, [CustomSystemEventTrigger](customsystemeventtrigger.md) should be used instead of this trigger.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.devicemanufacturernotificationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class DeviceManufacturerNotificationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceManufacturerNotificationTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceManufacturerNotificationTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [DeviceManufacturerNotificationTrigger](devicemanufacturernotificationtrigger.md) class.
     * @param {HSTRING} triggerQualifier An app-defined string that qualifies the trigger.
     * @param {Boolean} oneShot Whether the trigger is used only once.
     * @returns {DeviceManufacturerNotificationTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.devicemanufacturernotificationtrigger.#ctor
     */
    static Create(triggerQualifier, oneShot) {
        if (!DeviceManufacturerNotificationTrigger.HasProp("__IDeviceManufacturerNotificationTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.DeviceManufacturerNotificationTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceManufacturerNotificationTriggerFactory.IID)
            DeviceManufacturerNotificationTrigger.__IDeviceManufacturerNotificationTriggerFactory := IDeviceManufacturerNotificationTriggerFactory(factoryPtr)
        }

        return DeviceManufacturerNotificationTrigger.__IDeviceManufacturerNotificationTriggerFactory.Create(triggerQualifier, oneShot)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an app-defined string that qualifies the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.devicemanufacturernotificationtrigger.triggerqualifier
     * @type {HSTRING} 
     */
    TriggerQualifier {
        get => this.get_TriggerQualifier()
    }

    /**
     * Gets whether the trigger is used only once.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.devicemanufacturernotificationtrigger.oneshot
     * @type {Boolean} 
     */
    OneShot {
        get => this.get_OneShot()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TriggerQualifier() {
        if (!this.HasProp("__IDeviceManufacturerNotificationTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceManufacturerNotificationTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceManufacturerNotificationTrigger := IDeviceManufacturerNotificationTrigger(outPtr)
        }

        return this.__IDeviceManufacturerNotificationTrigger.get_TriggerQualifier()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OneShot() {
        if (!this.HasProp("__IDeviceManufacturerNotificationTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceManufacturerNotificationTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceManufacturerNotificationTrigger := IDeviceManufacturerNotificationTrigger(outPtr)
        }

        return this.__IDeviceManufacturerNotificationTrigger.get_OneShot()
    }

;@endregion Instance Methods
}

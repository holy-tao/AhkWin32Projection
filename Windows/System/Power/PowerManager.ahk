#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPowerManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to information about a device's battery and power supply status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.powermanager
 * @namespace Windows.System.Power
 * @version WindowsRuntime 1.4
 */
class PowerManager extends IInspectable {
;@region Static Properties
    /**
     * Gets the devices's battery saver status, indicating when to save energy.
     * @remarks
     * A user can turn on battery saver at any time to save energy (as long as the device is running on battery power). Battery saver extends battery life by limiting background activity on the device. In addition to the efforts of battery saver, your app can do its own part to save energy. Before initiating resource intensive tasks, check EnergySaverStatus to make sure battery saver isn’t **on**. If your app’s resource intensive tasks are long-running, listen for the [EnergySaverStatusChanged](powermanager_energysaverstatuschanged.md) event so that those tasks can be stopped when battery saver is turned on.
     * 
     * A user can also set battery saver to turn on automatically when the battery reaches a specified charge threshold, such as 20% remaining. When it's in this state (before it turns on automatically), EnergySaverStatus is **Off**. If the user disables this automatic setting, EnergySaverStatus is **Disabled**.
     * 
     * Even if the automatic setting is enabled, when the device is plugged in, battery saver is turned off and EnergySaverStatus is **Disabled**. It is not **Off** because as long as the device is plugged in, battery saver cannot be turned on.
     * 
     * When battery saver is on, the receipt of push notifications is disabled to save energy. But there are a couple exceptions to this. **Battery saver settings** (in Windows Settings) provides settings that allow your app to receive push notifications even when battery saver is on. If your app depends heavily on push notifications, we recommend notifying users that they may not receive notifications while battery saver is on and to make it easy for them to adjust **battery saver settings**. For more info and examples, see [Windows Push Notification Services (WNS) overview](/windows/apps/design/shell/tiles-and-notifications/windows-push-notification-services--wns--overview).
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.powermanager.energysaverstatus
     * @type {Integer} 
     */
    static EnergySaverStatus {
        get => PowerManager.get_EnergySaverStatus()
    }

    /**
     * Gets the device's battery status.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.powermanager.batterystatus
     * @type {Integer} 
     */
    static BatteryStatus {
        get => PowerManager.get_BatteryStatus()
    }

    /**
     * Gets the device's power supply status.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.powermanager.powersupplystatus
     * @type {Integer} 
     */
    static PowerSupplyStatus {
        get => PowerManager.get_PowerSupplyStatus()
    }

    /**
     * Gets the total percentage of charge remaining from all batteries connected to the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.powermanager.remainingchargepercent
     * @type {Integer} 
     */
    static RemainingChargePercent {
        get => PowerManager.get_RemainingChargePercent()
    }

    /**
     * Gets the total runtime remaining from all batteries connected to the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.power.powermanager.remainingdischargetime
     * @type {TimeSpan} 
     */
    static RemainingDischargeTime {
        get => PowerManager.get_RemainingDischargeTime()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_EnergySaverStatus() {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.get_EnergySaverStatus()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_EnergySaverStatusChanged(handler) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.add_EnergySaverStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_EnergySaverStatusChanged(token) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.remove_EnergySaverStatusChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_BatteryStatus() {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.get_BatteryStatus()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_BatteryStatusChanged(handler) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.add_BatteryStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_BatteryStatusChanged(token) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.remove_BatteryStatusChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PowerSupplyStatus() {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.get_PowerSupplyStatus()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PowerSupplyStatusChanged(handler) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.add_PowerSupplyStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_PowerSupplyStatusChanged(token) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.remove_PowerSupplyStatusChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_RemainingChargePercent() {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.get_RemainingChargePercent()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RemainingChargePercentChanged(handler) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.add_RemainingChargePercentChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RemainingChargePercentChanged(token) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.remove_RemainingChargePercentChanged(token)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    static get_RemainingDischargeTime() {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.get_RemainingDischargeTime()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_RemainingDischargeTimeChanged(handler) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.add_RemainingDischargeTimeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RemainingDischargeTimeChanged(token) {
        if (!PowerManager.HasProp("__IPowerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Power.PowerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerManagerStatics.IID)
            PowerManager.__IPowerManagerStatics := IPowerManagerStatics(factoryPtr)
        }

        return PowerManager.__IPowerManagerStatics.remove_RemainingDischargeTimeChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

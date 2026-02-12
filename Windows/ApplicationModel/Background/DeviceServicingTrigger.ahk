#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceServicingTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an event that an application can trigger to initiate a long-running update (firmware or settings) of a device.
  * 
  * Windows 8.1 enables you to develop UWP app for your peripheral devices that communicate over USB, HID, and Bluetooth. For example, a user might need to sync content on a PC to or from the device, or perform a long-running update to the device itself like settings or firmware updates. Windows 8.1 provides two background tasks and corresponding APIs that allow your device to sync and update in the background: DeviceServicingTrigger and [DeviceUseTrigger](deviceusetrigger.md). This topic provides API reference information for DeviceServicingTrigger - for info on using this trigger in the context of a device app, see [Device sync and update for UWP device apps](/windows-hardware/drivers/devapps/device-sync-and-update-for-uwp-device-apps).
  * 
  * The DeviceServicingTrigger background task allows your UWP app that interacts with your peripheral device to perform long running device updates while your app is suspended, for example settings transfers or firmware updates. Updating your device in the background requires user approval each time the background task is used. Unlike the [DeviceUseTrigger](deviceusetrigger.md) background task, the DeviceServicingTrigger background task allows for device reboot and disconnect and allows a maximum of 30 minutes of background activity.
  * 
  * 
  * + More detail on the policy requirements of the DeviceServicingTrigger background task can be found in the  section of this page.
  * + For info about using the DeviceServicingTrigger, see [Device sync and update for UWP device apps](/windows-hardware/drivers/devapps/device-sync-and-update-for-uwp-device-apps).
  * + For info about using the [DeviceUseTrigger](deviceusetrigger.md), see [Accessing sensors and devices from a background task](/previous-versions/windows/apps/dn630194(v=win.10)).
  * > [!IMPORTANT]
  * > This trigger cannot be used with single-process background tasks.
 * @remarks
 * Certain policies are enforced by Windows to ensure user consent when updating their peripheral devices. Additional polices are enforced to preserve user battery life when syncing and updating peripheral devices. The [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) background task is subject to the following policies:
 * 
 * + The [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) background task requires user consent every time it's triggered.
 * + Your device must be connected or paired with the PC and available when requesting the [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md).
 * + Your app is allowed a maximum of 30 minutes (wall clock) of background activity for device updates with [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md)
 * + Your app is not allowed to request a [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) background task while your app is not in the foreground.
 * + Your app can only run one [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) at a time. Attempting to create a second [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) will raise an exception.
 * + The PC's battery must have more than 33% capacity remaining, or the PC must be on A/C power.
 * + [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) background tasks may be canceled by Windows when these policy requirements are no longer met, including a maximum amount of wall clock background time.
 * > [!NOTE]
 * > UWP app that intend to use the [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) background task must also be a privileged app for the device. App privilege is specified in the device metadata for a peripheral device by the device manufacturer. When a UWP app attempts to trigger the [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) background task, Windows will validate that the calling app is the privileged app for the device it is attempting to update. If the app is not privileged for the device then Windows will not allow the background task to launch.
 * 
 * For detailed information about app privilege and the policy checks enforced by Windows for the [DeviceServicingTrigger](deviceservicingtrigger_deviceservicingtrigger_1221375020.md) background task see [Device sync and update for UWP device apps](/windows-hardware/drivers/devapps/device-sync-and-update-for-uwp-device-apps).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceservicingtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class DeviceServicingTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceServicingTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceServicingTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Constructor for [DeviceServicingTrigger](deviceservicingtrigger.md). Takes no parameters.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.DeviceServicingTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Triggers the background task (settings or firmware update) and returns a [DeviceTriggerResult](devicetriggerresult.md) indicating success or failure of the trigger request. Takes the *DeviceInformation.ID* string, an optional estimated time the background task will run, and an optional app-specific string passed to the background task identifying which device operation to perform. If your app cannot determine an appropriate time estimate, provide zero as the estimated time.
     * @param {HSTRING} deviceId The *DeviceInformation.ID* of the device the background task will access. The device path must match the device that will perform the background operation and is used by Windows to ensure that policy requirements are met.
     * @param {TimeSpan} expectedDuration Optional value. The expected duration of the background settings update or background firmware update. If provided, it will be displayed to the user in the system consent dialog when the task is triggered by your app. Set this value to zero if an appropriate time estimate cannot be determined.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceservicingtrigger.requestasync
     */
    RequestAsyncSimple(deviceId, expectedDuration) {
        if (!this.HasProp("__IDeviceServicingTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceServicingTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceServicingTrigger := IDeviceServicingTrigger(outPtr)
        }

        return this.__IDeviceServicingTrigger.RequestAsyncSimple(deviceId, expectedDuration)
    }

    /**
     * Triggers the background task (settings or firmware update) and returns a [DeviceTriggerResult](devicetriggerresult.md) indicating success or failure of the trigger request. Takes the *DeviceInformation.ID* string and an optional estimated time the background task will run. If your app cannot determine an appropriate time estimate, provide zero as the estimated time.
     * @param {HSTRING} deviceId The *DeviceInformation.ID* of the device the background task will access. The device path must match the device that will perform the background operation and is used by Windows to ensure that policy requirements are met.
     * @param {TimeSpan} expectedDuration Optional value. The expected duration of the background settings update or background firmware update. If provided, it will be displayed to the user in the system consent dialog when the task is triggered by your app. Set this value to zero if an appropriate time estimate cannot be determined.
     * @param {HSTRING} arguments 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceservicingtrigger.requestasync
     */
    RequestAsyncWithArguments(deviceId, expectedDuration, arguments) {
        if (!this.HasProp("__IDeviceServicingTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceServicingTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceServicingTrigger := IDeviceServicingTrigger(outPtr)
        }

        return this.__IDeviceServicingTrigger.RequestAsyncWithArguments(deviceId, expectedDuration, arguments)
    }

;@endregion Instance Methods
}

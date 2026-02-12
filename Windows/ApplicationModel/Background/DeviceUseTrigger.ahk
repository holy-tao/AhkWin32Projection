#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceUseTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an event that a Windows Runtime app can trigger to initiate a long-running operation with a device or sensor.
  * 
  * **DeviceUseTrigger** lets your Windows Runtime app access sensors and peripheral devices in the background, even when your foreground app is suspended. For example, depending on where your app is running, it could use a background task to synchronize data with devices or monitor sensors.
  * 
  * This class can be used in UWP app and Windows Phone 8.x app. However, a **DeviceUseTrigger** background task supports different APIs, and is subject to different policies, depending where it's running (PC or phone). To learn more about these differences, see [Accessing sensors and devices from a background task](/previous-versions/windows/apps/dn630194(v=win.10)).
  * 
  * > [!IMPORTANT]
  * > This trigger cannot be used with single-process background tasks.
  * 
  * For a sample that shows how to use **DeviceUseTrigger** on a PC, see the [Custom USB device sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/CustomUsbDeviceAccess). For a phone sample, see the [Background Sensors sample](https://go.microsoft.com/fwlink/p/?LinkId=393307).
 * @remarks
 * For more about policy requirements, see [Accessing sensors and devices from a background task](/previous-versions/windows/apps/dn630194(v=win.10))
 * 
 * > Before your app triggers a background task on a phone, it must first call [BackgroundExecutionManager.RequestAccessAsync](/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.RequestAccessAsync) to check if the app is able to request a background task. This check is not required when your app is running on a PC.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceusetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class DeviceUseTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceUseTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceUseTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Constructor for [DeviceUseTrigger](deviceusetrigger.md). Takes no parameters.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.DeviceUseTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Triggers the background task and returns a [DeviceTriggerResult](devicetriggerresult.md) indicating success or failure of the trigger request. Takes the *DeviceInformation.ID* of the device or sensor that the background task will access, and an optional app-specific string passed to the background task identifying which operation to perform.
     * @param {HSTRING} deviceId The *DeviceInformation.ID* of the device or sensor that the background task will access. It must match the device or sensor that will perform the background operation. It is used by Windows to ensure that policy requirements are met.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceusetrigger.requestasync
     */
    RequestAsyncSimple(deviceId) {
        if (!this.HasProp("__IDeviceUseTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceUseTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceUseTrigger := IDeviceUseTrigger(outPtr)
        }

        return this.__IDeviceUseTrigger.RequestAsyncSimple(deviceId)
    }

    /**
     * Triggers the background task and returns a [DeviceTriggerResult](devicetriggerresult.md) indicating success or failure of the trigger request. Takes the *DeviceInformation.ID* of the device or sensor that the background task will access.
     * @param {HSTRING} deviceId The *DeviceInformation.ID* of the device or sensor that the background task will access. It must match the device or sensor that will perform the background operation. It is used by Windows to ensure that policy requirements are met.
     * @param {HSTRING} arguments 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceusetrigger.requestasync
     */
    RequestAsyncWithArguments(deviceId, arguments) {
        if (!this.HasProp("__IDeviceUseTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceUseTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceUseTrigger := IDeviceUseTrigger(outPtr)
        }

        return this.__IDeviceUseTrigger.RequestAsyncWithArguments(deviceId, arguments)
    }

;@endregion Instance Methods
}

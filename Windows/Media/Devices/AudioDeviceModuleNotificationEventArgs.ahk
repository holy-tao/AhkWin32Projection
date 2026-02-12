#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioDeviceModuleNotificationEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AudioDeviceModulesManager.ModuleNotificationReceived](audiodevicemodulesmanager_modulenotificationreceived.md) event which is raised when audio device module changes occur.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodulenotificationeventargs
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AudioDeviceModuleNotificationEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioDeviceModuleNotificationEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioDeviceModuleNotificationEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the audio device module that triggered the change event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodulenotificationeventargs.module
     * @type {AudioDeviceModule} 
     */
    Module {
        get => this.get_Module()
    }

    /**
     * Gets a buffer containing data that identifies the change that occurred in the module. This data is defined by the module developer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodulenotificationeventargs.notificationdata
     * @type {IBuffer} 
     */
    NotificationData {
        get => this.get_NotificationData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AudioDeviceModule} 
     */
    get_Module() {
        if (!this.HasProp("__IAudioDeviceModuleNotificationEventArgs")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModuleNotificationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModuleNotificationEventArgs := IAudioDeviceModuleNotificationEventArgs(outPtr)
        }

        return this.__IAudioDeviceModuleNotificationEventArgs.get_Module()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_NotificationData() {
        if (!this.HasProp("__IAudioDeviceModuleNotificationEventArgs")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModuleNotificationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModuleNotificationEventArgs := IAudioDeviceModuleNotificationEventArgs(outPtr)
        }

        return this.__IAudioDeviceModuleNotificationEventArgs.get_NotificationData()
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioDeviceModule.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single audio device module, which may be a hardware effect processing unit or any other audio configuration module defined by an audio driver.
 * @remarks
 * Get an instance of this class by calling [AudioDeviceModulesManager.FindAll](audiodevicemodulesmanager_findall_1149612203.md) or [AudioDeviceModulesManager.FindAllById](audiodevicemodulesmanager_findallbyid_1077023214.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodule
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AudioDeviceModule extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioDeviceModule

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioDeviceModule.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) identifier of the module, which is defined by the audio device module owner.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodule.classid
     * @type {HSTRING} 
     */
    ClassId {
        get => this.get_ClassId()
    }

    /**
     * Gets the friendly name of the audio device module for display in UI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodule.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets an identifier, defined by the driver developer, that disambiguates between multiple instances of the same module class in the driver topology.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodule.instanceid
     * @type {Integer} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

    /**
     * Gets the major version of the audio device module.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodule.majorversion
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * Gets the minor version of the audio device module.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodule.minorversion
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
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
    get_ClassId() {
        if (!this.HasProp("__IAudioDeviceModule")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModule := IAudioDeviceModule(outPtr)
        }

        return this.__IAudioDeviceModule.get_ClassId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IAudioDeviceModule")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModule := IAudioDeviceModule(outPtr)
        }

        return this.__IAudioDeviceModule.get_DisplayName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstanceId() {
        if (!this.HasProp("__IAudioDeviceModule")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModule := IAudioDeviceModule(outPtr)
        }

        return this.__IAudioDeviceModule.get_InstanceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MajorVersion() {
        if (!this.HasProp("__IAudioDeviceModule")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModule := IAudioDeviceModule(outPtr)
        }

        return this.__IAudioDeviceModule.get_MajorVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinorVersion() {
        if (!this.HasProp("__IAudioDeviceModule")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModule := IAudioDeviceModule(outPtr)
        }

        return this.__IAudioDeviceModule.get_MinorVersion()
    }

    /**
     * Asynchronously sends data to the audio device module and receives the result.
     * @param {IBuffer} Command A buffer containing the command data to send to the audio device module.
     * @returns {IAsyncOperation<ModuleCommandResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodule.sendcommandasync
     */
    SendCommandAsync(Command) {
        if (!this.HasProp("__IAudioDeviceModule")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModule.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModule := IAudioDeviceModule(outPtr)
        }

        return this.__IAudioDeviceModule.SendCommandAsync(Command)
    }

;@endregion Instance Methods
}

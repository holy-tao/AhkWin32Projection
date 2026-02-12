#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioDeviceModulesManager.ahk
#Include .\IAudioDeviceModulesManagerFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AudioDeviceModulesManager.ahk
#Include .\AudioDeviceModuleNotificationEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Manages the collections of audio device modules for a audio device pin instance or for a particular audio endpoint.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodulesmanager
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AudioDeviceModulesManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioDeviceModulesManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioDeviceModulesManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of the **AudioDeviceModulesManager** class for the specified audio device ID.
     * @param {HSTRING} deviceId The identifier of the audio device for which the **AudioDeviceModulesManager** is retrieved.
     * @returns {AudioDeviceModulesManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodulesmanager.#ctor
     */
    static Create(deviceId) {
        if (!AudioDeviceModulesManager.HasProp("__IAudioDeviceModulesManagerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Devices.AudioDeviceModulesManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioDeviceModulesManagerFactory.IID)
            AudioDeviceModulesManager.__IAudioDeviceModulesManagerFactory := IAudioDeviceModulesManagerFactory(factoryPtr)
        }

        return AudioDeviceModulesManager.__IAudioDeviceModulesManagerFactory.Create(deviceId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnModuleNotificationReceivedToken")) {
            this.remove_ModuleNotificationReceived(this.__OnModuleNotificationReceivedToken)
            this.__OnModuleNotificationReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AudioDeviceModulesManager, AudioDeviceModuleNotificationEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ModuleNotificationReceived(handler) {
        if (!this.HasProp("__IAudioDeviceModulesManager")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModulesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModulesManager := IAudioDeviceModulesManager(outPtr)
        }

        return this.__IAudioDeviceModulesManager.add_ModuleNotificationReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ModuleNotificationReceived(token) {
        if (!this.HasProp("__IAudioDeviceModulesManager")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModulesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModulesManager := IAudioDeviceModulesManager(outPtr)
        }

        return this.__IAudioDeviceModulesManager.remove_ModuleNotificationReceived(token)
    }

    /**
     * Retrieves a list of all audio device modules with the specified ID. Each audio device module in the list will have the same ID, but each will have a different value for the [AudioDeviceModule.InstanceId](audiodevicemodule_instanceid.md) property.
     * @param {HSTRING} moduleId The identifier of the audio device modules to be retrieved.
     * @returns {IVectorView<AudioDeviceModule>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodulesmanager.findallbyid
     */
    FindAllById(moduleId) {
        if (!this.HasProp("__IAudioDeviceModulesManager")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModulesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModulesManager := IAudioDeviceModulesManager(outPtr)
        }

        return this.__IAudioDeviceModulesManager.FindAllById(moduleId)
    }

    /**
     * Retreives a list of all audio device modules associated with the audio device for which the **AudioDeviceModulesManager** was initialized.
     * @returns {IVectorView<AudioDeviceModule>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.audiodevicemodulesmanager.findall
     */
    FindAll() {
        if (!this.HasProp("__IAudioDeviceModulesManager")) {
            if ((queryResult := this.QueryInterface(IAudioDeviceModulesManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioDeviceModulesManager := IAudioDeviceModulesManager(outPtr)
        }

        return this.__IAudioDeviceModulesManager.FindAll()
    }

;@endregion Instance Methods
}

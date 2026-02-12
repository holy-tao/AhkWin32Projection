#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandDefinitionManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A static class that enables registering and using command sets from a [Voice Command Data (VCD)](/uwp/schemas/voicecommands/voice-command-elements-and-attributes-1-2) file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddefinitionmanager
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandDefinitionManager extends IInspectable {
;@region Static Properties
    /**
     * A dictionary that contains all installed command sets that have a [Name](/uwp/schemas/voicecommands/voice-command-elements-and-attributes-1-2) attribute set in the Voice Command Definition (VCD) file.
     * 
     * > [!NOTE]
     * > Opening an app service connection can be resource intensive. Avoid accessing this property during time-sensitive operations, especially from the UI thread or when [Suspending](../windows.ui.xaml/application_suspending.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddefinitionmanager.installedcommanddefinitions
     * @type {IMapView<HSTRING, VoiceCommandDefinition>} 
     */
    static InstalledCommandDefinitions {
        get => VoiceCommandDefinitionManager.get_InstalledCommandDefinitions()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Installs the [CommandSet](/uwp/schemas/voicecommands/voice-command-elements-and-attributes-1-2) elements in a Voice Command Definition (VCD) file.
     * @remarks
     * Call this method only from your [OnLaunched](../windows.ui.xaml/application_onlaunched_859642554.md) override, or a [Resuming](../windows.applicationmodel.core/coreapplication_resuming.md) event handler.
     * 
     * Do not call this method from a [Suspending](../windows.applicationmodel.core/coreapplication_suspending.md) event handler as the action might take longer than the time allotted by the system for app suspension.
     * @param {StorageFile} file_ An object representing a Voice Command Definition (VCD) file.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddefinitionmanager.installcommanddefinitionsfromstoragefileasync
     */
    static InstallCommandDefinitionsFromStorageFileAsync(file_) {
        if (!VoiceCommandDefinitionManager.HasProp("__IVoiceCommandDefinitionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandDefinitionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandDefinitionManagerStatics.IID)
            VoiceCommandDefinitionManager.__IVoiceCommandDefinitionManagerStatics := IVoiceCommandDefinitionManagerStatics(factoryPtr)
        }

        return VoiceCommandDefinitionManager.__IVoiceCommandDefinitionManagerStatics.InstallCommandDefinitionsFromStorageFileAsync(file_)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, VoiceCommandDefinition>} 
     */
    static get_InstalledCommandDefinitions() {
        if (!VoiceCommandDefinitionManager.HasProp("__IVoiceCommandDefinitionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandDefinitionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandDefinitionManagerStatics.IID)
            VoiceCommandDefinitionManager.__IVoiceCommandDefinitionManagerStatics := IVoiceCommandDefinitionManagerStatics(factoryPtr)
        }

        return VoiceCommandDefinitionManager.__IVoiceCommandDefinitionManagerStatics.get_InstalledCommandDefinitions()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}

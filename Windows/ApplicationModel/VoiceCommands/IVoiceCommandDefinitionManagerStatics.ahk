#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\VoiceCommandDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandDefinitionManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandDefinitionManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{8fe7a69e-067e-4f16-a18c-5b17e9499940}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InstallCommandDefinitionsFromStorageFileAsync", "get_InstalledCommandDefinitions"]

    /**
     * @type {IMapView<HSTRING, VoiceCommandDefinition>} 
     */
    InstalledCommandDefinitions {
        get => this.get_InstalledCommandDefinitions()
    }

    /**
     * 
     * @param {StorageFile} file_ 
     * @returns {IAsyncAction} 
     */
    InstallCommandDefinitionsFromStorageFileAsync(file_) {
        result := ComCall(6, this, "ptr", file_, "ptr*", &installAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(installAction)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, VoiceCommandDefinition>} 
     */
    get_InstalledCommandDefinitions() {
        result := ComCall(7, this, "ptr*", &voiceCommandDefinitions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), VoiceCommandDefinition, voiceCommandDefinitions)
    }
}

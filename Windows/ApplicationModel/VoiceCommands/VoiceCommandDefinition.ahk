#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandDefinition.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables operations on a specific installed command set.
 * @remarks
 * Access the [InstalledCommandDefinitions](voicecommanddefinitionmanager_installedcommanddefinitions.md) property to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddefinition
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandDefinition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandDefinition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the language ([xml:lang](/uwp/schemas/voicecommands/voice-command-elements-and-attributes-1-2)) value of the `CommandSet` element in the Voice Command Definition (VCD) file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddefinition.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets the `Name` attribute value of the `CommandSet` element in the Voice Command Definition (VCD) file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddefinition.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
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
    get_Language() {
        if (!this.HasProp("__IVoiceCommandDefinition")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandDefinition := IVoiceCommandDefinition(outPtr)
        }

        return this.__IVoiceCommandDefinition.get_Language()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IVoiceCommandDefinition")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandDefinition := IVoiceCommandDefinition(outPtr)
        }

        return this.__IVoiceCommandDefinition.get_Name()
    }

    /**
     * Populates a `PhraseList` element with an array of `Item` elements.
     * @param {HSTRING} phraseListName The string that corresponds to the label attribute of the `PhraseList` element.
     * @param {IIterable<HSTRING>} phraseList A string array of values that will be added to the `PhraseList` element as `Item` elements.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddefinition.setphraselistasync
     */
    SetPhraseListAsync(phraseListName, phraseList) {
        if (!this.HasProp("__IVoiceCommandDefinition")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandDefinition := IVoiceCommandDefinition(outPtr)
        }

        return this.__IVoiceCommandDefinition.SetPhraseListAsync(phraseListName, phraseList)
    }

;@endregion Instance Methods
}

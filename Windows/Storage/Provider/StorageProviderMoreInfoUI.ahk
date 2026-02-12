#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderMoreInfoUI.ahk
#Include ..\..\..\Guid.ahk

/**
 * The container for the more info UI section of the storage provider flyout. This is used to provide additional information and/or a recommended action a user can take in response to the current sync state.
 * @remarks
 * This section will only be visible if at least one of [StorageProviderMoreInfoUICommand](storageprovidermoreinfoui_command.md) or [StorageProviderMoreInfoUIMessage](storageprovidermoreinfoui_message.md) is Enabled (see [IStorageProviderUICommandState](istorageprovideruicommand_state.md)) or non-empty, respectively.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidermoreinfoui
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderMoreInfoUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderMoreInfoUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderMoreInfoUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [MoreInfoUI](storageproviderstatusui_moreinfoui.md) section's message.
     * @remarks
     * This property is advisory. Windows determines if or how it uses these values.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidermoreinfoui.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * The [MoreInfoUI](storageproviderstatusui_moreinfoui.md) section's command.
     * @remarks
     * When the user's display settings are standard (e.g., no high contrast theme is currently applied), this button uses the user's accent color.
     * 
     * Windows may choose to disable Storage Provider Status UI if neither this command nor [ProviderPrimaryCommand](storageproviderstatusui_providerprimarycommand.md) are specified.
     * 
     * Additionally, Windows may choose this command to take precedence over [ProviderPrimaryCommand](storageproviderstatusui_providerprimarycommand.md) when both commands are present.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidermoreinfoui.command
     * @type {IStorageProviderUICommand} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * [StorageProviderMoreInfoUI](storageprovidermoreinfoui.md) default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderMoreInfoUI")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__IStorageProviderMoreInfoUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderMoreInfoUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderMoreInfoUI := IStorageProviderMoreInfoUI(outPtr)
        }

        return this.__IStorageProviderMoreInfoUI.get_Message()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Message(value) {
        if (!this.HasProp("__IStorageProviderMoreInfoUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderMoreInfoUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderMoreInfoUI := IStorageProviderMoreInfoUI(outPtr)
        }

        return this.__IStorageProviderMoreInfoUI.put_Message(value)
    }

    /**
     * 
     * @returns {IStorageProviderUICommand} 
     */
    get_Command() {
        if (!this.HasProp("__IStorageProviderMoreInfoUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderMoreInfoUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderMoreInfoUI := IStorageProviderMoreInfoUI(outPtr)
        }

        return this.__IStorageProviderMoreInfoUI.get_Command()
    }

    /**
     * 
     * @param {IStorageProviderUICommand} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        if (!this.HasProp("__IStorageProviderMoreInfoUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderMoreInfoUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderMoreInfoUI := IStorageProviderMoreInfoUI(outPtr)
        }

        return this.__IStorageProviderMoreInfoUI.put_Command(value)
    }

;@endregion Instance Methods
}

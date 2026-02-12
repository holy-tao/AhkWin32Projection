#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderStatusUI.ahk
#Include ..\..\..\Guid.ahk

/**
 * The container used to populate the storage provider status UI flyout.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderStatusUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderStatusUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderStatusUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides the current sync status of the storage provider status UI.
     * @remarks
     * Possible `StorageProviderState` values are:
     * 
     * | State | Description |
     * |--------|--------|
     * | `Error` | The storage provider has encountered errors. |
     * | `InSync` | The storage provider is currently in-sync. |
     * | `Offline` | The storage provider is currently offline. |
     * | `Paused` | The storage provider has paused syncing. |
     * | `Syncing` | The storage provider is currently syncing. |
     * | `Warning` | The storage provider would like to display a warning message to the user. |
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.providerstate
     * @type {Integer} 
     */
    ProviderState {
        get => this.get_ProviderState()
        set => this.put_ProviderState(value)
    }

    /**
     * The label displayed in the Command Bar area of File Explorer when the current folder is backed by the provider.
     * @remarks
     * Windows may use a default string if this property is not present.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.providerstatelabel
     * @type {HSTRING} 
     */
    ProviderStateLabel {
        get => this.get_ProviderStateLabel()
        set => this.put_ProviderStateLabel(value)
    }

    /**
     * The icon displayed in the Command Bar area of File Explorer when the current folder is backed by the provider.
     * @remarks
     * This property is advisory. Windows determines if or how it uses these values.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.providerstateicon
     * @type {Uri} 
     */
    ProviderStateIcon {
        get => this.get_ProviderStateIcon()
        set => this.put_ProviderStateIcon(value)
    }

    /**
     * The sync status command of [StorageProviderStatusUI](storageproviderstatusui.md).
     * @remarks
     * Windows may choose to disable Storage Provider Status UI if this property is not specified or empty.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.syncstatuscommand
     * @type {IStorageProviderUICommand} 
     */
    SyncStatusCommand {
        get => this.get_SyncStatusCommand()
        set => this.put_SyncStatusCommand(value)
    }

    /**
     * The [StorageProviderQuotaUI](storageproviderquotaui.md) of [StorageProviderStatusUI](storageproviderstatusui.md).
     * @remarks
     * This section will be collapsed unless the [StorageProviderQuotaUIQuotaUsedLabel](storageproviderquotaui_quotausedlabel.md) is non-empty. This ensures that enough context is given to the quota bar, whose percentage is defined by the fraction [StorageProviderQuotaUIQuotaUsedInBytes](storageproviderquotaui_quotausedinbytes.md) over [StorageProviderQuotaUIQuotaTotalInBytes](storageproviderquotaui_quotatotalinbytes.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.quotaui
     * @type {StorageProviderQuotaUI} 
     */
    QuotaUI {
        get => this.get_QuotaUI()
        set => this.put_QuotaUI(value)
    }

    /**
     * The container for the More Info UI section of the storage provider flyout, which offers additional information on the current sync state. This sync state is usually described by the [SyncStatusCommand](storageproviderstatusui_syncstatuscommand.md).
     * 
     * Furthermore, this section can be used to prompt the user to a specific action to address the sync state via the [MoreInfoUICommand](storageprovidermoreinfoui_command.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.moreinfoui
     * @type {StorageProviderMoreInfoUI} 
     */
    MoreInfoUI {
        get => this.get_MoreInfoUI()
        set => this.put_MoreInfoUI(value)
    }

    /**
     * The primary command that appears in the commands area of the storage provider status UI flyout.
     * @remarks
     * Windows will determine if the icon property ([IStorageProviderStatusUICommandIcon](istorageprovideruicommand_icon.md)) of this command is displayed.
     * 
     * Windows may choose to disable Storage Provider Status UI if neither this command nor [StorageProviderStatusUI.MoreInfoUI](storageprovidermoreinfoui_command.md) are specified.
     * 
     * Additionally, Windows may choose [MoreInfoUI.Command](storageprovidermoreinfoui_command.md) to take precedence over this command when both commands are present.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.providerprimarycommand
     * @type {IStorageProviderUICommand} 
     */
    ProviderPrimaryCommand {
        get => this.get_ProviderPrimaryCommand()
        set => this.put_ProviderPrimaryCommand(value)
    }

    /**
     * List of secondary commands that appear in the commands area of the storage provider status UI flyout.
     * @remarks
     * Windows may choose to disable Storage Provider Status UI if this property contains less than three non-empty secondary commands. This property currently supports displaying the first three secondary commands. Any command after the third element in this list will be ignored.
     * 
     * Additionally, the labels ([IStorageProviderUICommandLabel](istorageprovideruicommand_label.md)) of these commands are utilized for the tooltip and display the icons ([IStorageProviderStatusUICommandIcon](istorageprovideruicommand_icon.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageproviderstatusui.providersecondarycommands
     * @type {IVector<IStorageProviderUICommand>} 
     */
    ProviderSecondaryCommands {
        get => this.get_ProviderSecondaryCommands()
        set => this.put_ProviderSecondaryCommands(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * [StorageProviderStatusUI](storageproviderstatusui.md) default constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderStatusUI")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProviderState() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_ProviderState()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProviderState(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_ProviderState(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderStateLabel() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_ProviderStateLabel()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProviderStateLabel(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_ProviderStateLabel(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ProviderStateIcon() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_ProviderStateIcon()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ProviderStateIcon(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_ProviderStateIcon(value)
    }

    /**
     * 
     * @returns {IStorageProviderUICommand} 
     */
    get_SyncStatusCommand() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_SyncStatusCommand()
    }

    /**
     * 
     * @param {IStorageProviderUICommand} value 
     * @returns {HRESULT} 
     */
    put_SyncStatusCommand(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_SyncStatusCommand(value)
    }

    /**
     * 
     * @returns {StorageProviderQuotaUI} 
     */
    get_QuotaUI() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_QuotaUI()
    }

    /**
     * 
     * @param {StorageProviderQuotaUI} value 
     * @returns {HRESULT} 
     */
    put_QuotaUI(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_QuotaUI(value)
    }

    /**
     * 
     * @returns {StorageProviderMoreInfoUI} 
     */
    get_MoreInfoUI() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_MoreInfoUI()
    }

    /**
     * 
     * @param {StorageProviderMoreInfoUI} value 
     * @returns {HRESULT} 
     */
    put_MoreInfoUI(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_MoreInfoUI(value)
    }

    /**
     * 
     * @returns {IStorageProviderUICommand} 
     */
    get_ProviderPrimaryCommand() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_ProviderPrimaryCommand()
    }

    /**
     * 
     * @param {IStorageProviderUICommand} value 
     * @returns {HRESULT} 
     */
    put_ProviderPrimaryCommand(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_ProviderPrimaryCommand(value)
    }

    /**
     * 
     * @returns {IVector<IStorageProviderUICommand>} 
     */
    get_ProviderSecondaryCommands() {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.get_ProviderSecondaryCommands()
    }

    /**
     * 
     * @param {IVector<IStorageProviderUICommand>} value 
     * @returns {HRESULT} 
     */
    put_ProviderSecondaryCommands(value) {
        if (!this.HasProp("__IStorageProviderStatusUI")) {
            if ((queryResult := this.QueryInterface(IStorageProviderStatusUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderStatusUI := IStorageProviderStatusUI(outPtr)
        }

        return this.__IStorageProviderStatusUI.put_ProviderSecondaryCommands(value)
    }

;@endregion Instance Methods
}

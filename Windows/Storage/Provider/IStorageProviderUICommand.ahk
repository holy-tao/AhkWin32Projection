#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * UI Commands implemented by a storage provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideruicommand
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderUICommand extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderUICommand
     * @type {Guid}
     */
    static IID => Guid("{0c3e0760-d846-568f-9484-105cc57b502b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Label", "get_Description", "get_Icon", "get_State", "Invoke"]

    /**
     * Returns the [IStorageProviderUICommand](istorageprovideruicommand.md) label
     * @remarks
     * Depending on the placement of the command in the flyout, this label may appear on the command button itself or as a tooltip. As the flyout stands today, the following commands will display a label within the command button:
     * 
     * - [SyncStatusCommand](storageproviderstatusui_syncstatuscommand.md)
     * - [MoreInfoUICommand](storageproviderstatusui_moreinfoui.md)
     * - [ProviderPrimaryCommand](storageproviderstatusui_providerprimarycommand.md)
     * 
     * Each of the secondary commands, [ProviderSecondaryCommands](storageproviderstatusui_providersecondarycommands.md), will display the label as a tooltip.
     * 
     * For all of the commands, this label is read aloud by the screen reader.
     * 
     * Windows may choose to display "Hidden"-requested commands as "Disabled". This property must be specified and non-empty even if [IStorageProviderUICommand.State](istorageprovideruicommand_state.md) is Hidden.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideruicommand.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
    }

    /**
     * Returns the [IStorageProviderUICommand](istorageprovideruicommand.md) description.
     * @remarks
     * This member is not currently used in the status provider flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideruicommand.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Returns the [IStorageProviderUICommand](istorageprovideruicommand.md) icon URI, which is expected to be a fully-qualified local file path to an SVG file.
     * @remarks
     * Windows determines if the [SyncStatusCommand](storageproviderstatusui_syncstatuscommand.md), [ProviderSecondaryCommands](storageproviderstatusui_providersecondarycommands.md), [ProviderPrimaryCommand](storageproviderstatusui_providerprimarycommand.md), or [StorageProviderMoreInfoUI.Command](storageprovidermoreinfoui_command.md) can display icons.
     * 
     * Windows may choose to display "Hidden"-requested commands as "Disabled". This property must be specified and non-empty even if [IStorageProviderUICommand.State](istorageprovideruicommand_state.md) is Hidden.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideruicommand.icon
     * @type {Uri} 
     */
    Icon {
        get => this.get_Icon()
    }

    /**
     * Returns the [IStorageProviderUICommand](istorageprovideruicommand.md) state ([StorageProviderUICommandState](storageprovideruicommandstate.md))
     * @remarks
     * When the State is Disabled, the command will be visible but not click-able. When the State is Enabled, the command will be visible and click-able.
     * 
     * Windows may choose to display "Hidden"-requested commands as "Disabled". Those commands will be visible but not click-able.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideruicommand.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Icon() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Executes the [IStorageProviderUICommand](istorageprovideruicommand.md)'s action.
     * @remarks
     * The flyout will be dismissed when any enabled command (see [State](istorageprovideruicommand_state.md)) is invoked.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideruicommand.invoke
     */
    Invoke() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

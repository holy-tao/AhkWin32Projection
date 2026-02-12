#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include .\IStorageProviderUICommand.ahk
#Include .\StorageProviderQuotaUI.ahk
#Include .\StorageProviderMoreInfoUI.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The contract implemented by a cloud files provider, which is required to use the storage provider status UI flyout.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageproviderstatusuisource
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderStatusUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderStatusUI
     * @type {Guid}
     */
    static IID => Guid("{d6b6a758-198d-5b80-977f-5ff73da33118}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderState", "put_ProviderState", "get_ProviderStateLabel", "put_ProviderStateLabel", "get_ProviderStateIcon", "put_ProviderStateIcon", "get_SyncStatusCommand", "put_SyncStatusCommand", "get_QuotaUI", "put_QuotaUI", "get_MoreInfoUI", "put_MoreInfoUI", "get_ProviderPrimaryCommand", "put_ProviderPrimaryCommand", "get_ProviderSecondaryCommands", "put_ProviderSecondaryCommands"]

    /**
     * @type {Integer} 
     */
    ProviderState {
        get => this.get_ProviderState()
        set => this.put_ProviderState(value)
    }

    /**
     * @type {HSTRING} 
     */
    ProviderStateLabel {
        get => this.get_ProviderStateLabel()
        set => this.put_ProviderStateLabel(value)
    }

    /**
     * @type {Uri} 
     */
    ProviderStateIcon {
        get => this.get_ProviderStateIcon()
        set => this.put_ProviderStateIcon(value)
    }

    /**
     * @type {IStorageProviderUICommand} 
     */
    SyncStatusCommand {
        get => this.get_SyncStatusCommand()
        set => this.put_SyncStatusCommand(value)
    }

    /**
     * @type {StorageProviderQuotaUI} 
     */
    QuotaUI {
        get => this.get_QuotaUI()
        set => this.put_QuotaUI(value)
    }

    /**
     * @type {StorageProviderMoreInfoUI} 
     */
    MoreInfoUI {
        get => this.get_MoreInfoUI()
        set => this.put_MoreInfoUI(value)
    }

    /**
     * @type {IStorageProviderUICommand} 
     */
    ProviderPrimaryCommand {
        get => this.get_ProviderPrimaryCommand()
        set => this.put_ProviderPrimaryCommand(value)
    }

    /**
     * @type {IVector<IStorageProviderUICommand>} 
     */
    ProviderSecondaryCommands {
        get => this.get_ProviderSecondaryCommands()
        set => this.put_ProviderSecondaryCommands(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProviderState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProviderState(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderStateLabel() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProviderStateLabel(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ProviderStateIcon() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ProviderStateIcon(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IStorageProviderUICommand} 
     */
    get_SyncStatusCommand() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageProviderUICommand(value)
    }

    /**
     * 
     * @param {IStorageProviderUICommand} value 
     * @returns {HRESULT} 
     */
    put_SyncStatusCommand(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StorageProviderQuotaUI} 
     */
    get_QuotaUI() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderQuotaUI(value)
    }

    /**
     * 
     * @param {StorageProviderQuotaUI} value 
     * @returns {HRESULT} 
     */
    put_QuotaUI(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StorageProviderMoreInfoUI} 
     */
    get_MoreInfoUI() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderMoreInfoUI(value)
    }

    /**
     * 
     * @param {StorageProviderMoreInfoUI} value 
     * @returns {HRESULT} 
     */
    put_MoreInfoUI(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IStorageProviderUICommand} 
     */
    get_ProviderPrimaryCommand() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageProviderUICommand(value)
    }

    /**
     * 
     * @param {IStorageProviderUICommand} value 
     * @returns {HRESULT} 
     */
    put_ProviderPrimaryCommand(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<IStorageProviderUICommand>} 
     */
    get_ProviderSecondaryCommands() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IStorageProviderUICommand, value)
    }

    /**
     * 
     * @param {IVector<IStorageProviderUICommand>} value 
     * @returns {HRESULT} 
     */
    put_ProviderSecondaryCommands(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IChatSyncManager.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the syncing of chat messages.
 * @remarks
 * This class is retrieved by calling [RequestSyncManagerAsync](chatmessagemanager_requestsyncmanagerasync_1572900658.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncmanager
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class ChatSyncManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IChatSyncManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IChatSyncManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The configuration properties of the sync manager.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncmanager.configuration
     * @type {ChatSyncConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ChatSyncConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IChatSyncManager")) {
            if ((queryResult := this.QueryInterface(IChatSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncManager := IChatSyncManager(outPtr)
        }

        return this.__IChatSyncManager.get_Configuration()
    }

    /**
     * Sets the [WebAccount](../windows.security.credentials/webaccount.md), which will be used by the sync manager to sync messages.
     * @param {WebAccount} webAccount_ The web account.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncmanager.associateaccountasync
     */
    AssociateAccountAsync(webAccount_) {
        if (!this.HasProp("__IChatSyncManager")) {
            if ((queryResult := this.QueryInterface(IChatSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncManager := IChatSyncManager(outPtr)
        }

        return this.__IChatSyncManager.AssociateAccountAsync(webAccount_)
    }

    /**
     * Clears the account information and stops the sync manager from syncing messages. This will trigger a message deletion operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncmanager.unassociateaccountasync
     */
    UnassociateAccountAsync() {
        if (!this.HasProp("__IChatSyncManager")) {
            if ((queryResult := this.QueryInterface(IChatSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncManager := IChatSyncManager(outPtr)
        }

        return this.__IChatSyncManager.UnassociateAccountAsync()
    }

    /**
     * Checks if a specific [WebAccount](../windows.security.credentials/webaccount.md) is the account used by the sync manager to sync messages.
     * @param {WebAccount} webAccount_ The web account.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncmanager.isaccountassociated
     */
    IsAccountAssociated(webAccount_) {
        if (!this.HasProp("__IChatSyncManager")) {
            if ((queryResult := this.QueryInterface(IChatSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncManager := IChatSyncManager(outPtr)
        }

        return this.__IChatSyncManager.IsAccountAssociated(webAccount_)
    }

    /**
     * Starts a new sync operation without waiting for the sync to finish.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncmanager.startsync
     */
    StartSync() {
        if (!this.HasProp("__IChatSyncManager")) {
            if ((queryResult := this.QueryInterface(IChatSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncManager := IChatSyncManager(outPtr)
        }

        return this.__IChatSyncManager.StartSync()
    }

    /**
     * Sets the configuration properties of the sync manager.
     * @param {ChatSyncConfiguration} configuration The configuration.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.chatsyncmanager.setconfigurationasync
     */
    SetConfigurationAsync(configuration) {
        if (!this.HasProp("__IChatSyncManager")) {
            if ((queryResult := this.QueryInterface(IChatSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IChatSyncManager := IChatSyncManager(outPtr)
        }

        return this.__IChatSyncManager.SetConfigurationAsync(configuration)
    }

;@endregion Instance Methods
}

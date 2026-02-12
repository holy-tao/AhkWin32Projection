#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxSyncManager.ahk
#Include .\IEmailMailboxSyncManager2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\EmailMailboxSyncManager.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * The functionality described in this topic is not available to all UWP apps. As part of the store app submission process, Microsoft must approve your use of these APIs and provision your developer account before you can publish an app that uses them.
  * 
  * For more information about the [Windows.ApplicationModel.Email](windows_applicationmodel_email.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * The **SyncManager** property provides access to an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsyncmanager
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailMailboxSyncManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxSyncManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxSyncManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the sync state of the mailbox.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsyncmanager.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets or sets the last time the mailbox was successfully synced.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsyncmanager.lastsuccessfulsynctime
     * @type {DateTime} 
     */
    LastSuccessfulSyncTime {
        get => this.get_LastSuccessfulSyncTime()
        set => this.put_LastSuccessfulSyncTime(value)
    }

    /**
     * Gets or sets the last time the mailbox attempted to sync.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsyncmanager.lastattemptedsynctime
     * @type {DateTime} 
     */
    LastAttemptedSyncTime {
        get => this.get_LastAttemptedSyncTime()
        set => this.put_LastAttemptedSyncTime(value)
    }

    /**
     * Fires whenever a mailbox's sync status changes.
     * @type {TypedEventHandler<EmailMailboxSyncManager, IInspectable>}
    */
    OnSyncStatusChanged {
        get {
            if(!this.HasProp("__OnSyncStatusChanged")){
                this.__OnSyncStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5cbe61bb-d615-5b82-bb11-412e32664c07}"),
                    EmailMailboxSyncManager,
                    IInspectable
                )
                this.__OnSyncStatusChangedToken := this.add_SyncStatusChanged(this.__OnSyncStatusChanged.iface)
            }
            return this.__OnSyncStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSyncStatusChangedToken")) {
            this.remove_SyncStatusChanged(this.__OnSyncStatusChangedToken)
            this.__OnSyncStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IEmailMailboxSyncManager")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager := IEmailMailboxSyncManager(outPtr)
        }

        return this.__IEmailMailboxSyncManager.get_Status()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSuccessfulSyncTime() {
        if (!this.HasProp("__IEmailMailboxSyncManager")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager := IEmailMailboxSyncManager(outPtr)
        }

        return this.__IEmailMailboxSyncManager.get_LastSuccessfulSyncTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastAttemptedSyncTime() {
        if (!this.HasProp("__IEmailMailboxSyncManager")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager := IEmailMailboxSyncManager(outPtr)
        }

        return this.__IEmailMailboxSyncManager.get_LastAttemptedSyncTime()
    }

    /**
     * Initiates a sync of this mailbox.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailmailboxsyncmanager.syncasync
     */
    SyncAsync() {
        if (!this.HasProp("__IEmailMailboxSyncManager")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager := IEmailMailboxSyncManager(outPtr)
        }

        return this.__IEmailMailboxSyncManager.SyncAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<EmailMailboxSyncManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncStatusChanged(handler) {
        if (!this.HasProp("__IEmailMailboxSyncManager")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager := IEmailMailboxSyncManager(outPtr)
        }

        return this.__IEmailMailboxSyncManager.add_SyncStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SyncStatusChanged(token) {
        if (!this.HasProp("__IEmailMailboxSyncManager")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager := IEmailMailboxSyncManager(outPtr)
        }

        return this.__IEmailMailboxSyncManager.remove_SyncStatusChanged(token)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IEmailMailboxSyncManager2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager2 := IEmailMailboxSyncManager2(outPtr)
        }

        return this.__IEmailMailboxSyncManager2.put_Status(value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastSuccessfulSyncTime(value) {
        if (!this.HasProp("__IEmailMailboxSyncManager2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager2 := IEmailMailboxSyncManager2(outPtr)
        }

        return this.__IEmailMailboxSyncManager2.put_LastSuccessfulSyncTime(value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastAttemptedSyncTime(value) {
        if (!this.HasProp("__IEmailMailboxSyncManager2")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxSyncManager2 := IEmailMailboxSyncManager2(outPtr)
        }

        return this.__IEmailMailboxSyncManager2.put_LastAttemptedSyncTime(value)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListSyncManager.ahk
#Include .\IContactListSyncManager2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ContactListSyncManager.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides functionality for syncing contact information with the server.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncmanager
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactListSyncManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListSyncManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListSyncManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [ContactListSyncStatus](contactlistsyncstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncmanager.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets or sets the last time the [ContactList](contactlist.md) was successfully synced with the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncmanager.lastsuccessfulsynctime
     * @type {DateTime} 
     */
    LastSuccessfulSyncTime {
        get => this.get_LastSuccessfulSyncTime()
        set => this.put_LastSuccessfulSyncTime(value)
    }

    /**
     * Gets or sets the last time a sync was attempted with the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncmanager.lastattemptedsynctime
     * @type {DateTime} 
     */
    LastAttemptedSyncTime {
        get => this.get_LastAttemptedSyncTime()
        set => this.put_LastAttemptedSyncTime(value)
    }

    /**
     * Occurs when the sync status with the server has changed.
     * @type {TypedEventHandler<ContactListSyncManager, IInspectable>}
    */
    OnSyncStatusChanged {
        get {
            if(!this.HasProp("__OnSyncStatusChanged")){
                this.__OnSyncStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f0c4ce23-4e80-5cb1-9f43-fbdc1c609122}"),
                    ContactListSyncManager,
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
        if (!this.HasProp("__IContactListSyncManager")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager := IContactListSyncManager(outPtr)
        }

        return this.__IContactListSyncManager.get_Status()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSuccessfulSyncTime() {
        if (!this.HasProp("__IContactListSyncManager")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager := IContactListSyncManager(outPtr)
        }

        return this.__IContactListSyncManager.get_LastSuccessfulSyncTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastAttemptedSyncTime() {
        if (!this.HasProp("__IContactListSyncManager")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager := IContactListSyncManager(outPtr)
        }

        return this.__IContactListSyncManager.get_LastAttemptedSyncTime()
    }

    /**
     * Asynchronously attempts to sync with the contacts server.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistsyncmanager.syncasync
     */
    SyncAsync() {
        if (!this.HasProp("__IContactListSyncManager")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager := IContactListSyncManager(outPtr)
        }

        return this.__IContactListSyncManager.SyncAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<ContactListSyncManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncStatusChanged(handler) {
        if (!this.HasProp("__IContactListSyncManager")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager := IContactListSyncManager(outPtr)
        }

        return this.__IContactListSyncManager.add_SyncStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SyncStatusChanged(token) {
        if (!this.HasProp("__IContactListSyncManager")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager := IContactListSyncManager(outPtr)
        }

        return this.__IContactListSyncManager.remove_SyncStatusChanged(token)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IContactListSyncManager2")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager2 := IContactListSyncManager2(outPtr)
        }

        return this.__IContactListSyncManager2.put_Status(value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastSuccessfulSyncTime(value) {
        if (!this.HasProp("__IContactListSyncManager2")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager2 := IContactListSyncManager2(outPtr)
        }

        return this.__IContactListSyncManager2.put_LastSuccessfulSyncTime(value)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastAttemptedSyncTime(value) {
        if (!this.HasProp("__IContactListSyncManager2")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManager2 := IContactListSyncManager2(outPtr)
        }

        return this.__IContactListSyncManager2.put_LastAttemptedSyncTime(value)
    }

;@endregion Instance Methods
}

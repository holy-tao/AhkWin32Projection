#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactDataProviderConnection.ahk
#Include .\IContactDataProviderConnection2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ContactDataProviderConnection.ahk
#Include .\ContactListSyncManagerSyncRequestEventArgs.ahk
#Include .\ContactListServerSearchReadBatchRequestEventArgs.ahk
#Include .\ContactListCreateOrUpdateContactRequestEventArgs.ahk
#Include .\ContactListDeleteContactRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a connection to a data provider client.
 * @remarks
 * Use the instance of this class provided by the [Connection](contactdataprovidertriggerdetails_connection.md) property of the [ContactDataProviderTriggerDetails](contactdataprovidertriggerdetails.md) object passed to your background task on activation.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactdataproviderconnection
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactDataProviderConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactDataProviderConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactDataProviderConnection.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSyncRequestedToken")) {
            this.remove_SyncRequested(this.__OnSyncRequestedToken)
            this.__OnSyncRequested.iface.Dispose()
        }

        if(this.HasProp("__OnServerSearchReadBatchRequestedToken")) {
            this.remove_ServerSearchReadBatchRequested(this.__OnServerSearchReadBatchRequestedToken)
            this.__OnServerSearchReadBatchRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCreateOrUpdateContactRequestedToken")) {
            this.remove_CreateOrUpdateContactRequested(this.__OnCreateOrUpdateContactRequestedToken)
            this.__OnCreateOrUpdateContactRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDeleteContactRequestedToken")) {
            this.remove_DeleteContactRequested(this.__OnDeleteContactRequestedToken)
            this.__OnDeleteContactRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<ContactDataProviderConnection, ContactListSyncManagerSyncRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncRequested(handler) {
        if (!this.HasProp("__IContactDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection := IContactDataProviderConnection(outPtr)
        }

        return this.__IContactDataProviderConnection.add_SyncRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SyncRequested(token) {
        if (!this.HasProp("__IContactDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection := IContactDataProviderConnection(outPtr)
        }

        return this.__IContactDataProviderConnection.remove_SyncRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ContactDataProviderConnection, ContactListServerSearchReadBatchRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ServerSearchReadBatchRequested(handler) {
        if (!this.HasProp("__IContactDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection := IContactDataProviderConnection(outPtr)
        }

        return this.__IContactDataProviderConnection.add_ServerSearchReadBatchRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ServerSearchReadBatchRequested(token) {
        if (!this.HasProp("__IContactDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection := IContactDataProviderConnection(outPtr)
        }

        return this.__IContactDataProviderConnection.remove_ServerSearchReadBatchRequested(token)
    }

    /**
     * Call this method to indicate that all event handlers have been set and the data provider is ready to start handling requests.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactdataproviderconnection.start
     */
    Start() {
        if (!this.HasProp("__IContactDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection := IContactDataProviderConnection(outPtr)
        }

        return this.__IContactDataProviderConnection.Start()
    }

    /**
     * 
     * @param {TypedEventHandler<ContactDataProviderConnection, ContactListCreateOrUpdateContactRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CreateOrUpdateContactRequested(handler) {
        if (!this.HasProp("__IContactDataProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection2 := IContactDataProviderConnection2(outPtr)
        }

        return this.__IContactDataProviderConnection2.add_CreateOrUpdateContactRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CreateOrUpdateContactRequested(token) {
        if (!this.HasProp("__IContactDataProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection2 := IContactDataProviderConnection2(outPtr)
        }

        return this.__IContactDataProviderConnection2.remove_CreateOrUpdateContactRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ContactDataProviderConnection, ContactListDeleteContactRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DeleteContactRequested(handler) {
        if (!this.HasProp("__IContactDataProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection2 := IContactDataProviderConnection2(outPtr)
        }

        return this.__IContactDataProviderConnection2.add_DeleteContactRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DeleteContactRequested(token) {
        if (!this.HasProp("__IContactDataProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderConnection2 := IContactDataProviderConnection2(outPtr)
        }

        return this.__IContactDataProviderConnection2.remove_DeleteContactRequested(token)
    }

;@endregion Instance Methods
}

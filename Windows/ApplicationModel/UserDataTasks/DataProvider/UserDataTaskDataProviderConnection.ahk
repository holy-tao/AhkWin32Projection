#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskDataProviderConnection.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\UserDataTaskDataProviderConnection.ahk
#Include .\UserDataTaskListCreateOrUpdateTaskRequestEventArgs.ahk
#Include .\UserDataTaskListSyncManagerSyncRequestEventArgs.ahk
#Include .\UserDataTaskListSkipOccurrenceRequestEventArgs.ahk
#Include .\UserDataTaskListCompleteTaskRequestEventArgs.ahk
#Include .\UserDataTaskListDeleteTaskRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a connection to a data provider client.
 * @remarks
 * Use the instance of this class provided by the [Connection](userdatataskdataprovidertriggerdetails_connection.md) property of the [UserDataTaskDataProviderTriggerDetails](userdatataskdataprovidertriggerdetails.md) object passed to your background task on activation.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatataskdataproviderconnection
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskDataProviderConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskDataProviderConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskDataProviderConnection.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCreateOrUpdateTaskRequestedToken")) {
            this.remove_CreateOrUpdateTaskRequested(this.__OnCreateOrUpdateTaskRequestedToken)
            this.__OnCreateOrUpdateTaskRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSyncRequestedToken")) {
            this.remove_SyncRequested(this.__OnSyncRequestedToken)
            this.__OnSyncRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSkipOccurrenceRequestedToken")) {
            this.remove_SkipOccurrenceRequested(this.__OnSkipOccurrenceRequestedToken)
            this.__OnSkipOccurrenceRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCompleteTaskRequestedToken")) {
            this.remove_CompleteTaskRequested(this.__OnCompleteTaskRequestedToken)
            this.__OnCompleteTaskRequested.iface.Dispose()
        }

        if(this.HasProp("__OnDeleteTaskRequestedToken")) {
            this.remove_DeleteTaskRequested(this.__OnDeleteTaskRequestedToken)
            this.__OnDeleteTaskRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataTaskDataProviderConnection, UserDataTaskListCreateOrUpdateTaskRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CreateOrUpdateTaskRequested(handler) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.add_CreateOrUpdateTaskRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CreateOrUpdateTaskRequested(token) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.remove_CreateOrUpdateTaskRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataTaskDataProviderConnection, UserDataTaskListSyncManagerSyncRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncRequested(handler) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.add_SyncRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SyncRequested(token) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.remove_SyncRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataTaskDataProviderConnection, UserDataTaskListSkipOccurrenceRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SkipOccurrenceRequested(handler) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.add_SkipOccurrenceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SkipOccurrenceRequested(token) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.remove_SkipOccurrenceRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataTaskDataProviderConnection, UserDataTaskListCompleteTaskRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompleteTaskRequested(handler) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.add_CompleteTaskRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CompleteTaskRequested(token) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.remove_CompleteTaskRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataTaskDataProviderConnection, UserDataTaskListDeleteTaskRequestEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DeleteTaskRequested(handler) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.add_DeleteTaskRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DeleteTaskRequested(token) {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.remove_DeleteTaskRequested(token)
    }

    /**
     * Call this method to indicate that all event handlers have been set and the data provider is ready to start handling requests.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatataskdataproviderconnection.start
     */
    Start() {
        if (!this.HasProp("__IUserDataTaskDataProviderConnection")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderConnection := IUserDataTaskDataProviderConnection(outPtr)
        }

        return this.__IUserDataTaskDataProviderConnection.Start()
    }

;@endregion Instance Methods
}

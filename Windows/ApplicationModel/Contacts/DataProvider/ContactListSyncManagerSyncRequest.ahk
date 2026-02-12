#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListSyncManagerSyncRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request from a client to sync a contact list.
 * @remarks
 * Used in your [SyncRequested](contactdataproviderconnection_syncrequested.md) event handler. Use the instance of this class that's returned by the [ContactListSyncManagerSyncRequestEventArgs.Request](contactlistsyncmanagersyncrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistsyncmanagersyncrequest
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactListSyncManagerSyncRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListSyncManagerSyncRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListSyncManagerSyncRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the contact list ID of the contact list to be synched.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistsyncmanagersyncrequest.contactlistid
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
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
    get_ContactListId() {
        if (!this.HasProp("__IContactListSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManagerSyncRequest := IContactListSyncManagerSyncRequest(outPtr)
        }

        return this.__IContactListSyncManagerSyncRequest.get_ContactListId()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistsyncmanagersyncrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IContactListSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManagerSyncRequest := IContactListSyncManagerSyncRequest(outPtr)
        }

        return this.__IContactListSyncManagerSyncRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistsyncmanagersyncrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IContactListSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IContactListSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListSyncManagerSyncRequest := IContactListSyncManagerSyncRequest(outPtr)
        }

        return this.__IContactListSyncManagerSyncRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}

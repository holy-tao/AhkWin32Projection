#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListServerSearchReadBatchRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to read a batch of server-side search results.
 * @remarks
 * Used in your [ServerSearchReadBatchRequested](contactdataproviderconnection_serversearchreadbatchrequested.md) event handler. Use the instance of this class that's returned by the [ContactListServerSearchReadBatchRequestEventArgs.Request](contactlistserversearchreadbatchrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactListServerSearchReadBatchRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListServerSearchReadBatchRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListServerSearchReadBatchRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the search session ID of this batch read request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest.sessionid
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * Gets the contact list ID of the contact list to be searched.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest.contactlistid
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
    }

    /**
     * Gets the search options to be applied in this search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest.options
     * @type {ContactQueryOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * Gets the suggested batch size for the server-side search batch read.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest.suggestedbatchsize
     * @type {Integer} 
     */
    SuggestedBatchSize {
        get => this.get_SuggestedBatchSize()
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
    get_SessionId() {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequest := IContactListServerSearchReadBatchRequest(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequest.get_SessionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactListId() {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequest := IContactListServerSearchReadBatchRequest(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequest.get_ContactListId()
    }

    /**
     * 
     * @returns {ContactQueryOptions} 
     */
    get_Options() {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequest := IContactListServerSearchReadBatchRequest(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequest.get_Options()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestedBatchSize() {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequest := IContactListServerSearchReadBatchRequest(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequest.get_SuggestedBatchSize()
    }

    /**
     * Asynchronously saves a contact that meets server-side search criteria.
     * 
     * When a server-side search is requested, the data provider performs the search, calls SaveContactAsync on each contact found, and then calls [ReportCompletedAsync.](contactlistserversearchreadbatchrequest_reportcompletedasync_1707664681.md)
     * @param {Contact} contact_ A [Contact](../windows.applicationmodel.contacts/contact.md) that meets the search criteria.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest.savecontactasync
     */
    SaveContactAsync(contact_) {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequest := IContactListServerSearchReadBatchRequest(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequest.SaveContactAsync(contact_)
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequest := IContactListServerSearchReadBatchRequest(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @param {Integer} batchStatus A [ContactBatchStatus](../windows.applicationmodel.contacts/contactbatchstatus.md) value describing the reason for the failure.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistserversearchreadbatchrequest.reportfailedasync
     */
    ReportFailedAsync(batchStatus) {
        if (!this.HasProp("__IContactListServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IContactListServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListServerSearchReadBatchRequest := IContactListServerSearchReadBatchRequest(outPtr)
        }

        return this.__IContactListServerSearchReadBatchRequest.ReportFailedAsync(batchStatus)
    }

;@endregion Instance Methods
}

#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxServerSearchReadBatchRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to read a batch of server-side search results.
 * @remarks
 * Used in your [ServerSearchReadBatchRequested](emaildataproviderconnection_serversearchreadbatchrequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxServerSearchReadBatchRequestEventArgs.Request](emailmailboxserversearchreadbatchrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxServerSearchReadBatchRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxServerSearchReadBatchRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxServerSearchReadBatchRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the search session ID of this server-side batch read request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.sessionid
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * Gets the mailbox ID of the mailbox where the search is to be performed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the folder ID of the folder where the search is to be performed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.emailfolderid
     * @type {HSTRING} 
     */
    EmailFolderId {
        get => this.get_EmailFolderId()
    }

    /**
     * Gets the search options to be applied to this search.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.options
     * @type {EmailQueryOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * Gets the suggested batch size for the server-side search batch read.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.suggestedbatchsize
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
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.get_SessionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMailboxId() {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailFolderId() {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.get_EmailFolderId()
    }

    /**
     * 
     * @returns {EmailQueryOptions} 
     */
    get_Options() {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.get_Options()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestedBatchSize() {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.get_SuggestedBatchSize()
    }

    /**
     * Saves a message that meets server-side search criteria.
     * @param {EmailMessage} message A message that matches the search criteria of a server-side batch read request.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.savemessageasync
     */
    SaveMessageAsync(message) {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.SaveMessageAsync(message)
    }

    /**
     * Informs the email client that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @param {Integer} batchStatus An [EmailBatchStatus](../windows.applicationmodel.email/emailbatchstatus.md) value describing the current status of the batch.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxserversearchreadbatchrequest.reportfailedasync
     */
    ReportFailedAsync(batchStatus) {
        if (!this.HasProp("__IEmailMailboxServerSearchReadBatchRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxServerSearchReadBatchRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxServerSearchReadBatchRequest := IEmailMailboxServerSearchReadBatchRequest(outPtr)
        }

        return this.__IEmailMailboxServerSearchReadBatchRequest.ReportFailedAsync(batchStatus)
    }

;@endregion Instance Methods
}

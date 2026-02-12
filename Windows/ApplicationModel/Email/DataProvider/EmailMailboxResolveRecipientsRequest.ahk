#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxResolveRecipientsRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to resolve a list of recipients.
 * @remarks
 * Used in your [ResolveRecipientsRequested](emaildataproviderconnection_resolverecipientsrequested.md) event handler. Use the instance of this class that's returned by the [EmailMailboxResolveRecipientesRequestEventArgs.Request](emailmailboxresolverecipientsrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxResolveRecipientsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxResolveRecipientsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxResolveRecipientsRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID where the recipients should be resolved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the list of recipients to be resolved.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequest.recipients
     * @type {IVectorView<HSTRING>} 
     */
    Recipients {
        get => this.get_Recipients()
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
    get_EmailMailboxId() {
        if (!this.HasProp("__IEmailMailboxResolveRecipientsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxResolveRecipientsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxResolveRecipientsRequest := IEmailMailboxResolveRecipientsRequest(outPtr)
        }

        return this.__IEmailMailboxResolveRecipientsRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Recipients() {
        if (!this.HasProp("__IEmailMailboxResolveRecipientsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxResolveRecipientsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxResolveRecipientsRequest := IEmailMailboxResolveRecipientsRequest(outPtr)
        }

        return this.__IEmailMailboxResolveRecipientsRequest.get_Recipients()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the recipient list was processed successfully. Note, though, that this does not mean that all of the names have been successfully resolved. Your code must check the status of each [EmailRecipientResolutionResult](../windows.applicationmodel.email/emailrecipientresolutionresult.md) item in the *resolutionResults* list to determine whether all of the names have been successfully resolved..
     * @param {IIterable<EmailRecipientResolutionResult>} resolutionResults A list of [EmailRecipientResolutionResult](../windows.applicationmodel.email/emailrecipientresolutionresult.md) objects with details about resolution results.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequest.reportcompletedasync
     */
    ReportCompletedAsync(resolutionResults) {
        if (!this.HasProp("__IEmailMailboxResolveRecipientsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxResolveRecipientsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxResolveRecipientsRequest := IEmailMailboxResolveRecipientsRequest(outPtr)
        }

        return this.__IEmailMailboxResolveRecipientsRequest.ReportCompletedAsync(resolutionResults)
    }

    /**
     * Informs the client that the request was not processed successfully. Note that this means the operation failed to execute properly, and does not indicate anything about the recipients. See [ReportCompletedAsync](emailmailboxresolverecipientsrequest_reportcompletedasync_1028965796.md) to understand how success or failure of resolution for individual recipients is reported.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxresolverecipientsrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxResolveRecipientsRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxResolveRecipientsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxResolveRecipientsRequest := IEmailMailboxResolveRecipientsRequest(outPtr)
        }

        return this.__IEmailMailboxResolveRecipientsRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}

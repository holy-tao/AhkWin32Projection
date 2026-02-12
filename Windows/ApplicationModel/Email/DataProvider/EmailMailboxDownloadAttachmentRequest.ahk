#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxDownloadAttachmentRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to download an attachment.
 * @remarks
 * Used in your [DownloadAttachmentRequest](emaildataproviderconnection_downloadattachmentrequested.md) event handler. Use the instance of this class returned by the [EmailMailboxDownloadAttachmentRequestEventArgs.Request](emailmailboxdownloadattachmentrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxDownloadAttachmentRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxDownloadAttachmentRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxDownloadAttachmentRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the email mailbox ID.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the email message ID of the message associated with the attachment.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequest.emailmessageid
     * @type {HSTRING} 
     */
    EmailMessageId {
        get => this.get_EmailMessageId()
    }

    /**
     * Gets the attachment ID of the attachment to be downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequest.emailattachmentid
     * @type {HSTRING} 
     */
    EmailAttachmentId {
        get => this.get_EmailAttachmentId()
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
        if (!this.HasProp("__IEmailMailboxDownloadAttachmentRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadAttachmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadAttachmentRequest := IEmailMailboxDownloadAttachmentRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadAttachmentRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMessageId() {
        if (!this.HasProp("__IEmailMailboxDownloadAttachmentRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadAttachmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadAttachmentRequest := IEmailMailboxDownloadAttachmentRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadAttachmentRequest.get_EmailMessageId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailAttachmentId() {
        if (!this.HasProp("__IEmailMailboxDownloadAttachmentRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadAttachmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadAttachmentRequest := IEmailMailboxDownloadAttachmentRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadAttachmentRequest.get_EmailAttachmentId()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the attachment was downloaded successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxDownloadAttachmentRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadAttachmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadAttachmentRequest := IEmailMailboxDownloadAttachmentRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadAttachmentRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadattachmentrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxDownloadAttachmentRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadAttachmentRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadAttachmentRequest := IEmailMailboxDownloadAttachmentRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadAttachmentRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}

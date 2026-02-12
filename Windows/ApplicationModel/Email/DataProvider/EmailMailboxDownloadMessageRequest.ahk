#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxDownloadMessageRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to download an email message.
 * @remarks
 * Used in your [DownloadMessageRequest](emaildataproviderconnection_downloadmessagerequested.md) event handler. Use the instance of this class returned by the [EmailMailboxDownloadMessageRequestEventArgs.Request](emailmailboxdownloadmessagerequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxDownloadMessageRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxDownloadMessageRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxDownloadMessageRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID for the mailbox that holds the message to be downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the message ID of the message to be downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequest.emailmessageid
     * @type {HSTRING} 
     */
    EmailMessageId {
        get => this.get_EmailMessageId()
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
        if (!this.HasProp("__IEmailMailboxDownloadMessageRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadMessageRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadMessageRequest := IEmailMailboxDownloadMessageRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadMessageRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMessageId() {
        if (!this.HasProp("__IEmailMailboxDownloadMessageRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadMessageRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadMessageRequest := IEmailMailboxDownloadMessageRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadMessageRequest.get_EmailMessageId()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the message was downloaded successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxDownloadMessageRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadMessageRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadMessageRequest := IEmailMailboxDownloadMessageRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadMessageRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdownloadmessagerequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IEmailMailboxDownloadMessageRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDownloadMessageRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDownloadMessageRequest := IEmailMailboxDownloadMessageRequest(outPtr)
        }

        return this.__IEmailMailboxDownloadMessageRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}

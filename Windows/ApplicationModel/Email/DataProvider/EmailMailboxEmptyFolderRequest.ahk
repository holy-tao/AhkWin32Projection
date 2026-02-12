#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxEmptyFolderRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to download an email message.
 * @remarks
 * Used in your [EmptyFolderRequested](emaildataproviderconnection_emptyfolderrequested.md) event handler. Use the instance of this class returned by the [EmailMailboxEmptyFolderRequestEventArgs.Request](emailmailboxemptyfolderrequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxEmptyFolderRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxEmptyFolderRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxEmptyFolderRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox ID of the mailbox that holds the folder.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the folder ID of the folder to be emptied.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequest.emailfolderid
     * @type {HSTRING} 
     */
    EmailFolderId {
        get => this.get_EmailFolderId()
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
        if (!this.HasProp("__IEmailMailboxEmptyFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxEmptyFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxEmptyFolderRequest := IEmailMailboxEmptyFolderRequest(outPtr)
        }

        return this.__IEmailMailboxEmptyFolderRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailFolderId() {
        if (!this.HasProp("__IEmailMailboxEmptyFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxEmptyFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxEmptyFolderRequest := IEmailMailboxEmptyFolderRequest(outPtr)
        }

        return this.__IEmailMailboxEmptyFolderRequest.get_EmailFolderId()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the folder was emptied successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxEmptyFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxEmptyFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxEmptyFolderRequest := IEmailMailboxEmptyFolderRequest(outPtr)
        }

        return this.__IEmailMailboxEmptyFolderRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * 
     * On the successful completion of the async operation, the status parameter is set to the current status of the folder in question.
     * @param {Integer} status_ The status of the folder, following the failed attempt to empty it.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxemptyfolderrequest.reportfailedasync
     */
    ReportFailedAsync(status_) {
        if (!this.HasProp("__IEmailMailboxEmptyFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxEmptyFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxEmptyFolderRequest := IEmailMailboxEmptyFolderRequest(outPtr)
        }

        return this.__IEmailMailboxEmptyFolderRequest.ReportFailedAsync(status_)
    }

;@endregion Instance Methods
}

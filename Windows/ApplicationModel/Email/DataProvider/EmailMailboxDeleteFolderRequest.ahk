#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailMailboxDeleteFolderRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to delete a folder.
 * @remarks
 * Used in your [DeleteFolderRequested](emaildataproviderconnection_deletefolderrequested.md) event handler. Use the instance of this class returned by the [EmailMailboxDeleteFolderRequestEventArgs.Request](emailmailboxdownloadmessagerequesteventargs_request.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequest
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailMailboxDeleteFolderRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailMailboxDeleteFolderRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailMailboxDeleteFolderRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the mailbox identifier for the mailbox where the folder will be deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequest.emailmailboxid
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * Gets the folder ID of the folder to be deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequest.emailfolderid
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
        if (!this.HasProp("__IEmailMailboxDeleteFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDeleteFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDeleteFolderRequest := IEmailMailboxDeleteFolderRequest(outPtr)
        }

        return this.__IEmailMailboxDeleteFolderRequest.get_EmailMailboxId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailFolderId() {
        if (!this.HasProp("__IEmailMailboxDeleteFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDeleteFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDeleteFolderRequest := IEmailMailboxDeleteFolderRequest(outPtr)
        }

        return this.__IEmailMailboxDeleteFolderRequest.get_EmailFolderId()
    }

    /**
     * Informs the email client that the request was processed successfully.
     * 
     * Successful completion of the asynchronous operation indicates that the folder was deleted successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IEmailMailboxDeleteFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDeleteFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDeleteFolderRequest := IEmailMailboxDeleteFolderRequest(outPtr)
        }

        return this.__IEmailMailboxDeleteFolderRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * 
     * Successful completion of the asynchronous action indicates that the status parameter's value reports the reason for failure.
     * @param {Integer} status_ A [EmailMailboxDeleteFolderStatus](../windows.applicationmodel.email/emailmailboxdeletefolderstatus.md) value indicating why the operation failed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emailmailboxdeletefolderrequest.reportfailedasync
     */
    ReportFailedAsync(status_) {
        if (!this.HasProp("__IEmailMailboxDeleteFolderRequest")) {
            if ((queryResult := this.QueryInterface(IEmailMailboxDeleteFolderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailMailboxDeleteFolderRequest := IEmailMailboxDeleteFolderRequest(outPtr)
        }

        return this.__IEmailMailboxDeleteFolderRequest.ReportFailedAsync(status_)
    }

;@endregion Instance Methods
}
